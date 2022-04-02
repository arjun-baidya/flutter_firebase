import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
  var email;
  var password;
  
  login()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final  user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    print(user);
    if(user!.email==email){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    }
    else{
      print("error");
    }
    //     try {
    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: email,
    //     password: password
    //   );
    // } on FirebaseAuthException catch (e) {
    //   print(e);
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // }

    // var userCredential;
    // if(userCredential!="NULL"){
    //   Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => const HomePage()),
    //           );
    // }
    // else{
    //   print("error");
    // }
  }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signup.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (() {
              // Navigator.pushNamed(context, '/home');
              login();
            }),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}