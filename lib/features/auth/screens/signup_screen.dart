import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- ADD THIS SECTION ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.teal),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // -------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Create Account", 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal)
              ),
              const SizedBox(height: 10),
              const Text("Join us to improve our city together", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Full Name", 
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 15),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Email", 
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 15),
              const TextField(
                obscureText: true, 
                decoration: InputDecoration(
                  labelText: "Password", 
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder()
                )
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Backend integration later
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55), 
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}