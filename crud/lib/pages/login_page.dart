import 'package:crud/pages/forgot_pw_page.dart';
import 'package:crud/pages/individual_register_page.dart';
import 'package:crud/pages/individulaRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {


  final VoidCallback showRegisterPage;
  final VoidCallback showPatientRegisterPage;

  const LoginPage({
    Key? key,
     required this.showRegisterPage,
     required this.showPatientRegisterPage,
     }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // Text controlers....
  final _emailController = TextEditingController();
  final _passwordControler = TextEditingController();
  
  //login function  
  Future logIn() async {

    //loading 
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(child: CircularProgressIndicator( color: Colors.deepOrange,));

      });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordControler.text.trim()
      );

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordControler.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                 CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white54,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                
                
                const SizedBox(height: 55),
          
                //some welcom text
                Column(
                  children: [

                    Text("Welcome ", style: GoogleFonts.akshar(fontSize: 50),),
                    const SizedBox(height: 10,),
                    Text("to", style: GoogleFonts.akshar(fontSize: 40),),
                    const SizedBox(height: 10,),
                    Text("Wheels on Rent", style: GoogleFonts.akshar(fontSize: 55),),
                  
                    const SizedBox(height: 50,),
                  ],
                ),
                
                //username or email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                        hintText: 'Enter Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10,),
                
                //password twxtfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordControler,
                    autocorrect: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        hintText: 'Enter Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 10,),
                //forgot password...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ForgotPasswordPage());
                          // Navigator.push(
                            // context, 
                            // MaterialPageRoute(builder: ((context) {
                            //   return ForgotPasswordPage();
                            // }
                            // ),
                            // ),
                            // );
                        },
                        child: Text('Forget Password?',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 10,),
          
                //login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: logIn,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Login',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                      
                    ),
                  ),
                ),
                
                const SizedBox(height: 25,),
                
                //signup option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Join us as a ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    //go to doctor signup
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text('Agency',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),

                    const Text(' / ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    
                    //go to patient sign up
                    GestureDetector(
                      onTap: (){
                      
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>  IndividualRegister())
                              );
                        print("clicked");
                        // Get.back();
                      },
                      child: const Text('individual',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                
                const Text("Skip", style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}