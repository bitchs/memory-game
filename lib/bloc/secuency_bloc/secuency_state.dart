import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Turn extends Equatable {
  const Turn();
  @override
  List<Object> get props => [];
}
/*
class State1 extends Turn{}

class State2 extends Turn{}

class GeneralState extends Turn{
  //final List gameList;
  final List humanList;

  GeneralState({this.humanList});

}*/

class SecuencyState extends Turn {
  final List gameList;
  final List humanList;
  final bool humanTurn;
  final List<bool> gameTurn;
  final int secuencyCount;

  SecuencyState({
    this.gameList,
    this.humanList,
    this.humanTurn,
    this.gameTurn,
    this.secuencyCount,
  });
  @override
  List get props => [humanList, gameList, humanTurn, gameTurn, secuencyCount];

  factory SecuencyState.initial() {
    return SecuencyState(
      humanList: [],
      gameList: [],
      humanTurn: false,
      gameTurn: [false, false, false,false],
      secuencyCount: 0,
    );
  }

  SecuencyState copyWith({
    List gameList,
    List humanList,
    bool humanTurn,
    List<bool> gameTurn,
    int secuencyCount,
  }) {
    return SecuencyState(
      gameList: gameList ?? this.gameList,
      humanList: humanList ?? this.humanList,
      humanTurn: humanTurn ?? humanTurn,
      gameTurn: gameTurn ?? this.gameTurn,
      secuencyCount: secuencyCount ?? this.secuencyCount,
    );
  }
}
