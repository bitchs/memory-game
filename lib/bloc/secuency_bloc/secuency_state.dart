import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class Turn extends Equatable {
  
  const Turn();
  @override
  List<Object> get props => [];
}

class State1 extends Turn{}
class State2 extends Turn{}

class SecuencyState extends Turn {

  final List gameList;
  final List humanList;
  final bool humanTurn;
  final int gameTurn;
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
      gameTurn: 0,
      secuencyCount : 0,
    );
  }

 
}
