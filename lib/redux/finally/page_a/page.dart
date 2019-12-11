import 'package:flutter/material.dart';
import 'view_model.dart';

class PageAPage extends StatelessWidget {
  final PageAViewModel vm;
  PageAPage({this.vm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Redux'),
      ),
      body: Center(
        child: Text('${vm.state.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.increment(2);
        },
        tooltip: '加一',
        child: Icon(Icons.add),
      ),
    );
  }
}
