import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({
    Key? key, 
    required this.showLoginPage
    }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  // Text controlers....
  final _emailController          = TextEditingController();
  final _passwordControler        = TextEditingController();
  final _confirmpasswordControler = TextEditingController();
  final _agencyNameControler      = TextEditingController();
  final _ownerNameControler       = TextEditingController();
  final _registrationControler    = TextEditingController();
  final _addressControler         = TextEditingController();


  @override
  void dispose() {
     _emailController.dispose();
     _passwordControler.dispose();
     _confirmpasswordControler.dispose();
     _agencyNameControler.dispose();
     _ownerNameControler.dispose();
     _registrationControler.dispose();
     _addressControler.dispose();
     super.dispose();
  }

  Future signUp() async {
  
   if(passwordConfirmed()){

    //create user...
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordControler.text.trim()
      );


      //users detail...
      addUserDetails(
        _agencyNameControler.text.trim(),
        _ownerNameControler.text.trim(),
        _emailController.text.trim(),
        _registrationControler.text.trim(),
        _addressControler.text.trim(),
        //int.parse(_ageControler.text.trim()),
      );
   }
  }

  Future addUserDetails(String agencyName, String ownerName, String email, String registration, String address, ) async {
    await FirebaseFirestore.instance.collection('agency').add({

      'agency name' :  agencyName,
      'owner name'   :  ownerName,
      'email'       :  email,
      'registration':  registration,
      'address'     :  address,

    });
  }
  
  
  
  
  bool passwordConfirmed(){
    if(_passwordControler.text.trim() == _confirmpasswordControler.text.trim()){
      return true;
    } else{
      return false;
    }
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
                // //logo
                //  const Icon(
                //   Icons.local_hospital, 
                //   size: 200, color: Colors.deepOrange,
                //   ),
                
                
                const SizedBox(height: 15),
          
                //some welcom text
                Column(
                  children: [

                    Text("Registor now!", style: GoogleFonts.akshar(fontSize: 50),),
                    const SizedBox(height: 10,),
                    Text("as a", style: GoogleFonts.akshar(fontSize: 40),),
                    const SizedBox(height: 10,),
                    Text("Agency", style: GoogleFonts.akshar(fontSize: 50),),
                  
                    const SizedBox(height: 40,),
                  ],
                ),

                //first name text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _agencyNameControler,
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
                        hintText: 'Agency Name',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                //last name text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _ownerNameControler,
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
                        hintText: 'Owner Name',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                //registration text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _registrationControler,
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
                        hintText: 'Agency Registration #',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                //Age text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _addressControler,
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
                        hintText: 'Address',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10,),

                //username or email text field...
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
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                  ),
                ),
                
                const SizedBox(height: 10,),
                
                //password text field...
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
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 10,),
                
                //Confirm password text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmpasswordControler,
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
                        hintText: 'Confirm Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                    ),
                    obscureText: true,
                  ),
                ),
                
                const SizedBox(height: 10,),
          
                //custom Sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Sign Up',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                      
                    ),
                  ),
                ),
                
                const SizedBox(height: 25,),
                
                //back to login screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('I am a member! ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap:widget.showLoginPage,
                      child: const Text('Login Now',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                    
                    
                  ],
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}