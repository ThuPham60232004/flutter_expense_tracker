import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/presentation/screens/home_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/login_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/signup_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/profile_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/contact_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/entercode_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/forgetpass_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/resetpass_screen.dart';
import 'package:flutter_expense_tracker/presentation/screens/list_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _buildMenuItem(context, Icons.home, 'Home', HomeScreen(), Colors.blue),
      _buildMenuItem(
          context, Icons.login, 'Login', LoginScreen(), Colors.green),
      _buildMenuItem(context, Icons.app_registration, 'Register',
          SignUpScreen(), Colors.orange),
      _buildMenuItem(
          context, Icons.contacts, 'Contact', ContactScreen(), Colors.blueGrey),
      _buildMenuItem(
          context, Icons.person, 'Profile', ProfileScreen(), Colors.cyan),
      _buildMenuItem(context, Icons.code, 'Enter Code', EnterCodeScreen(),
          Colors.deepOrange),
      _buildMenuItem(context, Icons.lock_open, 'Forget Password',
          ForgetPassScreen(), Colors.redAccent),
      _buildMenuItem(context, Icons.lock_reset, 'Reset Password',
          ResetPassScreen(), Colors.pinkAccent),
      _buildMenuItem(
          context, Icons.list, 'List Screen', ListScreen(), Colors.teal),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blueGrey, Colors.black54]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/icons/nen.png'),
                ),
                const SizedBox(height: 10),
                FutureBuilder<String>(
                  future:
                      _getUserName(), // Assume this method fetches the user's name
                  builder: (context, snapshot) {
                    String userName = snapshot.data ?? 'Guest';
                    return Text(
                      'Welcome, $userName!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
          ...menuItems,
        ],
      ),
    );
  }

  ListTile _buildMenuItem(BuildContext context, IconData icon, String title,
      Widget screen, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }

  Future<String> _getUserName() async {
    await Future.delayed(Duration(seconds: 1));
    return 'Anh Thu';
  }
}
