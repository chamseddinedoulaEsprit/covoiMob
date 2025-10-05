# covoiMob — Application de covoiturage (Flutter)

Une application mobile de covoiturage développée avec Flutter. Ce dépôt contient le code source d'une application mobile multiplateforme (Android / iOS / Web) qui permet aux utilisateurs de proposer et rechercher des trajets, gérer des profils, et utiliser l'authentification Firebase.

## Aperçu

- Stack principal : Flutter (Dart), Firebase (Auth, Firestore, Storage), fonctions Cloud (dans `firebase/functions`).
- Plateformes ciblées : Android, iOS, Web.
- Contenu : UI, pages, composants partagés, intégration Firebase et assets (images, polices, audios).

Capture d'écran / illustration : voir le dossier `images/` pour les visuels utilisés.

## Points forts

- Recherche et publication d'annonces de covoiturage
- Gestion de profil utilisateur
- Authentification (Firebase)
- Stockage d'images et medias (Firebase Storage)
- Backend léger via Cloud Functions (dossier `firebase/functions`)

## Prérequis

- Flutter 3.x ou 4.x installé et configurer (voir `flutter --version`)
- SDK Android et/ou Xcode pour iOS
- Node.js (pour les fonctions Firebase, si vous voulez les déployer)
- Compte Firebase configuré (fichiers `google-services.json` pour Android et `GoogleService-Info.plist` pour iOS sont présents dans `android/app/` et `ios/Runner/`)

## Installation locale (développement)

1. Clonez le dépôt :

```sh
git clone <url-du-depot>
cd covoiMob
```

1. Installez les dépendances Flutter :

```sh
flutter pub get
```

1. Configurez les fichiers d'environnement :

- Le projet contient un dossier `assets/environment_values/` (ex : `environment.json`). Adaptez les valeurs si nécessaire (API keys, endpoints).
- Les fichiers Firebase pour Android (`android/app/google-services.json`) et iOS (`ios/Runner/GoogleService-Info.plist`) sont inclus ; si vous utilisez un autre projet Firebase, remplacez-les.

1. Lancez l'application sur un simulateur / émulateur :

```sh
flutter run
```

## Structure du projet

- `lib/` : code Flutter (pages, composants, logique)
- `assets/` : images, polices, audios, fichiers d'environnement
- `android/` et `ios/` : fichiers natifs et configurations
- `firebase/functions/` : Cloud Functions (Node.js)
- `test/` : tests unitaires Flutter

## Configuration Firebase (déploiement fonctions)

1. Installez les dépendances Node si vous modifiez ou déployez les fonctions :

```sh
cd firebase/functions
npm install
```

1. Déployer les fonctions (si vous êtes connecté avec `firebase-tools`) :

```sh
firebase deploy --only functions
```

Remarque : adaptez le code dans `firebase/functions/index.js` et `api_manager.js` avant le déploiement si nécessaire.

## Build & release

### Build local

- Android (APK) :

```sh
flutter build apk --release
```

- Android (App Bundle AAB) :

```sh
flutter build appbundle --release
```

- iOS :

```sh
flutter build ios --release
```

Vérifiez la configuration des keystores Android dans `android/` et des profils de provisioning pour iOS avant de publier.

### CI/CD avec GitHub Actions

Le projet inclut un workflow GitHub Actions (`.github/workflows/flutter_build.yml`) pour automatiser la construction et le déploiement de l'APK.

#### Configuration des secrets GitHub (optionnel)

Pour signer l'APK en mode release, configurez ces secrets dans votre dépôt GitHub (`Settings > Secrets and variables > Actions`) :

- `KEYSTORE` : Keystore encodé en base64 (commande : `base64 -i your-keystore.jks`)
- `STORE_PASSWORD` : Mot de passe du keystore
- `KEY_PASSWORD` : Mot de passe de la clé
- `KEY_ALIAS` : Alias de la clé

Si ces secrets ne sont pas configurés, le workflow créera un keystore de debug automatiquement.

#### Déclenchement du workflow

Le workflow se déclenche :

- Automatiquement lors d'un push sur la branche `main`
- Manuellement via l'onglet "Actions" de GitHub (workflow_dispatch)

L'APK généré sera disponible en tant qu'artifact dans la section Actions de GitHub.

## Tests

Lancer les tests unitaires :

```sh
flutter test
```

Ajouter des tests supplémentaires dans le dossier `test/` pour couvrir la logique métier.

## Bonnes pratiques et notes

- Ne commitez pas les secrets (API keys) en clair. Utilisez `assets/environment_values/environment.json` ou une solution de config sécurisée pour stocker des variables d'environnement.
- Gardez les fichiers `google-services.json` et `GoogleService-Info.plist` à jour si vous changez de projet Firebase.
- Si vous modifiez les dépendances dans `pubspec.yaml`, exécutez `flutter pub get` et testez sur device.

## Dépannage rapide

- Si build échoue pour Android : exécutez `flutter doctor` et vérifiez la configuration du SDK Android et Java.
- Problèmes iOS : ouvrez `ios/Runner.xcworkspace` dans Xcode pour résoudre les certificats et provisioning profiles.

## Contribution

1. Forkez le projet
2. Créez une branche feature: `git checkout -b feature/ma-fonction`
3. Codez et testez
4. Soumettez une Pull Request avec description et captures si nécessaire

## Auteurs / Contacts

- Projet: covoiMob
- Développeur principal / Contact: chamseddinedoulaEsprit (vérifiez les informations du dépôt)

## Licence

Indiquez la licence du projet ici (ex: MIT). Si aucune licence n'est fournie, précisez le statut propriétaire.

---

Si vous voulez, je peux :

- ajouter des badges (build, coverage, flutter version),
- générer un guide de contribution plus détaillé,
- ou traduire le README en anglais.

