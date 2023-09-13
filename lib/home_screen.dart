import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models//PostsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if( response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API's"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation:5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(future: getPostApi(), builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              else{
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('Title',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text(postList[index].title.toString()),
                              SizedBox(height:10),
                              Text('Body',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text(postList[index].body.toString()),
                            ],
                          ),
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