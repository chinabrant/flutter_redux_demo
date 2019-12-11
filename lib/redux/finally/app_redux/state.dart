import 'package:redux_demo/redux/finally/page_a/state.dart';

/// 整个app的state
class AppState {
  final PageAState pageAState;

  AppState({this.pageAState});
}

/// 初始化AppState
/// 不用初始化的页面可以直接保持null
AppState initAppState() {
  return AppState(pageAState: PageAState(count: 0));
}