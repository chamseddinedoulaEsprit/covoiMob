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
import 'modifierarticle_widget.dart' show ModifierarticleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModifierarticleModel extends FlutterFlowModel<ModifierarticleWidget> {
  ///  Local state fields for this page.

  String? img;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Nom_Article widget.
  FocusNode? nomArticleFocusNode;
  TextEditingController? nomArticleTextController;
  String? Function(BuildContext, String?)? nomArticleTextControllerValidator;
  String? _nomArticleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
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

  // State field(s) for Promotion widget.
  FocusNode? promotionFocusNode;
  TextEditingController? promotionTextController;
  String? Function(BuildContext, String?)? promotionTextControllerValidator;
  String? _promotionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Etat_Article widget.
  FocusNode? etatArticleFocusNode;
  TextEditingController? etatArticleTextController;
  String? Function(BuildContext, String?)? etatArticleTextControllerValidator;
  String? _etatArticleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for eco_score widget.
  FocusNode? ecoScoreFocusNode;
  TextEditingController? ecoScoreTextController;
  String? Function(BuildContext, String?)? ecoScoreTextControllerValidator;
  String? _ecoScoreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 1) {
      return 'Maximum 1 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Matriau widget.
  FocusNode? matriauFocusNode;
  TextEditingController? matriauTextController;
  String? Function(BuildContext, String?)? matriauTextControllerValidator;
  String? _matriauTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Economie widget.
  FocusNode? economieFocusNode;
  TextEditingController? economieTextController;
  String? Function(BuildContext, String?)? economieTextControllerValidator;
  String? _economieTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DateCreationFormulaire widget.
  FocusNode? dateCreationFormulaireFocusNode;
  TextEditingController? dateCreationFormulaireTextController;
  String? Function(BuildContext, String?)?
      dateCreationFormulaireTextControllerValidator;
  String? _dateCreationFormulaireTextControllerValidator(
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
  ApiCallResponse? apiResultryn;

  @override
  void initState(BuildContext context) {
    nomArticleTextControllerValidator = _nomArticleTextControllerValidator;
    prixTextControllerValidator = _prixTextControllerValidator;
    promotionTextControllerValidator = _promotionTextControllerValidator;
    etatArticleTextControllerValidator = _etatArticleTextControllerValidator;
    ecoScoreTextControllerValidator = _ecoScoreTextControllerValidator;
    matriauTextControllerValidator = _matriauTextControllerValidator;
    economieTextControllerValidator = _economieTextControllerValidator;
    dateCreationFormulaireTextControllerValidator =
        _dateCreationFormulaireTextControllerValidator;
  }

  @override
  void dispose() {
    nomArticleFocusNode?.dispose();
    nomArticleTextController?.dispose();

    prixFocusNode?.dispose();
    prixTextController?.dispose();

    promotionFocusNode?.dispose();
    promotionTextController?.dispose();

    etatArticleFocusNode?.dispose();
    etatArticleTextController?.dispose();

    ecoScoreFocusNode?.dispose();
    ecoScoreTextController?.dispose();

    matriauFocusNode?.dispose();
    matriauTextController?.dispose();

    economieFocusNode?.dispose();
    economieTextController?.dispose();

    dateCreationFormulaireFocusNode?.dispose();
    dateCreationFormulaireTextController?.dispose();
  }
}
