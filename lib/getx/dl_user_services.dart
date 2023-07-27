
import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_flutter_demo/test_widget_level_page.dart';

class DLUserServices extends GetxController  with WidgetsBindingObserver {

  RxBool appBackground  = false.obs;
  bool _appDestroy  = false;
  Timer? _heartbeatTimer;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
    if (_heartbeatTimer != null)
      stop();
    _heartbeatTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      sendHeartbeat();
    });
  }

  stop() {
    WidgetsBinding.instance?.removeObserver(this);
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  sendHeartbeat() async {
    log("sendHeartbeat appDestroy:$_appDestroy");
    log("sendHeartbeat app_background:${appBackground.value}");
    if (appBackground.isTrue) {
      Get.to(() => TestWidgetLevelPage(),preventDuplicates: true);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    log("AppLifecycleState" + state.toString());
    switch (state) {
      case AppLifecycleState.paused:
      // 进入后台
        appBackground.value = true;
        break;
      case AppLifecycleState.resumed:
      // 进入前台
        appBackground.value = false;
        break;
      case AppLifecycleState.detached:
      // 双击退出应用
        _appDestroy = true;
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}