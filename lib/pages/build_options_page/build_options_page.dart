import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/route_utils.dart';

class BuildOptionsPage extends StatelessWidget {
  const BuildOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Options"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: MyRoutes.buildOptions
                .map(
                  (e) => Card(
                    child: ListTile(
                      leading: Image.asset(
                        e['icon'],
                        height: 40,
                      ),
                      title: Text(e['title']),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            e['route'],
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(
          context,
          MyRoutes.pdfPage,
        ),
        icon: const Icon(Icons.picture_as_pdf_outlined),
        label: const Text("PDF Preview"),
      ),
    );
  }
}
