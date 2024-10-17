import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed({required String routeName, Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil({
    required String routeName,
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();
}
