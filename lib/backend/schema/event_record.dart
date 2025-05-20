import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "event_img" field.
  String? _eventImg;
  String get eventImg => _eventImg ?? '';
  bool hasEventImg() => _eventImg != null;

  // "ExactLocation" field.
  LatLng? _exactLocation;
  LatLng? get exactLocation => _exactLocation;
  bool hasExactLocation() => _exactLocation != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _date = snapshotData['date'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _eventImg = snapshotData['event_img'] as String?;
    _exactLocation = snapshotData['ExactLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? title,
  double? price,
  DateTime? date,
  String? location,
  String? eventImg,
  LatLng? exactLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'date': date,
      'location': location,
      'event_img': eventImg,
      'ExactLocation': exactLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.date == e2?.date &&
        e1?.location == e2?.location &&
        e1?.eventImg == e2?.eventImg &&
        e1?.exactLocation == e2?.exactLocation;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.date,
        e?.location,
        e?.eventImg,
        e?.exactLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
