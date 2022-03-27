import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_07610608/ApiResult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<dynamic> data=[];
  @override
  void initState() {
    super.initState();
    getApi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
     //   title: Text(widget.title),
      ),*/
      body: Column(
       //mainAxisAlignment: MainAxisAlignment.center,
       //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Image.network(
               'https://cpsu-test-api.herokuapp.com/images/quiz/cheetah.png',
                width: 280.0,
                height: 280.0,

              ),
            ],
          ),
        ],

      ),
    );
  }
    getApi() async{
      final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
      var response = await http.get(url,headers: {'id': '07610608'});

      var json = jsonDecode(response.body);
      var apiResult = ApiResult.fromJson(json);

       List<dynamic> data = json['data'];
      /*dataQues['image_url'] = apiResult.data[4]['image_url'] ;
      dataQues['image_url'] = apiResult.data[2]['image_url'] ;*/

        print(data[0]['image_url']);
    }
}
