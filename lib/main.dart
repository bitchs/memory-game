import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/secuency_bloc/secuency_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Color.fromRGBO(30, 40, 50, 1),
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SecuencyBloc>(builder: (context) => SecuencyBloc())
        ],
        child:
            BlocBuilder<SecuencyBloc, SecuencyState>(builder: (context, state) {
          return Scaffold(
            persistentFooterButtons: <Widget>[
              Container(
                width: 1000,
                margin: EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // scrollDirection: Axis.horizontal,
                  children: List.generate(
                    (state.humanTurn) ? 0 : 1,
                    (i) => FloatingActionButton(
                      child: Text("${state.gameList.length + 1 }"),
                        onPressed: () =>
                            BlocProvider.of<SecuencyBloc>(context).add(
                              NewGame(),
                            )),
                  ),
                ),
              )
            ],
            backgroundColor: Colors.white10,
            body: Center(child: BoardGame()),
          );
        }));
  }
}

class BoardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(builder: (context, state) {
      return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 170),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: List<Widget>.generate(
            4,
            (index) => Button(
                  buttonsMap: buttons,
                  i: index,
                  state: state,
                )),
      );
    });
  }
}

class Button extends StatelessWidget {
  final Map<String, dynamic> buttonsMap;
  final int i;
  final state;

  Button({this.buttonsMap, this.i, this.state});

  Widget build(BuildContext context) {
    //print(state.gameList);
    final buttonInfo = buttonsMap["${buttonsMap.keys.toList()[i]}"];
    return RaisedButton(
      elevation: 0,
      onPressed: () => (state.humanTurn)
          ? BlocProvider.of<SecuencyBloc>(context)
              .add(IncrementSecuency(presedNumber: i))
          : null,
      color: (!state.gameTurn[i])
          ? buttonInfo["color"]
          : buttonInfo["colorActivo"],
    );
  }
}

final Color color = Colors.transparent;
final Map<String, dynamic> buttons = {
  "blue": {
    "color": Colors.blue,
    "colorActivo": color,
    "numero": 0,
  },
  "red": {
    "color": Colors.red,
    "colorActivo": color,
    "numero": 1,
  },
  "green": {
    "color": Colors.green,
    "colorActivo": color,
    "numero": 2,
  },
  "yellow": {
    "color": Colors.yellow,
    "colorActivo": color,
    "numero": 3,
  },
};
