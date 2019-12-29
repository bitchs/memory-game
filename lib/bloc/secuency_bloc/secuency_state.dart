import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

enum Turno{
  player,
  computer
}

abstract class Turn extends Equatable {
  
  const Turn();
  @override
  List<Object> get props => [];
}

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
      gameTurn: [false, false, false, false],
      secuencyCount: 0,
    );
  }

  

  factory SecuencyState.setState(
      {@required SecuencyState state,
      List gameList,
      List humanList,
      bool humanTurn,
      List<bool> gameTurn,
      int secuencyCount}) {
    return SecuencyState(
      humanList: humanList ?? state.humanList,
      gameList: gameList ?? state.gameList,
      humanTurn: humanTurn ?? state.humanTurn,
      gameTurn: gameTurn ?? state.gameTurn,
      secuencyCount: secuencyCount ?? state.secuencyCount,
    );
  }

  factory SecuencyState.turnOff(prueba) {
    return SecuencyState(
      humanList: prueba.humanList,
      gameList: prueba.gameList,
      humanTurn: true,
      gameTurn: [false, false, false, false],
      secuencyCount: 0,
    );
  }
  SecuencyState turnOn(prueba, {bool humanTurn, int secuencyCount}) {
    return SecuencyState(
      gameList: gameList ?? prueba.gameList,
      humanList: humanList ?? prueba.humanList,
      humanTurn: humanTurn ?? prueba.humanTurn,
      gameTurn: gameTurn ?? prueba.gameTurn,
      secuencyCount: secuencyCount ?? prueba.secuencyCount,
    );
  }
}
