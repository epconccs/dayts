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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: StreamBuilder<DaytsState>(
            stream: _bloc.activity,
            initialData: DaytsDataState("Tap"),
            builder:
                (BuildContext context, AsyncSnapshot<DaytsState> snapshot) {
              return Container(
                  child: GestureDetector(
                      onTap: () => _bloc.daytsEventSink.add(NewActivityEvent()),
                      child: snapshot.data is DaytsLoadingState
                          ? CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.white))
                          : Text((snapshot.data as DaytsDataState).activity,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 60))));
            },
          ),
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
