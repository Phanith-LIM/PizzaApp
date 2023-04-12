import 'package:flutter/material.dart';


class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          },
        )
      ),
      body: const Center(
        child: Text('Detail'),
      ),);
  }
}
