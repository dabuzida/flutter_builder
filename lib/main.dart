import 'package:flutter/material.dart';
import 'package:flutter_builder/my_animated_builder2.dart';
import 'package:flutter_builder/my_animated_builder3.dart';

import 'my_animated_builder.dart';
import 'my_value_listenable_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Builder',
      home: MyContainer(),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder'),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      // body: const MyValueListenableBuilder(),
      body: SizedBox(
        height: 1000,
        child: Column(
          children: <Widget>[
            const Expanded(child: MyValueListenableBuilder()),
            const Expanded(child: MyAnimatedBuilder()),
            Expanded(child: MyAnimatedBuilder2()),
            Expanded(child: MyAnimatedBuilder3()),
          ],
        ),
      ),
    );
  }
}
