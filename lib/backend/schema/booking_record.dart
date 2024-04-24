import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Booking_Date" field.
  DateTime? _bookingDate;
  DateTime? get bookingDate => _bookingDate;
  bool hasBookingDate() => _bookingDate != null;

  // "Guest" field.
  DocumentReference? _guest;
  DocumentReference? get guest => _guest;
  bool hasGuest() => _guest != null;

  // "Room" field.
  DocumentReference? _room;
  DocumentReference? get room => _room;
  bool hasRoom() => _room != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "Duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "Check_In_Date" field.
  DateTime? _checkInDate;
  DateTime? get checkInDate => _checkInDate;
  bool hasCheckInDate() => _checkInDate != null;

  // "Check_Out_Date" field.
  DateTime? _checkOutDate;
  DateTime? get checkOutDate => _checkOutDate;
  bool hasCheckOutDate() => _checkOutDate != null;

  void _initializeFields() {
    _bookingDate = snapshotData['Booking_Date'] as DateTime?;
    _guest = snapshotData['Guest'] as DocumentReference?;
    _room = snapshotData['Room'] as DocumentReference?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _duration = castToType<int>(snapshotData['Duration']);
    _checkInDate = snapshotData['Check_In_Date'] as DateTime?;
    _checkOutDate = snapshotData['Check_Out_Date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  DateTime? bookingDate,
  DocumentReference? guest,
  DocumentReference? room,
  bool? isCanceled,
  int? duration,
  DateTime? checkInDate,
  DateTime? checkOutDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Booking_Date': bookingDate,
      'Guest': guest,
      'Room': room,
      'isCanceled': isCanceled,
      'Duration': duration,
      'Check_In_Date': checkInDate,
      'Check_Out_Date': checkOutDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    return e1?.bookingDate == e2?.bookingDate &&
        e1?.guest == e2?.guest &&
        e1?.room == e2?.room &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.duration == e2?.duration &&
        e1?.checkInDate == e2?.checkInDate &&
        e1?.checkOutDate == e2?.checkOutDate;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.bookingDate,
        e?.guest,
        e?.room,
        e?.isCanceled,
        e?.duration,
        e?.checkInDate,
        e?.checkOutDate
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
