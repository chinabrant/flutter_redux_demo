import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// 简单使用flutter_redux的例子


int incrementCounter(int oldState, dynamic action) {
  return oldState + 1;
}

class IncrementAction {}

final Store<int> store = Store<int>(incrementCounter, initialState: 0);

class ReduxDemo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 把StoreProvider做为app的根widget
    /// 在它的下级widget的任务地方都可以获取到store
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ReduxDemo01'),
        ),

        /// 通过StoreConnector来获取store
        body: Container(
          child: StoreConnector<int, int>(
            converter: (store) => store.state,
            builder: (context, vm) {
              return Center(
                child: Text('$vm'),
              );
            },
          ),
        ),
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(IncrementAction());
          },
          builder: (context, callback) {
            return FloatingActionButton(
              tooltip: '加一',
              child: Icon(Icons.add),
              onPressed: callback,
            );
          },
        ),
      ),
    );
  }
}
