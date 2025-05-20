import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehiculeReservationRecord extends FirestoreRecord {
  VehiculeReservationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "vehicule" field.
  DocumentReference? _vehicule;
  DocumentReference? get vehicule => _vehicule;
  bool hasVehicule() => _vehicule != null;

  // "nbJours" field.
  int? _nbJours;
  int get nbJours => _nbJours ?? 0;
  bool hasNbJours() => _nbJours != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "invoicePath" field.
  String? _invoicePath;
  String get invoicePath => _invoicePath ?? '';
  bool hasInvoicePath() => _invoicePath != null;

  // "TotalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _vehicule = snapshotData['vehicule'] as DocumentReference?;
    _nbJours = castToType<int>(snapshotData['nbJours']);
    _user = snapshotData['user'] as DocumentReference?;
    _invoicePath = snapshotData['invoicePath'] as String?;
    _totalPrice = castToType<double>(snapshotData['TotalPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vehicule_Reservation');

  static Stream<VehiculeReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiculeReservationRecord.fromSnapshot(s));

  static Future<VehiculeReservationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VehiculeReservationRecord.fromSnapshot(s));

  static VehiculeReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiculeReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiculeReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiculeReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiculeReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiculeReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiculeReservationRecordData({
  DateTime? date,
  DocumentReference? vehicule,
  int? nbJours,
  DocumentReference? user,
  String? invoicePath,
  double? totalPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'vehicule': vehicule,
      'nbJours': nbJours,
      'user': user,
      'invoicePath': invoicePath,
      'TotalPrice': totalPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiculeReservationRecordDocumentEquality
    implements Equality<VehiculeReservationRecord> {
  const VehiculeReservationRecordDocumentEquality();

  @override
  bool equals(VehiculeReservationRecord? e1, VehiculeReservationRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.vehicule == e2?.vehicule &&
        e1?.nbJours == e2?.nbJours &&
        e1?.user == e2?.user &&
        e1?.invoicePath == e2?.invoicePath &&
        e1?.totalPrice == e2?.totalPrice;
  }

  @override
  int hash(VehiculeReservationRecord? e) => const ListEquality().hash([
        e?.date,
        e?.vehicule,
        e?.nbJours,
        e?.user,
        e?.invoicePath,
        e?.totalPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is VehiculeReservationRecord;
}
