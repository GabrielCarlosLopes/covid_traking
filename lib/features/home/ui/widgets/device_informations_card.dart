import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../presenter/controllers/controllers.dart';
import 'widgets.dart';

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
