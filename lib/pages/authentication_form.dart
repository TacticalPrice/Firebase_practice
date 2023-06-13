import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;

  changeIsLogin() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login/Signup'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (!isLogin)
                  const TextField(
                    key: ValueKey('First_Name'),
                    decoration:
                        InputDecoration(hintText: 'Enter the First Name'),
                  ),
                if (!isLogin)
                  const TextField(
                    key: ValueKey('last_Name'),
                    decoration:
                        InputDecoration(hintText: 'Enter the Last Name'),
                  ),
                const TextField(
                  key: ValueKey('password'),
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const TextField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(hintText: 'Enter the Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: isLogin ? const Text('Login') : const Text('Signup'),
                  ),
                ),
                TextButton(
                    onPressed: () => changeIsLogin(),
                    child: isLogin
                        ? const Text("Don't have account? SignUp")
                        : const Text('Already have an account? Login')),
              ],
            ),
          ),
        ));
  }
}
