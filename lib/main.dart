import 'package:flutter/material.dart';
import 'package:image_upload_crop/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
        //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //     padding: MaterialStateProperty.all<EdgeInsets>(
        //       const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        //     ),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}