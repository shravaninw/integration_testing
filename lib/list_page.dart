import 'package:flutter/material.dart';
import 'package:integrationtesting/index.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Index(index: index),
                  ),
                );
              },
              child: SizedBox(
                height: 50,
                child: Text('Item $index'),
              ),
            ),
          );
        },
      ),
    );
  }
}
