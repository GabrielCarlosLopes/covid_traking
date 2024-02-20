import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../presenter/controllers/controllers.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = GetIt.I<LoginStore>();

  @override
  void dispose() {
    super.dispose();
    loginStore.redirect = null;
  }

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
