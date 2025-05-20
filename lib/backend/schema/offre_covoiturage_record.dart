import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffreCovoiturageRecord extends FirestoreRecord {
  OffreCovoiturageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "depart" field.
  String? _depart;
  String get depart => _depart ?? '';
  bool hasDepart() => _depart != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  bool hasDestination() => _destination != null;

  // "prix" field.
  int? _prix;
  int get prix => _prix ?? 0;
  bool hasPrix() => _prix != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imagVehicule" field.
  String? _imagVehicule;
  String get imagVehicule => _imagVehicule ?? '';
  bool hasImagVehicule() => _imagVehicule != null;

  // "placeDispo" field.
  int? _placeDispo;
  int get placeDispo => _placeDispo ?? 0;
  bool hasPlaceDispo() => _placeDispo != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "userreferance" field.
  DocumentReference? _userreferance;
  DocumentReference? get userreferance => _userreferance;
  bool hasUserreferance() => _userreferance != null;

  void _initializeFields() {
    _depart = snapshotData['depart'] as String?;
    _destination = snapshotData['destination'] as String?;
    _prix = castToType<int>(snapshotData['prix']);
    _description = snapshotData['description'] as String?;
    _imagVehicule = snapshotData['imagVehicule'] as String?;
    _placeDispo = castToType<int>(snapshotData['placeDispo']);
    _date = snapshotData['date'] as String?;
    _userreferance = snapshotData['userreferance'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offreCovoiturage');

  static Stream<OffreCovoiturageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffreCovoiturageRecord.fromSnapshot(s));

  static Future<OffreCovoiturageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OffreCovoiturageRecord.fromSnapshot(s));

  static OffreCovoiturageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OffreCovoiturageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffreCovoiturageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffreCovoiturageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffreCovoiturageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffreCovoiturageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffreCovoiturageRecordData({
  String? depart,
  String? destination,
  int? prix,
  String? description,
  String? imagVehicule,
  int? placeDispo,
  String? date,
  DocumentReference? userreferance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'depart': depart,
      'destination': destination,
      'prix': prix,
      'description': description,
      'imagVehicule': imagVehicule,
      'placeDispo': placeDispo,
      'date': date,
      'userreferance': userreferance,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffreCovoiturageRecordDocumentEquality
    implements Equality<OffreCovoiturageRecord> {
  const OffreCovoiturageRecordDocumentEquality();

  @override
  bool equals(OffreCovoiturageRecord? e1, OffreCovoiturageRecord? e2) {
    return e1?.depart == e2?.depart &&
        e1?.destination == e2?.destination &&
        e1?.prix == e2?.prix &&
        e1?.description == e2?.description &&
        e1?.imagVehicule == e2?.imagVehicule &&
        e1?.placeDispo == e2?.placeDispo &&
        e1?.date == e2?.date &&
        e1?.userreferance == e2?.userreferance;
  }

  @override
  int hash(OffreCovoiturageRecord? e) => const ListEquality().hash([
        e?.depart,
        e?.destination,
        e?.prix,
        e?.description,
        e?.imagVehicule,
        e?.placeDispo,
        e?.date,
        e?.userreferance
      ]);

  @override
  bool isValidKey(Object? o) => o is OffreCovoiturageRecord;
}
