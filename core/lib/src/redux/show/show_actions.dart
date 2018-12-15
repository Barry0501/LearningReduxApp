import 'package:core/src/models/show.dart';
import 'package:core/src/models/show_cache.dart';

class ChangeCurrentDateAction{
  final DateTime date;

  ChangeCurrentDateAction(this.date);
}

class UpdateShowDatesAction {}
class ShowDatesUpdatedAction {
  ShowDatesUpdatedAction(this.dates);
  final List<DateTime> dates;
}

class FetchShowsIfNotLoadedAction {}

class RequestingShowsAction {}
class RefreshShowsAction {}
class ReceivedShowsAction {
  ReceivedShowsAction(this.cacheKey, this.shows);
  final DateTheaterPair cacheKey;
  final List<Show> shows;
}

class ErrorLoadingShowsAction {}