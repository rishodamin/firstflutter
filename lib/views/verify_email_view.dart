import 'package:flutter/material.dart';
import 'package:myapp/constant/routes.dart';
import 'package:myapp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Verify'),
        backgroundColor: Colors.blue[600],
        elevation: 5,
        shadowColor: Colors.grey,
      ),
      body: Column(children: [
        const Text("We've sent you an email verification, Please check it out"),
        const Text("If you haven't received it yet, press the button below"),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification')),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart')),
      ]),
    );
  }
}
