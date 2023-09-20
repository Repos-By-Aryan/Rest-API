// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/UserModel.dart';
class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      userList.clear();
      for(Map i in data){
        debugPrint(UserModel.fromJson(i).toString());
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }
    return userList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : ${snapshot.data![index].name}"),
                                Text("Username : ${snapshot.data![index].username}"),
                                Text("Email : ${snapshot.data![index].email}"),
                                Text("Phone : ${snapshot.data![index].phone}"),
                                Text("Website : ${snapshot.data![index].website}"),
                                Text("Address : "+snapshot.data![index].address!.suite.toString()+', '+snapshot.data![index].address!.street.toString()+', '+snapshot.data![index].address!.city.toString()+'\nZipCode : '+snapshot.data![index].address!.zipcode.toString()),
                                Text("Geo : \n  Lat : ${snapshot.data![index].address!.geo!.lat}\n  Lng : ${snapshot.data![index].address!.geo!.lng}")
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}