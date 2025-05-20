import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvisConducteurRecord extends FirestoreRecord {
  AvisConducteurRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "idConducteur" field.
  DocumentReference? _idConducteur;
  DocumentReference? get idConducteur => _idConducteur;
  bool hasIdConducteur() => _idConducteur != null;

  // "idPassager" field.
  DocumentReference? _idPassager;
  DocumentReference? get idPassager => _idPassager;
  bool hasIdPassager() => _idPassager != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _idConducteur = snapshotData['idConducteur'] as DocumentReference?;
    _idPassager = snapshotData['idPassager'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avisConducteur');

  static Stream<AvisConducteurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvisConducteurRecord.fromSnapshot(s));

  static Future<AvisConducteurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvisConducteurRecord.fromSnapshot(s));

  static AvisConducteurRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvisConducteurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvisConducteurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvisConducteurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvisConducteurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvisConducteurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvisConducteurRecordData({
  String? content,
  DocumentReference? idConducteur,
  DocumentReference? idPassager,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'idConducteur': idConducteur,
      'idPassager': idPassager,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvisConducteurRecordDocumentEquality
    implements Equality<AvisConducteurRecord> {
  const AvisConducteurRecordDocumentEquality();

  @override
  bool equals(AvisConducteurRecord? e1, AvisConducteurRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.idConducteur == e2?.idConducteur &&
        e1?.idPassager == e2?.idPassager;
  }

  @override
  int hash(AvisConducteurRecord? e) =>
      const ListEquality().hash([e?.content, e?.idConducteur, e?.idPassager]);

  @override
  bool isValidKey(Object? o) => o is AvisConducteurRecord;
}
