

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email,String password) async{
   try {
     Response response = await post(
         Uri.parse('https://reqres.in/api/register'),
         body: {
           'email': email,
           'password': password,
         }
     );
         if(response.statusCode == 200){
           print('Account Created Successfully');
         }
         else{
           print("Error");
         }
   }
   catch(e){
     print(e.toString());
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email_rounded),
                label: Text('Email'),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                ),
              ),
            ),
             SizedBox(height: 20,),
             TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_open_rounded),
                label: Text('Password'),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                ),
              ),
            ),
             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: InkWell(
                onTap:(){
                  login(emailController.text.toString(),passwordController.text.toString());
                },
                child: Container(
                  width: double.infinity,
                  height:50,
                  child: Center(child: Text("Sign Up",style: TextStyle(color:Colors.white,fontSize: 15),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Colors.deepPurple,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}