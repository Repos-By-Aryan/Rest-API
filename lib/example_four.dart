
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {

  var data;
  Future<void> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
    data = jsonDecode(response.body.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API 4'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name : ${data![index]['name']}"),
                        Text("Username : ${data![index]['username']}"),
                        Text("Email : ${data![index]['email']}"),
                        Text("Phone : ${data![index]['phone']}"),
                        Text("Website : ${data![index]['website']}"),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Address : "+data![index]['address']['suite'].toString()+', '+data![index]['address']['street'].toString()+', '+data![index]['address']['city'].toString()+'\nZipCode : '+data![index]['address']['zipcode'].toString()),
                        Text("Geo : \n  Lat : ${data![index]['address']['geo']['lat']}\n  Lng : ${data![index]['address']['geo']['lng']}"),
                      ],
                    ),
                  );
                });
              }
            }),
          ),
        ],
      ),
    );
  }
}