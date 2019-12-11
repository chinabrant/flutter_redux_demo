import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/redux/finally/app_redux/state.dart';

import 'action.dart';

List<Middleware<AppState>> pageAMiddlewares() {
  return [
    TypedMiddleware<AppState, IncrementAction>(_incrementMiddleware()),
  ];
}

/// 这个middleware会拦截IncrementAction
Middleware<AppState> _incrementMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) {
    /// 调用next会直接把这个action发送给reducer
    /// 如果不调用next，那么这个action就会在这里终止，不会再传递到reducer
    

    print("拦截到了 IncrementAction");

    Future.delayed(Duration(seconds: 2)).then((result) {
      next(action);
    });

    /// middleware 主要被设计用来处理一些耗时任务
    /// 如：发起网络请求，操作数据库，操作文件等
    /// 在耗时任务完成后，可以通过 next(action);把这个action再发出去，
    /// 或者使用store发送一个新的 action
    /// 注意：如果不用next发送action，那么这个action还是会被middleware拦截，
    /// next发送的action不会被middleware拦截
  };
}