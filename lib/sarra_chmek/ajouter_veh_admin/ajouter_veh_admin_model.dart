import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'ajouter_veh_admin_widget.dart' show AjouterVehAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AjouterVehAdminModel extends FlutterFlowModel<AjouterVehAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for type_vehicule widget.
  FocusNode? typeVehiculeFocusNode;
  TextEditingController? typeVehiculeTextController;
  String? Function(BuildContext, String?)? typeVehiculeTextControllerValidator;
  String? _typeVehiculeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Prix widget.
  FocusNode? prixFocusNode;
  TextEditingController? prixTextController;
  String? Function(BuildContext, String?)? prixTextControllerValidator;
  String? _prixTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for disponibilite widget.
  FocusNode? disponibiliteFocusNode;
  TextEditingController? disponibiliteTextController;
  String? Function(BuildContext, String?)? disponibiliteTextControllerValidator;
  String? _disponibiliteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Lieu_retrait widget.
  FocusNode? lieuRetraitFocusNode;
  TextEditingController? lieuRetraitTextController;
  String? Function(BuildContext, String?)? lieuRetraitTextControllerValidator;
  String? _lieuRetraitTextControllerValidator(
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
  ApiCallResponse? apiResult925;

  @override
  void initState(BuildContext context) {
    typeVehiculeTextControllerValidator = _typeVehiculeTextControllerValidator;
    prixTextControllerValidator = _prixTextControllerValidator;
    disponibiliteTextControllerValidator =
        _disponibiliteTextControllerValidator;
    lieuRetraitTextControllerValidator = _lieuRetraitTextControllerValidator;
  }

  @override
  void dispose() {
    typeVehiculeFocusNode?.dispose();
    typeVehiculeTextController?.dispose();

    prixFocusNode?.dispose();
    prixTextController?.dispose();

    disponibiliteFocusNode?.dispose();
    disponibiliteTextController?.dispose();

    lieuRetraitFocusNode?.dispose();
    lieuRetraitTextController?.dispose();
  }
}
