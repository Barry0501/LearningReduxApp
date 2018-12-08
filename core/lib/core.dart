import 'package:http/http.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';
import 'package:core/src/models/app_state.dart';
import 'src/redux/reducers/app_reducer.dart';
import 'package:redux_logging/redux_logging.dart';

Store<AppState> createStore(Client client,KeyValueStore keyValueStore){
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      LoggingMiddleware.printer()
    ]
  );
}