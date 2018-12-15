
import 'package:core/src/models/app_state.dart';
import 'package:core/src/models/theater.dart';
import 'package:intl/intl.dart';

/// Used as a lookup key for caching showtimes.
///
/// When we've already loaded showtimes for a specific theater on specific date,
/// we don't want to load them again. This pair class is used as a key in a Map
/// structure, and the values are the showtimes.
class DateTheaterPair{
  static final ddMMyy = DateFormat('dd.MM.yy');

  DateTheaterPair.fromState(AppState state) 
  :dateTime = state.showState.selectedDate,
  theater = state.theaterState.currentTheater;

  final DateTime dateTime;
  final Theater theater;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateTheaterPair &&
          runtimeType == other.runtimeType &&
          dateTime == other.dateTime &&
          theater == other.theater;

  @override
  int get hashCode => dateTime.hashCode ^ theater.hashCode;
}