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
    return Flexible(
      child: GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          RedButton(),
          GreenButton(),
          BlueButton(),
          YellowButton(),
        ],
      ),
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
/*
abstract class ButtonsGame{
  final Color color;

  ButtonsGame(this.color);
  }

class ReedButton{
  final list = "string";
  
  
}
*/
class RedButton extends StatelessWidget {

  final Color red = Colors.red;
  final Color redligth = Colors.red[300];
  final int numero = 0;

  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(
      builder: (context, state) {
        return RaisedButton(
            onPressed: () => BlocProvider.of<SecuencyBloc>(context)
                .add(IncrementSecuency(presedNumber: this.numero)),
            color: (state.red) ? red : redligth);
      },
    );
  }
}

class GreenButton extends StatelessWidget {

  final Color green = Colors.green;
  final Color greenligth = Colors.green[300];
  final int numero = 1;

  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(
      builder: (context, state) {
        return RaisedButton(
            onPressed: () => BlocProvider.of<SecuencyBloc>(context)
                .add(IncrementSecuency(presedNumber: this.numero)),
            color: (state.green) ? green : greenligth);
      },
    );
  }
}

class BlueButton extends StatelessWidget {

  final Color blue = Colors.blue;
  final Color blueligth = Colors.blue[300];
  final int numero = 2;

  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(
      builder: (context, state) {
        return RaisedButton(
            onPressed: () => BlocProvider.of<SecuencyBloc>(context)
                .add(IncrementSecuency(presedNumber: this.numero)),
            color: (state.blue) ? blue : blueligth);
      },
    );
  }
}



class YellowButton extends StatelessWidget {

  final Color yellow = Colors.yellow;
  final Color yellowligth = Colors.yellow[300];
  final int numero = 3;

  Widget build(BuildContext context) {
    return BlocBuilder<SecuencyBloc, SecuencyState>(
      builder: (context, state) {
        return RaisedButton(
            onPressed: () => BlocProvider.of<SecuencyBloc>(context)
                .add(IncrementSecuency(presedNumber: this.numero)),
            color: (state.yellow) ? yellow : yellowligth);
      },
    );
  }
}
