import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_up_v2/intermediaries/wrapper.dart';
import 'package:q_up_v2/models/user.dart';
import 'package:q_up_v2/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: FireBaseAuthMethods().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Wrapper(),
      ),
    );
  }
}