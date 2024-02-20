import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../presenter/controllers/splash_store.dart';
import 'widgets/widget.dart';

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
              const Expanded(
                child: IconSplashWidget(),
              ),
              ProgressBarWidget(store: store)
            ],
          ),
        );
      }),
    );
  }
}
