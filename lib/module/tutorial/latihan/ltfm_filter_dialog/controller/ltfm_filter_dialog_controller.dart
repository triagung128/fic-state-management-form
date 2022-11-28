import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ltfm_filter_dialog_view.dart';

class LtfmFilterDialogController extends State<LtfmFilterDialogView>
    implements MvcController {
  static late LtfmFilterDialogController instance;
  late LtfmFilterDialogView view;

  final fromFilterController = TextEditingController();
  final toFilterController = TextEditingController();

  @override
  void initState() {
    instance = this;
    fromFilterController.text = '2022-11-20';
    toFilterController.text = '2022-11-20';
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
