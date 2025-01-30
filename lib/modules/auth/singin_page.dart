import 'package:e_comm/modules/auth/singn_up.dart';
import 'package:e_comm/modules/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB2F0E9),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.black)),
                  onPressed: () {},
                ),
              ),

              // Welcome Text
              Text(
                "Hello Again!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Welcome Back You've Been Missed!",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 40),

              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Password Field
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Recovery Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Recovery Password"),
                ),
              ),

              SizedBox(height: 20),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0AB4AF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              SizedBox(height: 70),

              // Google Sign In Button

              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icon/google.png', height: 24),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 60),

              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account? ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black45),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SingnUp()));
                    },
                    child: Text(
                      "Sign Up For Free",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0AB4AF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
