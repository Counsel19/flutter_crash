// ADDUSER.DART
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/constants/regex_constants.dart';
import 'package:hello_flutter/models/user_model.dart';
import 'package:hello_flutter/pages/list_users.dart';
import 'package:hello_flutter/providers/users_provider.dart';
import "package:uuid/uuid.dart";

enum AllGender { male, female }

class AddUser extends ConsumerStatefulWidget {
  const AddUser({super.key, this.navigatingFrom});

  final String? navigatingFrom;

  @override
  ConsumerState<AddUser> createState() => _AddUserState();
}

class _AddUserState extends ConsumerState<AddUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  AllGender? currentGender;
  List<String> dropdownItems = ["Nigeria", "Ghana", "France"];
  String? selectedItems;
  DateTime? dob;
  bool? isChecked = false;
  bool? isChecked1 = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New User"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  // enabled: false,
                  // The value for the validator is the current input in the textFormField
                  validator: (value) {
                    // if (value != null &&
                    //     NAME_VALIdATION_REGEX.hasMatch(value)) {
                    //   return null;
                    // }
                    // return "Enter a valid Name";

                    return customValidator(
                        NAME_VALIdATION_REGEX, value, "Name");
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
                  controller: _emailController,
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
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        // enabled: false,
                        validator: (value) {
                          return customValidator(
                              PASSWORD_VALIdATION_REGEX, value, "Password");
                        },
                        obscureText: hidePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Password"),
                          hintText: "*************",
                          prefixIcon: Icon(Icons.verified_user_sharp),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                // DropdownButton

                // DropdownButtonFormField
                DropdownButtonFormField(
                  hint: const Text("Select Country"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  value: selectedItems,
                  onChanged: (value) {
                    setState(() {
                      selectedItems = value;
                    });
                  },
                  items: dropdownItems
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 25,
                ),

                // Date Picker
                OutlinedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2026),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        dob = selectedDate;
                      });
                    }
                  },
                  child: Text(
                    dob == null ? "Select Date of Birth" : dob.toString(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // RADIO BUTTON
                RadioListTile(
                    title: const Text("Male"),
                    value: AllGender.male,
                    groupValue: currentGender,
                    onChanged: (value) {
                      setState(() {
                        currentGender = value;
                      });
                    }),
                RadioListTile(
                    title: const Text("Females"),
                    value: AllGender.female,
                    groupValue: currentGender,
                    onChanged: (value) {
                      setState(() {
                        currentGender = value;
                      });
                    }),

                //  CHECK BOX
                CheckboxListTile(
                  // tristate: true,
                  // contentPadding: ,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Accept Terms and Conditions"),
                  value: isChecked1,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 25,
                ),

                // ALERT DIALOG
                OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Confirm Action "),
                            content: const Text(
                                "Are you sure you want to delete user"),
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              OutlinedButton(
                                  onPressed: () {
                                    // SNACKBAR
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "User Deleted successfully")));

                                    Navigator.pop(context);
                                  },
                                  child: const Text("Okay"))
                            ],
                          );
                        });
                  },
                  child: const Text("Open Alert"),
                ),
                const SizedBox(
                  height: 25,
                ),

                // BottomSheet
                OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Colors.black,
                              height: 200,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"),
                              ),
                            );
                          });
                    },
                    child: const Text("Show  Bottom Sheet")),
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
                  onPressed: () {
                    // _formKey is a hook to the form for which the form key is assigned to
                    if (_formKey.currentState?.validate() ?? false) {
                      const uuid = Uuid();
                      // Access the instance of the notifier class call the add user method in the Notifier class using the ref
                      ref.read(usersProvider.notifier).addNewUser(User(
                            id: uuid.v4(),
                            name: _nameController.text,
                            email: _emailController.text,
                          ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListUsers(),
                        ),
                      );
                    }
                  },
                  child: const Text("Create User"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? customValidator(RegExp regexInput, String? value, String field) {
    if (value != null && regexInput.hasMatch(value)) {
      return null;
    }
    return "Enter a valid $field";
  }
}
