import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../presenter/controllers/controllers.dart';

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
