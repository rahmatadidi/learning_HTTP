// ignore_for_file: avoid_init_to_null, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:learn_http/models/post_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Learning HTTP Request"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(postResult != null
                  ? "${postResult!.id} | ${postResult!.name} | ${postResult!.job} | ${postResult!.created}"
                  : "Tidak Ada Data"),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("Adi", "Fullstack").then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: const Text("Press"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
