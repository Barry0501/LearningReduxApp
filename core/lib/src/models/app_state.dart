// Khởi tạo dữ liệu mẫu cho AppState
import 'package:core/src/redux/show/show_state.dart';
import 'package:core/src/redux/theater/theater_state.dart';
import 'package:meta/meta.dart';

class AppState {
  final ShowState showState;
  final TheaterState theaterState;

  AppState({
    @required this.showState, // showTimes 
    @required this.theaterState, // showTimes 
  });

  factory AppState.initial(){
    return AppState(
      showState: ShowState.initial(),
      theaterState: TheaterState.initial()
    );
  }

  AppState copyWith({
    bool isLoading
  }){
    return AppState(
      showState: showState ?? this.showState,
      theaterState: theaterState ?? this.theaterState
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || 
      other is AppState &&
        runtimeType == other.runtimeType &&
        theaterState == other.theaterState &&
        showState == other.showState;

  @override
  int get hashCode =>
    showState.hashCode ^ theaterState.hashCode;
}