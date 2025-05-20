import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResEventRecord extends FirestoreRecord {
  ResEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "tot_price" field.
  double? _totPrice;
  double get totPrice => _totPrice ?? 0.0;
  bool hasTotPrice() => _totPrice != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _quantity = castToType<int>(snapshotData['quantity']);
    _totPrice = castToType<double>(snapshotData['tot_price']);
    _event = snapshotData['event'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('res_event');

  static Stream<ResEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResEventRecord.fromSnapshot(s));

  static Future<ResEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResEventRecord.fromSnapshot(s));

  static ResEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResEventRecordData({
  int? quantity,
  double? totPrice,
  DocumentReference? event,
  DocumentReference? user,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quantity': quantity,
      'tot_price': totPrice,
      'event': event,
      'user': user,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResEventRecordDocumentEquality implements Equality<ResEventRecord> {
  const ResEventRecordDocumentEquality();

  @override
  bool equals(ResEventRecord? e1, ResEventRecord? e2) {
    return e1?.quantity == e2?.quantity &&
        e1?.totPrice == e2?.totPrice &&
        e1?.event == e2?.event &&
        e1?.user == e2?.user &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ResEventRecord? e) => const ListEquality()
      .hash([e?.quantity, e?.totPrice, e?.event, e?.user, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ResEventRecord;
}
