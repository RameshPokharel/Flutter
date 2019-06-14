import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TapboxA.dart';

class ParentStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentStateless(),
        ),
      ),
    );
  }
}