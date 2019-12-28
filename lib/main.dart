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
        primarySwatch: Colors.blue,
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
      child: Scaffold(
          appBar: AppBar(
            title: Text("holass"),
          ),
          body: Column(
            children: <Widget>[
              BoardGame(),
              ButtonNewGame(),
            ],
          )),
    );
  }
}

class BoardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(
      builder: (context, state) {
        return Flexible(
          child: GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: List<Widget>.generate(
                4, (index) => Button(buttonsMap: buttons, i: index, state:state)),
          ),
        );
      }
    );
  }
}

class ButtonNewGame extends StatelessWidget {
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("nuevo juego"),
      onPressed: () => BlocProvider.of<SecuencyBloc>(context).add(
        NewGame(),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Map<String, dynamic> buttonsMap;
  final int i;
  final state;

  Button({this.buttonsMap, this.i, this.state});

  Widget build(BuildContext context) {
    print(state.gameList);
    final buttonInfo = buttonsMap["${buttonsMap.keys.toList()[i]}"];
    return RaisedButton(
      onPressed: () => BlocProvider.of<SecuencyBloc>(context)
          .add(IncrementSecuency(presedNumber: i)),
      color: buttonInfo["color"],
    );
  }
}

final Map<String, dynamic> buttons = {
  "blue": {
    "color": Colors.blue,
    "colorActivo": Colors.blue[300],
    "numero": 0,
  },
  "red": {
    "color": Colors.red,
    "colorActivo": Colors.red[300],
    "numero": 1,
  },
  "green": {
    "color": Colors.green,
    "colorActivo": Colors.green[300],
    "numero": 2,
  },
  "yellow": {
    "color": Colors.yellow,
    "colorActivo": Colors.yellow[300],
    "numero": 3,
  },
};
