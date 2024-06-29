import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/constants/regex_constants.dart';
import "package:hello_flutter/helpers/customValidator.dart";
import 'package:hello_flutter/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    final TextEditingController passwordControler = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: emailController,

                // enabled: false,
                // The value for the validator is the current input in the textFormField
                validator: (value) {
                  // if (value != null &&
                  //     NAME_VALIdATION_REGEX.hasMatch(value)) {
                  //   return null;
                  // }
                  // return "Enter a valid Name";

                  return CustomValidators.fieldValidator(
                      EMAIL_VALIDATION_REGEX, value, "Email");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                  hintText: "name@email.com",
                  prefixIcon: Icon(Icons.verified_user_sharp),
                  // icon: Icon(Icons.rocket_launch),
                  // suffixIcon: Icon(Icons.rocket_launch),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordControler,
                // enabled: false,
                obscureText: true,
                validator: (value) {
                  return CustomValidators.fieldValidator(
                      PASSWORD_VALIdATION_REGEX, value, "Password");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Password"),
                  hintText: "**********",
                  prefixIcon: Icon(Icons.verified_user_sharp),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  // _formKey is a hook to the form for which the form key is assigned to
                  if (formKey.currentState?.validate() ?? false) {
                    try {
                      await ref
                          .read(authServiceProvider)
                          .signIn(emailController.text, passwordControler.text);

                      Navigator.pushNamed(context, "/home");
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error Logging In"),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Login"),
              ),
              Row(children: [
                const Text("Don't have an account, "),
                TextButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                )
              ])
            ],
          ),
        ),
      )),
    );
  }
}
