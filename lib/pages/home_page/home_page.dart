import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(
          context,
          MyRoutes.buildOptionPage,
        ),
        label: const Text("Create"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
