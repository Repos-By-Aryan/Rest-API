
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
        title: Text('Rest API 4'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
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
                        Text("Name : "+data![index]['name'].toString()),
                        Text("Username : "+data![index]['username'].toString()),
                        Text("Email : "+data![index]['email'].toString()),
                        Text("Phone : "+data![index]['phone'].toString()),
                        Text("Website : "+data![index]['website'].toString()),
                        Text("Address : "+data![index]['address']['suite'].toString()+', '+data![index]['address']['street'].toString()+', '+data![index]['address']['city'].toString()+'\nZipCode : '+data![index]['address']['zipcode'].toString()),
                        Text("Geo : \n  Lat : "+data![index]['address']['geo']['lat'].toString()+"\n  Lng : "+data![index]['address']['geo']['lng'].toString()),
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