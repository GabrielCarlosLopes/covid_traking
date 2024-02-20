import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sitdown_woman.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: RichText(
            text: const TextSpan(
          text: 'Bienvenido a\n',
          style: TextStyle(
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: '  Evertec',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
