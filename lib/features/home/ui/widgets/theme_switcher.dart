import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'widgets.dart';

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
