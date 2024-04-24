import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool showSearchReasults(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

List<DateTime> getBookingDays(List<BookingRecord> booked) {
  List<DateTime> reservedDays = [];

  for (var booking in booked) {
    DateTime? startDate = booking.checkInDate;
    if (startDate != null) {
      int duration = booking.duration;

      for (int i = 0; i < duration; i++) {
        DateTime bookedDay = startDate.add(Duration(days: i));
        reservedDays.add(bookedDay);
      }
    }
  }

  return reservedDays;
}

List<DateTime>? checkConflict(
  List<DateTime> bookedDays,
  int duration,
  DateTime startDate,
) {
  List<DateTime> conflictingDays = [];

  for (int i = 0; i < duration; i++) {
    DateTime currentDay = startDate.add(Duration(days: i));
    if (bookedDays.contains(currentDay)) {
      conflictingDays.add(currentDay);
    }
  }

  return conflictingDays.isNotEmpty ? conflictingDays : null;
}

DateTime? checkInDate(
  DateTime? startDate,
  int? duration,
) {
  if (startDate != null && duration != null && duration > 0) {
    return startDate.add(Duration(days: duration - 1));
  } else {
    return null;
  }
}

String? printMessage(List<DateTime> listOfBookingDays) {
  if (listOfBookingDays.isEmpty) {
  } else {
    return "there are days you want to book that are alrady booked : ${listOfBookingDays.map((day) => DateFormat('yyyy-MM-dd').format(day)).join(', ')}";
  }
}

int? totalprice(
  RoomRecord? rooms,
  int? duration,
) {
  if (rooms == null ||
      duration == null ||
      duration <= 0 ||
      rooms.roomPrice == null) {
    return null;
  }

//calculation the total price
  int totalprice = rooms.roomPrice! * duration;

  return totalprice;
}

String? checkIfNull(
  String? firstName,
  String? lastName,
  String? password,
  String? email,
  List<GuestRecord>? guestCollection,
) {
  if (firstName == null ||
      firstName.isEmpty ||
      lastName == null ||
      lastName.isEmpty ||
      password == null ||
      password.isEmpty ||
      email == null ||
      email.isEmpty) {
    return 'One or more fields are empty.';
  }

  if (guestCollection != null && guestCollection.isNotEmpty) {
    for (var record in guestCollection) {
      if (record.email == email) {
        return 'This email is already in use.';
      }
    }
  }

  return null;
}

bool? passwordIsEight(String? password) {
  if (password != null && password.length >= 8) {
    return true;
  } else {
    return false;
  }
}

String? dateTime(
  DateTime? checkInDate,
  DateTime? checkOutDate,
) {
  if (checkInDate == null || checkOutDate == null) {
    return ''; // Handle null input gracefully
  }

  // Formatting the dates to display only the date part
  String formattedCheckInDate = DateFormat('MM/dd/yyyy').format(checkInDate);
  String formattedCheckOutDate = DateFormat('MM/dd/yyyy').format(checkOutDate);

  // Concatenating the formatted dates with a dash in between
  return '$formattedCheckInDate - $formattedCheckOutDate';
}

DocumentReference? getRoomID(
  String? nameOfTheRoom,
  List<RoomRecord>? roomTable,
) {
  if (nameOfTheRoom == null || roomTable == null) return null;

  // Search through roomTable to find the room with matching type
  for (final roomRecord in roomTable) {
    if (roomRecord.roomType == nameOfTheRoom) {
      return roomRecord.reference;
    }
  }

  // Return null if no matching room is found
  return null;
}

bool? checkConflictForUpdate(
  DateTime? startDate,
  int? duration,
  List<DateTime> bookingDays,
  String? bookedRoom,
) {
  if (startDate == null || duration == null || bookedRoom == null) return null;

  final newEndDate = startDate.add(Duration(days: duration));

  // Check if the new reservation overlaps with any existing booking
  for (final bookedDay in bookingDays) {
    final bookedEndDay = bookedDay.add(Duration(days: duration));
    if ((startDate.isBefore(bookedEndDay) ||
            startDate.isAtSameMomentAs(bookedEndDay)) &&
        (newEndDate.isAfter(bookedDay) ||
            newEndDate.isAtSameMomentAs(bookedDay))) {
      return true; // Conflict found
    }
  }

  return false; // No conflict found
}
