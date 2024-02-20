import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../presenter/controllers/splash_store.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.store,
  });

  final SplashStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Loading...'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).brightness == Brightness.light
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
    });
  }
}
