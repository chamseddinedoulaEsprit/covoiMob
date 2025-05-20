// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';

String formatCovoiturageFacebookMessage1(
  String depart,
  String destination,
  String date,
  String prix,
  String description,
  int placeDispo,
) {
  const String covoiturageUrlBase =
      "https://www.facebook.com/profile.php?id=61573679767330";

  double prixValue = double.tryParse(prix) ?? 0.0;
  String prixText = prixValue > 0 ? "$prixValue DT" : "Gratuit";

  depart = depart.isEmpty ? "Non spécifié" : depart;
  destination = destination.isEmpty ? "Non spécifié" : destination;
  date = date.isEmpty ? "Date non spécifiée" : date;
  description = description.isEmpty ? "Aucune description" : description;

  return """
🚗 Nouvelle offre de covoiturage !

📍 Départ : $depart
🏁 Destination : $destination
📅 Date : $date
💵 Prix : $prixText
📝 Description : $description
👥 Places disponibles : $placeDispo

👉 Plus d'infos : $covoiturageUrlBase
""";
}
