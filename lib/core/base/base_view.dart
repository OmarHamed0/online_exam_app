import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'base_view_model.dart';

abstract class BaseView<state extends StatefulWidget, VM extends BaseViewModel>
    extends State<state> {
  late VM viewModel;
  @override
  void initState() {
    viewModel = initViewModel();
    super.initState();
  }

  VM initViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.appLocalizations = AppLocalizations.of(context);
    return const Placeholder();
  }
}
