import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$index')),
    );
  }
}
