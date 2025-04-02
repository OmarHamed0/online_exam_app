import 'package:flutter/material.dart';
import 'package:online_exam/feature/home_layout/presentation/widget/explore/inner_widgets/start_exam_widget/widgets/start_exam_container.dart';

class StartExamScreen extends StatelessWidget {
  static String routeName = "startExamScreen";
  final String examId;
  final String examName;
  final String duration;
  final String minutes;
  final String noOfQuestions;
  final String subjectIcon;

  const StartExamScreen({super.key, 
    required this.examId,
    required this.examName,
    required this.duration,
    required this.minutes,
    required this.noOfQuestions,
    required this.subjectIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
              },
              child: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: StartExamContainer(
          examId: examId.toString(),
          examName: examName.toString(),
          duration: duration.toString(),
          minutes: minutes.toString(),
          noOfQuestions: noOfQuestions.toString(),
          subjectIcon:subjectIcon.toString(),
        ));
  }
}
