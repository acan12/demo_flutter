import 'package:demo_flutter/core/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/app_theme.dart';

void main() async {
  await initializeDependencies();
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Container(),

    );
  }
}