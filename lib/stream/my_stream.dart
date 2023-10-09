

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

class MyStream {

  ///定义一个Controller
  StreamController<String?>? _dataController;
  ///获取 StreamSink 做 add 入口
  StreamSink<String?>? get _dataSink => _dataController?.sink;
  ///获取 Stream 用于监听
  Stream<String?>? get _dataStream => _dataController?.stream;
  ///事件订阅对象
  StreamSubscription? _dataSubscription;


  init() {
    _dataController ??= StreamController.broadcast();
    // log("init _dataController:${_dataController.hashCode}");
    ///监听事件
    _dataSubscription = _dataStream?.listen((value){
      _dataSubscription?.cancel();
      ///do change
      log("listen event:$value,${_dataSubscription?.hashCode}");
      init();
    });


  }

  close() {
    ///关闭
    _dataSubscription?.cancel();
    _dataController?.close();
  }

  start() async {
    ///改变事件
    for (int i = 0; i< 10; i++) {
      await Future.delayed(Duration(seconds: 1), () {
        log("start _dataSink:${_dataSink.hashCode}");
        _dataSink?.add("sink:$i");
      });
    }

    // _dataStream.where(test).map(convert).transform(streamTransformer).listen(onData);
    // StreamBuilder<List<String>>(
    //     stream: _dataStream,
    //     initialData: ["none"],
    //     ///这里的 snapshot 是数据快照的意思
    //     builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
    //       ///获取到数据，为所欲为的更新 UI
    //       var data = snapshot.data;
    //       log("builder event:$data");
    //       return Container();
    //     });
  }

}