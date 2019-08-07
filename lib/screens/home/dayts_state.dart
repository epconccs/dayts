class DaytsState {
  DaytsState();

  factory DaytsState.daytsData(String string) = DaytsDataState;
  factory DaytsState.daytsLoading() = DaytsLoadingState;
}

class DaytsDataState extends DaytsState {
  DaytsDataState(this.activity);
  final String activity;
}

class DaytsLoadingState extends DaytsState {}
