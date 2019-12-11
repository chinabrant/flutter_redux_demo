import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/redux/finally/app_redux/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/redux/finally/page_a/container.dart';
import 'package:redux_demo/redux/finally/page_a/middleware.dart';

import 'app_redux/reducer.dart';

/// Store初始化
/// middleware: pageAMiddlewares() + pageBMiddlewares() + ...
final Store<AppState> store = Store<AppState>(appReducers,
    initialState: initAppState(), middleware: pageAMiddlewares());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: PageAContainer(),
    );
  }
}
