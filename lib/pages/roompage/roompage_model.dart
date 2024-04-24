import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'roompage_widget.dart' show RoompageWidget;
import 'package:flutter/material.dart';

class RoompageModel extends FlutterFlowModel<RoompageWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  int? price = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<BookingRecord>? booking;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
