import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_up_v2/models/user.dart';
import 'package:q_up_v2/screens/authenticate/authenticate.dart';
import 'package:q_up_v2/screens/home/business/business_bottom_navbar.dart';
import 'package:q_up_v2/screens/home/customer/customer_bottom_navbar.dart';
import 'package:q_up_v2/screens/loading.dart';
import 'package:q_up_v2/services/database.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool customerOrNot;

  _initGetCustomerOrNot(User user) async {
    if (user != null) {
      bool userStatus =
          await DatabaseService(uid: user.userId).getCustomerOrNot();
      if (userStatus != null) {
        if (mounted) {
          setState(() {
            customerOrNot = userStatus;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      _initGetCustomerOrNot(user);
      if (customerOrNot == null) {
        return Loading();
      } else {
        if (customerOrNot) {
          return CustomerNavBar();
        } else {
          return BusinessNavBar();
        }
      }
    }
  }
}
