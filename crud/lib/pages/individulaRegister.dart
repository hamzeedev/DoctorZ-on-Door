import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualRegister extends StatefulWidget {

  @override
  State<IndividualRegister> createState() => _IndividualRegisterState();
}

class _IndividualRegisterState extends State<IndividualRegister> {
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
                    Text("Individual", style: GoogleFonts.akshar(fontSize: 50, color: Colors.deepOrange), ),
                  
                    const SizedBox(height: 40,),
                  ],
                ),

                //first name text field...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    // controller: _firstNameControler,
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
                        hintText: 'First Name',
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
                    // controller: _lastNameControler,
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
                        hintText: 'last Name',
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
                    // controller: _ageControler,
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
                        hintText: 'ID Card #',
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
                    // controller: _emailController,
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
                    // controller: _passwordControler,
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
                    // controller: _confirmpasswordControler,
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
                    // onTap: signUp,
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
                      onTap: () {
                        
                      },
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