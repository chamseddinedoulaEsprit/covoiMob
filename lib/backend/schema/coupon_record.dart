import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponRecord extends FirestoreRecord {
  CouponRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "nbUtilisations" field.
  int? _nbUtilisations;
  int get nbUtilisations => _nbUtilisations ?? 0;
  bool hasNbUtilisations() => _nbUtilisations != null;

  // "nbUtilsMax" field.
  int? _nbUtilsMax;
  int get nbUtilsMax => _nbUtilsMax ?? 0;
  bool hasNbUtilsMax() => _nbUtilsMax != null;

  // "promo" field.
  int? _promo;
  int get promo => _promo ?? 0;
  bool hasPromo() => _promo != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _nbUtilisations = castToType<int>(snapshotData['nbUtilisations']);
    _nbUtilsMax = castToType<int>(snapshotData['nbUtilsMax']);
    _promo = castToType<int>(snapshotData['promo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Coupon');

  static Stream<CouponRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponRecord.fromSnapshot(s));

  static Future<CouponRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponRecord.fromSnapshot(s));

  static CouponRecord fromSnapshot(DocumentSnapshot snapshot) => CouponRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponRecordData({
  String? code,
  int? nbUtilisations,
  int? nbUtilsMax,
  int? promo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'nbUtilisations': nbUtilisations,
      'nbUtilsMax': nbUtilsMax,
      'promo': promo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponRecordDocumentEquality implements Equality<CouponRecord> {
  const CouponRecordDocumentEquality();

  @override
  bool equals(CouponRecord? e1, CouponRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.nbUtilisations == e2?.nbUtilisations &&
        e1?.nbUtilsMax == e2?.nbUtilsMax &&
        e1?.promo == e2?.promo;
  }

  @override
  int hash(CouponRecord? e) => const ListEquality()
      .hash([e?.code, e?.nbUtilisations, e?.nbUtilsMax, e?.promo]);

  @override
  bool isValidKey(Object? o) => o is CouponRecord;
}
