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
    final response = await http.get(Uri.parse('https://webhook.site/32569190-e008-4c1c-9ba7-b8a5ac3e4299'));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API's"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder<List<DonutModel>>(future: getDonuts(), builder: (context,AsyncSnapshot<List<DonutModel>> snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return Text("Error : ${snapshot.error}");
            }
            else{
              return ListView.builder(
                  itemCount: donutList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data![index].picture!),
                              ),
                              title: Text(snapshot.data![index].name.toString()),
                              subtitle: Text(snapshot.data![index].email.toString()),
                              trailing: CircleAvatar(
                                radius:8,
                                backgroundColor: snapshot.data![index].isActive! ? Colors.lightGreen : Colors.grey,
                              ),
                            ),
                            Text("Tags : ${snapshot.data![index].tags}"),
                            const Text("Friends : "),
                            SizedBox(
                              height: 18,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:snapshot.data![index].friends!.length,
                                  itemBuilder: (context,position){
                                  return Row(
                                    children: [
                                      Text("${snapshot.data![index].friends![position].name}, "),
                                    ],
                                  );
                              }),
                            ),
                          ],
                        ),
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