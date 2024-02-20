import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:covid_traking/features/home/presenter/controllers/home_store.dart';

import 'widgets/widgets.dart';

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
        onPressed: () => context.push('/more-details'),
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
