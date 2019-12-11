
import 'package:redux_demo/redux/finally/app_redux/state.dart';
import 'package:redux_demo/redux/finally/page_a/reducer.dart';

AppState appReducers(AppState oldState, action) {
  return AppState(pageAState: pageAReducers(oldState.pageAState, action));
}