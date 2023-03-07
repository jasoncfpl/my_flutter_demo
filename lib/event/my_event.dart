

import 'package:event_bus/event_bus.dart';



class MyEventBus {

  static EventBus _eventBus = EventBus();

  static EventBus getInstance() {
    return _eventBus;
  }

}

class EventErrorPageClose {

}