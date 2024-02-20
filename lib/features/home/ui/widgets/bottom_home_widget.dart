import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../presenter/controllers/controllers.dart';
import 'widgets.dart';

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
                      CardInfos(
                          title: 'Casos confirmados',
                          value: homeStore.covidInfosModel?.total.toString() ??
                              '0'),
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
