import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/utils/globals.dart';
import 'package:resume_builder_app/widgets/my_snackbar.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

/*

      validate:
        - invokes the validator property of all TextFormField
        - will return true if all the fields are validated.
      save:
        - invokes the onSaved property of all TextFormField
      reset:
        - will reload the form in it's previous state.

*/

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int _selectedIndex = 0;

  bool _hide = true;

  TextEditingController nameController = TextEditingController();

  //Form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the keyboard
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Personal Info Page"),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectedIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectedIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: 60,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IndexedStack(
                        index: _selectedIndex,
                        children: [
                          //0
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(16),
                            color: Colors.white,
                            child: Form(
                              key: formKey,
                              // autovalidateMode:
                              //     AutovalidateMode.onUserInteraction,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        // const Icon(
                                        //   Icons.person,
                                        // ),
                                        // const SizedBox(
                                        //   width: 20,
                                        // ),
                                        Expanded(
                                          child: TextFormField(
                                            //1
                                            // onChanged: (val) {
                                            //   name = val;
                                            //   setState(() {});
                                            // },
                                            //2
                                            // controller: nameController,
                                            //3
                                            // onFieldSubmitted: (val) {
                                            //   name = val;
                                            //   setState(() {});
                                            // },
                                            //4
                                            // formKey.currentState!.save() =>  void
                                            onSaved: (val) {
                                              Globals.globals.name = val;
                                            },
                                            // String?
                                            // null => OK
                                            // String => error
                                            // formKey.currentState!.validate() => bool
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return "Must enter name";
                                              } else {
                                                return null;
                                              }
                                            },
                                            initialValue: Globals.globals.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              suffixIcon:
                                                  const Icon(Icons.search),
                                              hintText: "Enter name",
                                              labelText: "Name",
                                              hintStyle: TextStyle(
                                                color: Colors.grey.shade400,
                                                // fontSize: 18,
                                              ),
                                              // border: const UnderlineInputBorder(),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.email,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            onSaved: (val) {
                                              Globals.globals.email = val;
                                            },
                                            validator: (val) => val!.isEmpty
                                                ? "Must enter email"
                                                : RegExp(r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''')
                                                        .hasMatch(val)
                                                    ? null
                                                    : "Invalid email",
                                            initialValue: Globals.globals.email,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            onSaved: (val) {
                                              Globals.globals.phone = val;
                                            },
                                            validator: (val) {
                                              return val!.isEmpty
                                                  ? "Must enter contact"
                                                  : val.length < 10
                                                      ? "Contact must be of 10 digits"
                                                      : null;
                                            },
                                            initialValue: Globals.globals.phone,
                                            textInputAction:
                                                TextInputAction.next,
                                            // keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            maxLength: 10,
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            initialValue:
                                                Globals.globals.address,
                                            onSaved: (val) {
                                              Globals.globals.address = val;
                                            },
                                            validator: (val) => val!.isEmpty
                                                ? "Must enter address"
                                                : null,
                                            onFieldSubmitted: (val) {
                                              formKey.currentState!.validate();
                                            },
                                            // keyboardType: TextInputType.number,
                                            // keyboardType: TextInputType.visiblePassword,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            bool validated = formKey
                                                .currentState!
                                                .validate();

                                            if (validated) {
                                              // Save data of entire form
                                              formKey.currentState!.save();
                                            }

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              mySnackBar(
                                                content: validated
                                                    ? "Form saved"
                                                    : "Failed to validate the form",
                                                color: validated
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                            );
                                          },
                                          child: const Text("SAVE"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            formKey.currentState!.reset();
                                            Globals.globals.reset();
                                            setState(() {});
                                          },
                                          child: const Text("RESET"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //1
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
