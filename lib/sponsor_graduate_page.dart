import 'package:flutter/material.dart';

class SponsorGraduatePage extends StatelessWidget {
  const SponsorGraduatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sponsor a Graduate')),
      body: const Center(
        child: Text(
          'Sponsor a Graduate page coming soon!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
