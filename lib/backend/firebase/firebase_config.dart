import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqJ_vgQ8CFLJohtfDF1xPP04fGFp4Qfc8",
            authDomain: "mobile-project-q8k0df.firebaseapp.com",
            projectId: "mobile-project-q8k0df",
            storageBucket: "mobile-project-q8k0df.firebasestorage.app",
            messagingSenderId: "713585262955",
            appId: "1:713585262955:web:64f761114831ef9a694c2e"));
  } else {
    await Firebase.initializeApp();
  }
}
