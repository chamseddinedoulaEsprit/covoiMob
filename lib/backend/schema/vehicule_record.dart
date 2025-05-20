import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehiculeRecord extends FirestoreRecord {
  VehiculeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "prix" field.
  double? _prix;
  double get prix => _prix ?? 0.0;
  bool hasPrix() => _prix != null;

  // "lieu" field.
  String? _lieu;
  String get lieu => _lieu ?? '';
  bool hasLieu() => _lieu != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
    _prix = castToType<double>(snapshotData['prix']);
    _lieu = snapshotData['lieu'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vehicule');

  static Stream<VehiculeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiculeRecord.fromSnapshot(s));

  static Future<VehiculeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehiculeRecord.fromSnapshot(s));

  static VehiculeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiculeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiculeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiculeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiculeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiculeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiculeRecordData({
  String? type,
  String? imagePath,
  double? prix,
  String? lieu,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'imagePath': imagePath,
      'prix': prix,
      'lieu': lieu,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiculeRecordDocumentEquality implements Equality<VehiculeRecord> {
  const VehiculeRecordDocumentEquality();

  @override
  bool equals(VehiculeRecord? e1, VehiculeRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.imagePath == e2?.imagePath &&
        e1?.prix == e2?.prix &&
        e1?.lieu == e2?.lieu &&
        e1?.description == e2?.description;
  }

  @override
  int hash(VehiculeRecord? e) => const ListEquality()
      .hash([e?.type, e?.imagePath, e?.prix, e?.lieu, e?.description]);

  @override
  bool isValidKey(Object? o) => o is VehiculeRecord;
}
