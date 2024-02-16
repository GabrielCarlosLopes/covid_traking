import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../presenter/controllers/splash_store.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final store = GetIt.I<SplashStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        store.checkUserLoggedIn();
        if (store.redirect != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushReplacement(store.redirect!);
          });
        }

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 180,
                          child:
                              Theme.of(context).brightness == Brightness.light
                                  ? Image.asset(
                                      'assets/virus-icon.png',
                                      color: Colors.black,
                                    )
                                  : Image.asset(
                                      'assets/virus-icon.png',
                                      color: Colors.white,
                                    )),
                      const SizedBox(height: 20),
                      const Text(
                        'COVID-19',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const Text(
                        'CORONAVIRUS 2019 - nCoV',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Loading...'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: LinearProgressIndicator(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black12
                                : Colors.white12,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        minHeight: 20,
                        value: store.progress / 100,
                      ),
                    ),
                    Text(
                      '${(store.progress.toDouble().toStringAsFixed(0))}%',
                    ),
                  ],
                );
              })
            ],
          ),
        );
      }),
    );
  }
}
