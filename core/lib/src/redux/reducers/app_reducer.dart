import 'package:core/src/models/app_state.dart';
import 'package:core/src/redux/show/show_reducer.dart';
import 'package:core/src/redux/theater/theater_reducer.dart';

AppState appReducer(AppState state,dynamic action){
  return AppState(
    showState: showReducer(state.showState,action),
    theaterState: theaterReducer(state.theaterState,action)
  );
}