import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Turn extends Equatable {
  const Turn();
  @override
  List<Object> get props => [];
}

class SecuencyState extends Turn {

  final List gameList;
  final List humanList;
  final bool humanTurn;
  final int gameTurn;
  final int secuencyCount;

  final bool red;
  final bool blue;
  final bool yellow;
  final bool green;


  SecuencyState({
    this.gameList,
    this.humanList,
    this.humanTurn,
    this.gameTurn,
    this.secuencyCount,
    this.red,
    this.yellow,
    this.blue,
    this.green,
  });
  @override
  List get props => [humanList, gameList, humanTurn, gameTurn, secuencyCount, red, yellow, green, blue];

  factory SecuencyState.initial() {
    return SecuencyState(
      humanList: [],
      gameList: [],
      humanTurn: false,
      gameTurn: 0,
      secuencyCount : 0,
      red: true,
      blue: true,
      yellow: true,
      green: true,
    );
  }

  SecuencyState copyWith({
    List humanList,
    List gameList,
    bool humanTurn,
    int gameTurn,
    int secuencyCount,
    bool red,
    bool blue,
    bool green,
    bool yelow,
  }) {
    return SecuencyState(
      humanList: humanList ?? this.humanList,
      gameList: gameList ?? this.gameList,
      humanTurn: humanTurn ?? this.humanTurn,
      gameTurn: gameTurn ?? this.gameTurn,
      secuencyCount: secuencyCount ?? this.secuencyCount,
      red: red ?? this.red,
      blue: blue ?? this.blue,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
    );
  }
}
