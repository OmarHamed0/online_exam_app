import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/online_exam.dart';

import 'core/utils/bloc_observer/bloc_observer.dart';
import 'dependency_injection/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const OnlineExam());
}
