import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialButtons extends StatelessWidget {
  final String imagePath;
  final String nameOfButton;
  const SocialButtons({
    super.key,
    required this.imagePath,
    required this.nameOfButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: Text('Login com $nameOfButton'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        );
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: Colors.grey,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(imagePath), scale: 14),
        ),
      ),
    );
  }
}
