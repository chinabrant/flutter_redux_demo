
import 'action.dart';
import 'state.dart';
import 'package:redux/redux.dart';

/// 页面view model
class PageAViewModel {
  // final int count;
  final PageAState state;
  final Store store;

  PageAViewModel({this.store, this.state});

  void increment(int count) {
    store.dispatch(IncrementAction(count: count));
  }
}