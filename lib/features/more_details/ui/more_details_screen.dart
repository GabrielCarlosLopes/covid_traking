import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injector.dart';
import '../presenter/controllers/controllers.dart';

class MoreDetailsScreen extends StatefulWidget {
  const MoreDetailsScreen({super.key});

  @override
  State<MoreDetailsScreen> createState() => _MoreDetailsScreenState();
}

class _MoreDetailsScreenState extends State<MoreDetailsScreen> {
  final MoreDetailsStore store = di<MoreDetailsStore>();

  @override
  void initState() {
    super.initState();
    store.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles por región'),
      ),
      body: Observer(builder: (context) {
        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
              itemCount: store.states?.length ?? 0,
              itemBuilder: (context, index) {
                final state = store.states![index];
                return Card(
                  color: Colors.white70,
                  child: ListTile(
                    onTap: () =>
                        context.pushNamed('region-details', queryParameters: {
                      'name': state.name!,
                      'state': state.state!,
                      'urlImage': state.image!,
                      'totalCases': state.totalCases.toString(),
                      'x': state.x ?? '',
                      'notes': state.notes!,
                    }),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    leading: Hero(
                      tag: state.name!,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(state.image!),
                        onBackgroundImageError: (exception, stackTrace) {
                          const Icon(Icons.error_outline_sharp);
                        },
                      ),
                    ),
                    title: Text(
                      state.name!,
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Casos totals: ${state.totalCases.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          'Ultima modificación: ${state.lastModified}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}
