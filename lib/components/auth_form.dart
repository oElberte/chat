import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: const Text('Sign-in'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Create an account?'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
