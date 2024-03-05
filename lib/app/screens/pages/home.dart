import 'package:flutter/material.dart';
import 'package:rhythm_savaan/core/services/isar_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await IsarServices().write('username');
                },
                child: const Text('Test'))
          ],
        ),
      ),
    );
  }
}
