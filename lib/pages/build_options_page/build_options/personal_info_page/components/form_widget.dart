import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/utils/globals.dart';
import 'package:resume_builder_app/widgets/my_snackbar.dart';

//UDF
Widget formWidget({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return Container(
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
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      suffixIcon: const Icon(Icons.search),
                      hintText: "Enter name",
                      labelText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        // fontSize: 18,
                      ),
                      // border: const UnderlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
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
                    textInputAction: TextInputAction.next,
                    // keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
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
                    initialValue: Globals.globals.address,
                    onSaved: (val) {
                      Globals.globals.address = val;
                    },
                    validator: (val) =>
                        val!.isEmpty ? "Must enter address" : null,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bool validated = formKey.currentState!.validate();

                    if (validated) {
                      // Save data of entire form
                      formKey.currentState!.save();
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(
                        content: validated
                            ? "Form saved"
                            : "Failed to validate the form",
                        color: validated ? Colors.green : Colors.red,
                      ),
                    );
                  },
                  child: const Text("SAVE"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Globals.globals.reset();
                    formKey.currentState!.reset();
                  },
                  child: const Text("RESET"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
