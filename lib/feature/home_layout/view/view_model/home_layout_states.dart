import 'package:flutter/foundation.dart';

@immutable
sealed class MainHomeStates {}

class MainHomeInitialStates extends MainHomeStates {}

class ChangeBottomNavigationBar extends MainHomeStates {}