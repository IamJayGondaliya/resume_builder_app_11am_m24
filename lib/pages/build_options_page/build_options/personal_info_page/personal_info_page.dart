import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options/personal_info_page/components/form_widget.dart';
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
    Size size = MediaQuery.sizeOf(context);

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
                          formWidget(
                            context: context,
                            genderSelection: true,
                            onGenderSelected: (val) {
                              Globals.globals.gender = val;
                              setState(() {});
                            },
                          ),
                          //1
                          Container(
                            height: size.height * 0.25,
                            width: size.width,
                            color: Colors.white,
                            padding: const EdgeInsets.all(30),
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  height: size.height * 0.2,
                                  child: CircleAvatar(
                                    radius: size.height * 0.1,
                                    foregroundImage:
                                        Globals.globals.image != null
                                            ? FileImage(Globals.globals.image!)
                                            : null,
                                  ),
                                ),
                                FloatingActionButton.small(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();

                                    XFile? file = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );

                                    if (file != null) {
                                      Globals.globals.image = File(file.path);
                                      setState(() {});
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    Icons.camera,
                                  ),
                                ),
                              ],
                            ),
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
