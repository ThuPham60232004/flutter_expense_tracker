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
import 'package:flutter_expense_tracker/presentation/screens/invoice_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    RouteNames.home: (context) => const HomeScreen(),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.signup: (context) => const SignUpScreen(),
    RouteNames.profile: (context) => const ProfileScreen(),
    RouteNames.contact: (context) => const ContactScreen(),
    RouteNames.entercodescreen: (context) => const EnterCodeScreen(),
    RouteNames.forgetpassscreen: (context) => const ForgetPassScreen(),
    RouteNames.resetpassscreen: (context) => const ResetPassScreen(),
    RouteNames.list: (context) => ListScreen(),
    RouteNames.invoice: (context) => InvoiceScreen(),
  };
}
