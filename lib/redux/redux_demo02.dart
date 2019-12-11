import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// 页面state
class PageAState {
  final int count;

  PageAState({this.count});
}

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

/// 整个app的state
class AppState {
  final PageAState pageAState;

  AppState({this.pageAState});
}

/// reducers
PageAState incrementCounter(PageAState oldState, IncrementAction action) {
  return PageAState(count: oldState.count + action.count);
}

AppState appReducers(AppState oldState, action) {
  return AppState(pageAState: incrementCounter(oldState.pageAState, action));
}

/// action
class IncrementAction {
  final int count;
  IncrementAction({@required this.count});
}

final Store<AppState> store = Store<AppState>(appReducers,
    initialState: AppState(pageAState: PageAState(count: 0)));

class ReduxDemo02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 把StoreProvider做为app的根widget
    /// 在它的下级widget的任务地方都可以获取到store
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ReduxDemo01'),
        ),

        /// 通过StoreConnector来获取store
        body: StoreConnector<AppState, PageAViewModel>(
          converter: (store) {
            return PageAViewModel(store: store, state: store.state.pageAState);
          },
          builder: (context, vm) {
            /// 页面里面使用ViewModel
            return Center(
                child: Column(
              children: <Widget>[
                Text('${vm.state.count}'),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: MaterialButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      vm.increment(2);
                    },
                  ),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
