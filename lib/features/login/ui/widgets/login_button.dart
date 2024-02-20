import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../presenter/controllers/controllers.dart';

class LoginButton extends StatefulWidget {
  final LoginStore store;
  const LoginButton({
    super.key,
    required this.store,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Observer(builder: (_) {
        if (widget.store.hasError) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) async => ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text(widget.store.error),
                    backgroundColor: Colors.red,
                  ),
                )
                .closed
                .then(
                  (_) => widget.store.setError(''),
                ),
          );
        }
        if (widget.store.redirectIsValid) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) async => context.pushReplacement(
                    widget.store.redirect!,
                  ));
        }

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          onPressed: widget.store.isFormValid && !widget.store.isLoading
              ? widget.store.login
              : null,
          child: widget.store.isLoading == false
              ? const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : const CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }
}
