import 'package:redux_demo/redux/finally/page_a/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'action.dart';

final pageAReducers = combineReducers<PageAState>([
  TypedReducer<PageAState, IncrementAction>(_incrementCounter)
]);

/// reducers
PageAState _incrementCounter(PageAState oldState, IncrementAction action) {
  return PageAState(count: oldState.count + action.count);
}