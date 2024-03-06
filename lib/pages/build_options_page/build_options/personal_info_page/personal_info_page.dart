import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  int _selectedIndex = 0;

  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  //0
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Form(
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
                                    onSaved: (val) {},
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
                                    onSaved: (val) {},
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
                                    onSaved: (val) {},
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
                                  Icons.password,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    onSaved: (val) {},
                                    // textInputAction: TextInputAction.done,
                                    // keyboardType: TextInputType.number,
                                    obscureText: _hide,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          _hide = !_hide;
                                          setState(() {});
                                        },
                                        icon: Icon(_hide
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                      ),
                                    ),
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
                                    onSaved: (val) {},
                                    maxLines: 2,
                                    textInputAction: TextInputAction.newline,
                                    // keyboardType: TextInputType.number,
                                    // keyboardType: TextInputType.visiblePassword,
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}
