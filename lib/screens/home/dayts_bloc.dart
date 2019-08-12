import 'dart:async';

import 'package:dayts/data/activity_repository.dart';
import 'package:dayts/screens/home/dayts_event.dart';
import 'package:dayts/screens/home/dayts_state.dart';

class DaytsBloc {
  final ActivityRepository _repository;
  final _daytsStateController = StreamController<DaytsState>();

  StreamSink<DaytsState> get _inActivity => _daytsStateController.sink;
  Stream<DaytsState> get activity => _daytsStateController.stream;

  final _daytsEventController = StreamController<DaytsEvent>();
  Sink<DaytsEvent> get daytsEventSink => _daytsEventController.sink;

  DaytsBloc(this._repository) {
    _daytsEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(DaytsEvent event) {
    _inActivity.add(DaytsState.daytsLoading());
    if (event is NewActivityEvent) {
      _repository.getActivity().then((activity) {
        _inActivity.add(DaytsState.daytsData(activity.description));
      });
    }
  }

  void dispose() {
    _daytsStateController.close();
    _daytsEventController.close();
  }
}
