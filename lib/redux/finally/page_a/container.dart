import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/redux/finally/app_redux/state.dart';
import 'package:redux_demo/redux/finally/page_a/page.dart';

import 'view_model.dart';

class PageAContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PageAViewModel>(
      converter: (store) =>
          PageAViewModel(store: store, state: store.state.pageAState),
      builder: (context, vm) {
        return PageAPage(
          vm: vm,
        );
      },
    );
  }
}
