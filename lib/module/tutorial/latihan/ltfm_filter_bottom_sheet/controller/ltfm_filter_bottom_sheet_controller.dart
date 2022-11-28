import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ltfm_filter_bottom_sheet_view.dart';

class LtfmFilterBottomSheetController extends State<LtfmFilterBottomSheetView>
    implements MvcController {
  static late LtfmFilterBottomSheetController instance;
  late LtfmFilterBottomSheetView view;

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
