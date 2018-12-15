import 'package:core/core.dart';
import 'package:meta/meta.dart';

@immutable
class ShowState {
  final LoadingStatus loadingStatus;
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Map<DateTheaterPair, List<Show>> shows;

  ShowState(
      {@required this.loadingStatus,
      @required this.dates,
      @required this.selectedDate,
      @required this.shows});

  factory ShowState.initial() {
    return ShowState(
        loadingStatus: LoadingStatus.idle,
        dates: [],
        selectedDate: null,
        shows: {});
  }

  ShowState copyWith({
    LoadingStatus loadingStatus,
    List<DateTime> dates,
    DateTime selectedDate,
    Map<DateTheaterPair, List<Show>> shows,
  }) {
    return ShowState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        dates: dates ?? this.dates,
        selectedDate: selectedDate ?? this.selectedDate,
        shows: shows ?? this.shows);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowState &&
          runtimeType == other.runtimeType &&
          loadingStatus == other.loadingStatus &&
          dates == other.dates &&
          selectedDate == other.selectedDate &&
          shows == other.shows;

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      dates.hashCode ^
      selectedDate.hashCode ^
      shows.hashCode;
}
