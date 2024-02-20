import 'dart:io';

import 'package:covid_traking/features/home/presenter/controllers/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  void initState() {
    super.initState();
    homeStore.getDeviceInformationsData(Platform.isAndroid);
    homeStore.getCurrentCovidInfos();
  }

  @override
  void dispose() {
    homeStore.redirect = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            HeaderHome(homeStore: homeStore),
            BottomHomeWidget(homeStore: homeStore),
            DeviceInformationsCard(homeStore: homeStore),
          ],
        ),
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  final HomeStore homeStore;
  const HeaderHome({
    super.key,
    required this.homeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/virus-icon.png',
                height: 120,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              const Text(
                'COVID-19',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'CORONAVIRUS 2019 - nCoV',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset('assets/sitdown-men.png'),
          Column(
            children: [
              Observer(builder: (_) {
                if (homeStore.redirectIsValid) {
                  WidgetsBinding.instance.addPostFrameCallback(
                      (_) async => context.pushReplacement(
                            homeStore.redirect!,
                          ));
                }
                return IconButton(
                  onPressed: () => homeStore.saveUserLogged(),
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}

class DeviceInformationsCard extends StatelessWidget {
  final HomeStore homeStore;
  const DeviceInformationsCard({
    super.key,
    required this.homeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 160),
      padding: const EdgeInsets.symmetric(horizontal: 28),
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 225,
            width: double.infinity,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Observer(builder: (_) {
                  if (homeStore.hasError) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) async => ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(homeStore.errorMessage!),
                              backgroundColor: Colors.red,
                            ),
                          )
                          .closed
                          .then(
                            (_) => homeStore.setError(''),
                          ),
                    );
                  }
                  return GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60,
                    ),
                    children: homeStore.deviceModel != null
                        ? [
                            StreamBuilder(
                                stream: homeStore.currentTimeStream(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var hour = snapshot.data!.hour;
                                    var ampm = hour < 12 ? 'AM' : 'PM';
                                    if (hour > 12) {
                                      hour -= 12;
                                    }
                                    if (hour == 0) {
                                      hour = 12;
                                    }
                                    return Text(
                                      '${hour.toString().padLeft(2, '0')}:${snapshot.data!.minute.toString().padLeft(2, '0')}:${snapshot.data!.second.toString().padLeft(2, '0')} $ampm',
                                      style: const TextStyle(fontSize: 24),
                                    );
                                  } else {
                                    return const Text('Carregando...');
                                  }
                                }),
                            DeviceInfos(
                                title: 'Nombre del dispositivo',
                                value: homeStore.deviceModel!.name!),
                            DeviceInfos(
                                title: 'Marca del dispositivo',
                                value: homeStore.deviceModel!.brand!),
                            DeviceInfos(
                                title: 'Tipo de dispositivo',
                                value: homeStore.deviceModel!.type!),
                            DeviceInfos(
                                title: 'Modelo del dispositivo',
                                value: homeStore.deviceModel!.model!),
                            DeviceInfos(
                              title: 'Sistema operativo y su vérsion',
                              value:
                                  '${homeStore.deviceModel!.system!} ${homeStore.deviceModel!.version!}',
                            ),
                          ]
                        : [],
                  );
                }),
              ),
            ),
          ),
          const ThemeSwitcher()
        ],
      ),
    );
  }
}

class DeviceInfos extends StatelessWidget {
  final String title;
  final String value;
  const DeviceInfos({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[800]!,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonThemeSwitch(
                    left: true,
                    bgColor: Colors.white,
                    icon: const Icon(Icons.wb_sunny),
                    onPressed: () {
                      GetIt.I<ValueNotifier<ThemeMode>>().value =
                          ThemeMode.light;
                    },
                  ),
                  ButtonThemeSwitch(
                    left: false,
                    bgColor: Colors.black,
                    icon: const Icon(Icons.nightlight_round),
                    onPressed: () {
                      GetIt.I<ValueNotifier<ThemeMode>>().value =
                          ThemeMode.dark;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonThemeSwitch extends StatelessWidget {
  final bool left;
  final Color bgColor;
  final Icon icon;
  final Function onPressed;
  const ButtonThemeSwitch({
    super.key,
    required this.left,
    required this.bgColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: left ? const Radius.circular(50) : const Radius.circular(0),
          bottomLeft:
              left ? const Radius.circular(50) : const Radius.circular(0),
          topRight:
              !left ? const Radius.circular(50) : const Radius.circular(0),
          bottomRight:
              !left ? const Radius.circular(50) : const Radius.circular(0),
        ),
      ),
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: icon,
      ),
    );
  }
}

class BottomHomeWidget extends StatelessWidget {
  final HomeStore homeStore;
  const BottomHomeWidget({
    super.key,
    required this.homeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 96,
                ),
                Row(
                  children: [
                    const Text(
                      'Fecha Recolección Datos:',
                    ),
                    Observer(builder: (_) {
                      return Text(
                        homeStore.covidInfosModel?.lastModified ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ],
                ),
                Observer(builder: (_) {
                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 9,
                      mainAxisExtent: 80,
                      crossAxisSpacing: 20,
                    ),
                    children: [
                      CardInfos(
                          title: 'Casos totales',
                          value: homeStore.covidInfosModel?.total.toString() ??
                              '0'),
                      const CardInfos(
                          title: 'Casos confirmados', value: '1000'),
                      CardInfos(
                          title: 'Pruebas negativas',
                          value:
                              homeStore.covidInfosModel?.negative.toString() ??
                                  '0'),
                      CardInfos(
                          title: 'Pruebas positivas',
                          value:
                              homeStore.covidInfosModel?.positive.toString() ??
                                  '0'),
                      CardInfos(
                          title: 'Falecidos',
                          value: homeStore.covidInfosModel?.deaths.toString() ??
                              '0'),
                      CardInfos(
                          title: 'Recuperados',
                          value:
                              homeStore.covidInfosModel?.recovered.toString() ??
                                  '0'),
                      CardInfos(
                          title: 'Pruebas pendientes',
                          value:
                              homeStore.covidInfosModel?.pending.toString() ??
                                  '0')
                    ],
                  );
                }),
                const Text(
                  'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021 ',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardInfos extends StatelessWidget {
  final String title;
  final String value;
  const CardInfos({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
