import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "ID_Categorie" field.
  int? _iDCategorie;
  int get iDCategorie => _iDCategorie ?? 0;
  bool hasIDCategorie() => _iDCategorie != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _iDCategorie = castToType<int>(snapshotData['ID_Categorie']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? titre,
  String? description,
  String? photo,
  int? iDCategorie,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'description': description,
      'photo': photo,
      'ID_Categorie': iDCategorie,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.iDCategorie == e2?.iDCategorie;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.titre, e?.description, e?.photo, e?.iDCategorie]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
