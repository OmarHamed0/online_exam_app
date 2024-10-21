
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/styles/colors/app_colors.dart';
import 'package:online_exam/core/styles/images/app_images.dart';

import '../../config/routes/page_route_name.dart';
import '../../core/caching/token_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    _navigateAfterDelay();
    super.initState();
  }


  _navigateToInitialRoute()async{
    var token=await TokenManger.getToken();
    String initialRoute=token !=null ? PageRouteName.mainHome:
    PageRouteName.login;
    return  Navigator.of(context).pushNamedAndRemoveUntil
      (  initialRoute
    , (route) => false,)  ;

  }
   _navigateAfterDelay(){
    Timer(
      const Duration(seconds: 3),
      () => _navigateToInitialRoute(),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      child: Lottie.asset(
        AppImages.splash2,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.contain
      ),
    );
  }
}
