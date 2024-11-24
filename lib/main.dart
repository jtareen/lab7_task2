import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab7_task2/models/pic_class.dart';
import 'package:lab7_task2/widgets/gradient_button.dart';
import 'package:lab7_task2/widgets/page_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Pic> _picture;

  @override void initState() {
    super.initState();

    _picture = fetchDataFromApi();
  }

  Future<Pic> fetchDataFromApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/${(DateTime.now().millisecondsSinceEpoch % 100) + 1}'));

    if (response.statusCode == 200) {
      return Pic.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('API Data Fetching', style: TextStyle(fontWeight: FontWeight.w600),),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: FutureBuilder<Pic>(
                future: _picture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(
                      child: Text('ERROR: ${snapshot.error}'),
                    );
                  }
                  else if (snapshot.hasData) {
                    final picture = snapshot.data;
                    return PageBody(picture: picture ?? defaultPic);
                  }
                  else {
                    return const Center(
                      child: Text('No Data available on server'),
                    );
                  }
                },
              )
      ),
      floatingActionButton: GradientButton(label: 'Get Random Image', onPressed: () {
        setState(() {
          _picture = fetchDataFromApi();
        });
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



