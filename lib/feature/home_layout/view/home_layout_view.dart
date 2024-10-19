import 'package:flutter/material.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
import 'package:online_exam/core/caching/token_manger.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: (){
          TokenManger.deleteToken().then((value) => Navigator.pushNamedAndRemoveUntil(
            context,PageRouteName.login,(route) => false,
          ),);
        },child: Icon(Icons.cabin),),
      ),
    );
  }
}
