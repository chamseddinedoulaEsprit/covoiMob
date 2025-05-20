import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'modifier_offre_widget.dart' show ModifierOffreWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModifierOffreModel extends FlutterFlowModel<ModifierOffreWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for depart widget.
  FocusNode? departFocusNode;
  TextEditingController? departTextController;
  String? Function(BuildContext, String?)? departTextControllerValidator;
  String? _departTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for destination widget.
  FocusNode? destinationFocusNode;
  TextEditingController? destinationTextController;
  String? Function(BuildContext, String?)? destinationTextControllerValidator;
  String? _destinationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for placedispo widget.
  FocusNode? placedispoFocusNode;
  TextEditingController? placedispoTextController;
  String? Function(BuildContext, String?)? placedispoTextControllerValidator;
  String? _placedispoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for prix widget.
  FocusNode? prixFocusNode;
  TextEditingController? prixTextController;
  String? Function(BuildContext, String?)? prixTextControllerValidator;
  String? _prixTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 1) {
      return 'Maximum 1 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  String? _dateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (imageupload)] action in Button widget.
  ApiCallResponse? apiResponse;
  // Stores action output result for [Custom Action - formatCovoiturageFacebookMessage1] action in Button widget.
  String? message;

  @override
  void initState(BuildContext context) {
    departTextControllerValidator = _departTextControllerValidator;
    destinationTextControllerValidator = _destinationTextControllerValidator;
    placedispoTextControllerValidator = _placedispoTextControllerValidator;
    prixTextControllerValidator = _prixTextControllerValidator;
    dateTextControllerValidator = _dateTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    departFocusNode?.dispose();
    departTextController?.dispose();

    destinationFocusNode?.dispose();
    destinationTextController?.dispose();

    placedispoFocusNode?.dispose();
    placedispoTextController?.dispose();

    prixFocusNode?.dispose();
    prixTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
