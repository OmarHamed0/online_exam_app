import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/start_exam_widget/widgets/start_exam_container.dart';
import '../../../../../../../config/routes/page_route_name.dart';

class StartExamScreen extends StatelessWidget {
  static String routeName = "startExamScreen";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.getAllExamsScreen);
              },
              child: Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: StartExamContainer());
  }
}
