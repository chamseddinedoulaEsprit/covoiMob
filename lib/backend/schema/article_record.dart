import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleRecord extends FirestoreRecord {
  ArticleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nom_Article" field.
  String? _nomArticle;
  String get nomArticle => _nomArticle ?? '';
  bool hasNomArticle() => _nomArticle != null;

  // "Prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "Promotion" field.
  String? _promotion;
  String get promotion => _promotion ?? '';
  bool hasPromotion() => _promotion != null;

  // "Etat_Article" field.
  String? _etatArticle;
  String get etatArticle => _etatArticle ?? '';
  bool hasEtatArticle() => _etatArticle != null;

  // "Eco_Score" field.
  String? _ecoScore;
  String get ecoScore => _ecoScore ?? '';
  bool hasEcoScore() => _ecoScore != null;

  // "Materiau" field.
  String? _materiau;
  String get materiau => _materiau ?? '';
  bool hasMateriau() => _materiau != null;

  // "Economie" field.
  String? _economie;
  String get economie => _economie ?? '';
  bool hasEconomie() => _economie != null;

  // "Date_Creation" field.
  DateTime? _dateCreation;
  DateTime? get dateCreation => _dateCreation;
  bool hasDateCreation() => _dateCreation != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "cat" field.
  DocumentReference? _cat;
  DocumentReference? get cat => _cat;
  bool hasCat() => _cat != null;

  void _initializeFields() {
    _nomArticle = snapshotData['Nom_Article'] as String?;
    _prix = castToType<double>(snapshotData['Prix']);
    _promotion = snapshotData['Promotion'] as String?;
    _etatArticle = snapshotData['Etat_Article'] as String?;
    _ecoScore = snapshotData['Eco_Score'] as String?;
    _materiau = snapshotData['Materiau'] as String?;
    _economie = snapshotData['Economie'] as String?;
    _dateCreation = snapshotData['Date_Creation'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _cat = snapshotData['cat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleRecord.fromSnapshot(s));

  static Future<ArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticleRecord.fromSnapshot(s));

  static ArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleRecordData({
  String? nomArticle,
  double? prix,
  String? promotion,
  String? etatArticle,
  String? ecoScore,
  String? materiau,
  String? economie,
  DateTime? dateCreation,
  String? image,
  DocumentReference? cat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nom_Article': nomArticle,
      'Prix': prix,
      'Promotion': promotion,
      'Etat_Article': etatArticle,
      'Eco_Score': ecoScore,
      'Materiau': materiau,
      'Economie': economie,
      'Date_Creation': dateCreation,
      'image': image,
      'cat': cat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleRecordDocumentEquality implements Equality<ArticleRecord> {
  const ArticleRecordDocumentEquality();

  @override
  bool equals(ArticleRecord? e1, ArticleRecord? e2) {
    return e1?.nomArticle == e2?.nomArticle &&
        e1?.prix == e2?.prix &&
        e1?.promotion == e2?.promotion &&
        e1?.etatArticle == e2?.etatArticle &&
        e1?.ecoScore == e2?.ecoScore &&
        e1?.materiau == e2?.materiau &&
        e1?.economie == e2?.economie &&
        e1?.dateCreation == e2?.dateCreation &&
        e1?.image == e2?.image &&
        e1?.cat == e2?.cat;
  }

  @override
  int hash(ArticleRecord? e) => const ListEquality().hash([
        e?.nomArticle,
        e?.prix,
        e?.promotion,
        e?.etatArticle,
        e?.ecoScore,
        e?.materiau,
        e?.economie,
        e?.dateCreation,
        e?.image,
        e?.cat
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticleRecord;
}
