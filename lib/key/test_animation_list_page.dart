import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/key/stateful_container.dart';
import 'package:my_flutter_demo/key/stateless_container.dart';

/// flutter key android animation list learn
/// 参考文章 https://juejin.cn/post/6844903811870359559
class TestAnimationListPage extends StatefulWidget {
  @override
  _TestAnimationListPageState createState() => _TestAnimationListPageState();
}

class _TestAnimationListPageState extends State<TestAnimationListPage> {

  List<String> data = ['Horse', 'Cow', 'Camel', 'Sheep', 'Goat'];

  final GlobalKey<AnimatedListState> globalKey = GlobalKey();

  int counter = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedList(
          key: globalKey,
          initialItemCount: data.length,
          itemBuilder: (
              BuildContext context,
              int index,
              Animation<double> animation,
              ) {
            //添加列表项时会执行渐显动画
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, index),
            );
          },
        ),
        buildAddBtn(),
      ],
    );
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add('${++counter}');
          // 告诉列表项有新添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $counter');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      //数字不会重复，所以作为Key
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        // 点击时删除
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  void onDelete(context, index) {
    // 待实现
  }
}
