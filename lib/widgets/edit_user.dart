import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/constants/regex_constants.dart';
import "package:hello_flutter/providers/users_provider.dart";

class EditUser extends ConsumerWidget {
  const EditUser(
      {super.key, required this.name, required this.email, required this.id});
  final String id;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController emailController =
        TextEditingController(text: email);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,

                // enabled: false,
                // The value for the validator is the current input in the textFormField
                validator: (value) {
                  // if (value != null &&
                  //     NAME_VALIdATION_REGEX.hasMatch(value)) {
                  //   return null;
                  // }
                  // return "Enter a valid Name";

                  return customValidator(NAME_VALIdATION_REGEX, value, "Name");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Full Name"),
                  hintText: "John Doe",
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
                controller: emailController,
                // enabled: false,
                validator: (value) {
                  return customValidator(
                      EMAIL_VALIDATION_REGEX, value, "Email");
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                  hintText: "johndoe@mail.com",
                  prefixIcon: Icon(Icons.verified_user_sharp),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                ),
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
                    await ref.read(usersProvider.notifier).updateUser(
                        id: id,
                        name: nameController.text,
                        email: emailController.text);
                    await ref.read(usersProvider.notifier).getUsers();

                    Navigator.pop(context);
                  }
                },
                child: const Text("Update User"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? customValidator(RegExp regexInput, String? value, String field) {
  if (value != null && regexInput.hasMatch(value)) {
    return null;
  }
  return "Enter a valid $field";
}
