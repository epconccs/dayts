import 'package:dayts/data/activity_repository.dart';
import 'package:dayts/screens/home/dayts_bloc.dart';
import 'package:dayts/screens/home/dayts_event.dart';
import 'package:dayts/screens/home/dayts_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bloc = DaytsBloc(ActivityRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: StreamBuilder<DaytsState>(
          stream: _bloc.activity,
          initialData: DaytsDataState("Tap"),
          builder: (BuildContext context, AsyncSnapshot<DaytsState> snapshot) {
            return Container(
              child: GestureDetector(
                onTap: () => _bloc.daytsEventSink.add(NewActivityEvent()),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Center(
                      child: Text(
                          snapshot.data is DaytsLoadingState
                              ? "Loading"
                              : (snapshot.data as DaytsDataState).activity,
                          style: TextStyle(fontSize: 20))),
                  decoration: new BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
