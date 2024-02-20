import 'package:flutter/material.dart';

class IconSplashWidget extends StatelessWidget {
  const IconSplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 180,
              child: Theme.of(context).brightness == Brightness.light
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
    );
  }
}
