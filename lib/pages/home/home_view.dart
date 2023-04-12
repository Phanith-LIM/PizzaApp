import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
              Icon(Icons.location_on, color: Colors.redAccent,),
              Text("Cambodia"),
            ],
          ),
        ),
        body: const Center(
          child: Text('Home'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(Icons.add),
        )
    );
  }
}
