import 'package:flutter/material.dart';
import 'package:flutter_project/home_page.dart';
import 'package:flutter_project/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  late TextEditingController _passwordController;


  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello Again!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon:Icon(
                            _isObscure
                            ?Icons.visibility_off
                                :Icons.visibility
                          ),
                          onPressed: (){
                            setState(() {
                              _isObscure=!_isObscure;
                            });
                          },
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0),
                child:Container(

                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the registration page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home_page()),
                        );
                      },
                    child:Text('Sign In',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),),

                  ),
                ) ,
              ),
              ),
              SizedBox(height: 25),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Not A Member ?',
                style:TextStyle(
                    fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => register_page()),
                      );
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                
              ],)





            ],
          ),
        ),
      ),
    );
  }
}
