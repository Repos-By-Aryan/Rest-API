import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/DropdownModel.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  Future<List<DropdownModel>> getPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = jsonDecode(response.body) as List;
      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return DropdownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No internet');
    }
    throw Exception("Error Fetching data");
  }
var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<List<DropdownModel>>(future: getPost(), builder: (context,snapshot){
              if(snapshot.hasData){
                return DropdownButton(
                    hint: Text("Select Value"),
                    isExpanded: true,
                    icon: Icon(Icons.add_circle_outline_outlined),
                    value: selectedValue,
                    items: snapshot.data!.map((e){
                  return DropdownMenuItem(

                    value: e.id.toString(),
                    child: Text(e.title.toString()),);
                }).toList() , onChanged: (value){
                  selectedValue = value;
                      setState(() {

                      });
                });
                }
              else{
                return Center(child: CircularProgressIndicator());
              }
            }),
          ],
        ),
      ),
    );
  }
}
