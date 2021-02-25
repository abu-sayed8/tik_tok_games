import 'package:flutter/material.dart';
class NewPage extends StatelessWidget {
  final String title;

  const NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: Center(
        child: new Text(title),
      ),
    );
  }
}
