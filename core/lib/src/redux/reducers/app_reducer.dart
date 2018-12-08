import 'package:core/src/models/app_state.dart';

AppState appReducer(AppState state,dynamic action){
  return AppState(
    isLoading: false
  );
}