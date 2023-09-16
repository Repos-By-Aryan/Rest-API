import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/DonutModel.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  List<DonutModel> donutList =[];
  Future<List<DonutModel>> getDonuts() async{
    final response = await http.get(Uri.parse('https://opensource.adobe.com/Spry/data/json/donuts.js'));
     var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      donutList.clear();
      for(Map i in data){
        donutList.add(DonutModel.fromJson(i));
      }
      return donutList;
    }
    return donutList;
  }
  @override
  Widget build(BuildContext context) {
    print(donutList);
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API's"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder<List<DonutModel>>(future: getDonuts(), builder: (context,AsyncSnapshot<List<DonutModel>> snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }
            else{
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Card(
                      child: Column(
                        children: [
                          Text(index.toString()),
                        ],
                      ),
                    );
                  });
            }
          }),),
        ],
      ),
    );
  }
}

//if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               // Display your data here using ListView.builder
//               return ListView.builder(
//                 itemCount:10,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Text(index.toString()),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }