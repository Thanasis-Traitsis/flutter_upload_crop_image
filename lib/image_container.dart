import 'dart:io';

import 'package:flutter/material.dart';

Widget ImageContainer({
  required File? file,
}) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    height: 250,
    width: 250,
    child: file != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              File(file.path),
              height: 200,
              fit: BoxFit.cover,
            ),
          )
        : const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                size: 40,
                color: Colors.grey,
              ),
              Text(
                'Your image will be uploaded here.',
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
  );
}
