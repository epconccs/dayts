import 'dart:async';

import 'package:dayts/screens/home/dayts_event.dart';

class DaytsBloc {
  int _counter = 0;

  final _daytsStateController = StreamController<int>();
  StreamSink<int> get _inActivity => _daytsStateController.sink;
  Stream<int> get activity => _daytsStateController.stream;

  final _daytsEventController = StreamController<DaytsEvent>();
  Sink<DaytsEvent> get daytsEventSink => _daytsEventController.sink;

  DaytsBloc() {
    _daytsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(DaytsEvent event) {
    if (event is NewActivityEvent) _counter++;
    _inActivity.add(_counter);
  }

  void dispose() {
    _daytsStateController.close();
    _daytsEventController.close();
  }
}
