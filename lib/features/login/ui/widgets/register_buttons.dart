import 'package:flutter/material.dart';

import 'widgets.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Registrar Usuário',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SocialButtons(
                imagePath: 'assets/google.png', nameOfButton: 'Google'),
            SocialButtons(
                imagePath: 'assets/facebook.png', nameOfButton: 'Facebook'),
            SocialButtons(
                imagePath: 'assets/instagram.png', nameOfButton: 'Instagram'),
          ],
        ),
      ],
    );
  }
}
