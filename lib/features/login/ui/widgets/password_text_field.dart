import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../presenter/controllers/controllers.dart';

class PasswordTextField extends StatelessWidget {
  final LoginStore store;
  const PasswordTextField({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contraseña:'),
          const SizedBox(height: 5),
          Observer(builder: (_) {
            return SizedBox(
              height: 55,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                obscureText: store.isPasswordVisible,
                onChanged: store.setPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => store.changePasswordVisibility(),
                    icon: store.isPasswordVisible
                        ? const Icon(Icons.remove_red_eye_rounded)
                        : const Icon(Icons.visibility_off_rounded),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
