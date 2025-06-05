import 'package:flutter/material.dart';

class FundTechLabPage extends StatelessWidget {
  const FundTechLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fund a Tech Lab')),
      body: const Center(
        child: Text(
          'Fund a Tech Lab page coming soon!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}