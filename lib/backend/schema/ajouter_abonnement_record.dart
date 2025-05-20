import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AjouterAbonnementRecord extends FirestoreRecord {
  AjouterAbonnementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "cin" field.
  String? _cin;
  String get cin => _cin ?? '';
  bool hasCin() => _cin != null;

  // "cardNumber" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "coupon" field.
  DocumentReference? _coupon;
  DocumentReference? get coupon => _coupon;
  bool hasCoupon() => _coupon != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _cin = snapshotData['cin'] as String?;
    _cardNumber = snapshotData['cardNumber'] as String?;
    _type = snapshotData['type'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _coupon = snapshotData['coupon'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ajouter_abonnement');

  static Stream<AjouterAbonnementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AjouterAbonnementRecord.fromSnapshot(s));

  static Future<AjouterAbonnementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AjouterAbonnementRecord.fromSnapshot(s));

  static AjouterAbonnementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AjouterAbonnementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AjouterAbonnementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AjouterAbonnementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AjouterAbonnementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AjouterAbonnementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAjouterAbonnementRecordData({
  String? name,
  int? phoneNumber,
  String? cin,
  String? cardNumber,
  String? type,
  DateTime? date,
  DocumentReference? coupon,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone_number': phoneNumber,
      'cin': cin,
      'cardNumber': cardNumber,
      'type': type,
      'date': date,
      'coupon': coupon,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class AjouterAbonnementRecordDocumentEquality
    implements Equality<AjouterAbonnementRecord> {
  const AjouterAbonnementRecordDocumentEquality();

  @override
  bool equals(AjouterAbonnementRecord? e1, AjouterAbonnementRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.cin == e2?.cin &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.type == e2?.type &&
        e1?.date == e2?.date &&
        e1?.coupon == e2?.coupon &&
        e1?.price == e2?.price;
  }

  @override
  int hash(AjouterAbonnementRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phoneNumber,
        e?.cin,
        e?.cardNumber,
        e?.type,
        e?.date,
        e?.coupon,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is AjouterAbonnementRecord;
}
