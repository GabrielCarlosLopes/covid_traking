import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../presenter/controllers/controllers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = GetIt.I<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderLogin(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 20),
                  TextFieldCustom(
                      title: 'Tipo do Documento:',
                      onChanged: loginStore.setDocumentType),
                  const SizedBox(height: 10),
                  TextFieldCustom(
                      title: 'Número Documento:',
                      onChanged: loginStore.setDocumentNumber),
                  const SizedBox(height: 10),
                  PasswordTextField(store: loginStore),
                  const SizedBox(height: 30),
                  LoginButton(store: loginStore),
                  const SizedBox(height: 20),
                  const RegisterButtons(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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

class TextFieldCustom extends StatelessWidget {
  final String title;

  final Function onChanged;
  const TextFieldCustom({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          SizedBox(
            height: 55,
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
