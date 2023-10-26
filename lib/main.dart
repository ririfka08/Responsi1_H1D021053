import 'package:flutter/material.dart';
import 'package:responsi1/ui/ikan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Nemo',
      debugShowCheckedModeBanner: false,
      home: IkanPage(),
    );
  }
}
