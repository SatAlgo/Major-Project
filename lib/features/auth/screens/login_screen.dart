import 'package:flutter/material.dart';
import '../../reporting/screens/report_issue_screen.dart';
// Note: You'll create this admin screen next
import '../../admin/screens/admin_dashboard.dart'; 
import 'signup_screen.dart';
import 'forgot_password_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Default role is Citizen
  String _userRole = 'Citizen'; 

  void _handleLogin() {
    if (_userRole == 'Citizen') {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const ReportIssueScreen())
      );
    } else {
      // --- UPDATE THIS LINE ---
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => const AdminDashboard())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.location_city, size: 80, color: Colors.teal),
              const SizedBox(height: 16),
              const Text(
                "Civic Connect",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const Text(
                "Login to your account",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // --- Role Selection Toggle ---
              const Text("Login as:", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text("Citizen"),
                    selected: _userRole == 'Citizen',
                    selectedColor: Colors.teal.withOpacity(0.2),
                    onSelected: (val) {
                      if (val) setState(() => _userRole = 'Citizen');
                    },
                  ),
                  const SizedBox(width: 15),
                  ChoiceChip(
                    label: const Text("Official"),
                    selected: _userRole == 'Official',
                    selectedColor: Colors.teal.withOpacity(0.2),
                    onSelected: (val) {
                      if (val) setState(() => _userRole = 'Official');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- Input Fields ---
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email address",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                  },
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.teal)),
                ),
              ),
              const SizedBox(height: 30),
              

              // --- Login Button ---
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Login as $_userRole",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (_) => const SignupScreen())
                      );
                    },
                    child: const Text("Sign Up", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
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