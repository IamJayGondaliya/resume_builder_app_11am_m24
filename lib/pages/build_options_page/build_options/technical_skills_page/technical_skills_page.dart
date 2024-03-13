import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({super.key});

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  List<String> skills = ["", ""];
  List<TextEditingController> skillsControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills Page"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Title
              const Text("Enter your skills"),
              //List
              ...List.generate(
                skills.length,
                (index) => Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: skillsControllers[index],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        skills.removeAt(index);
                        skillsControllers.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //Button
              ElevatedButton(
                onPressed: () {
                  skills.add("");
                  skillsControllers.add(TextEditingController());
                  setState(() {});
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
