import 'package:core/src/models/theater.dart';

class InitAction{}

class InitCompleteAction {
  InitCompleteAction(
    this.theaters,
    this.selectedTheater,
  );

  final List<Theater> theaters;
  final Theater selectedTheater;
}

class FetchComingSoonEventsIfNotLoadedAction {}

class ChangeCurrentTheaterAction{
  ChangeCurrentTheaterAction(this.selectedTheater);

  final Theater selectedTheater;
}