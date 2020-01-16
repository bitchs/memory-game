
import 'dart:math';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

enum Turno { player, computer }

abstract class Turn extends Equatable {
  const Turn();
  @override
  List<Object> get props => [];
}

class SecuencyState extends Turn {
  final bool humanTurn;
  final List<int> gameList;
  final List<bool> gameTurn;
  final int secuencyCount;

  SecuencyState({
    this.humanTurn,
    this.gameList,
    this.gameTurn,
    this.secuencyCount,
  });

  @override
  List get props => [humanTurn, gameList, gameTurn];

  factory SecuencyState.initial() {
    return SecuencyState(
      humanTurn: false,
      gameTurn: [false, false, false, false],
      gameList: [],
      secuencyCount: 0,
    );
  }

  factory SecuencyState.turnOff({@required state, i}) {
    final List<bool> list = [false, false, false, false];
    list[i] = true;
    return SecuencyState(
      humanTurn: state.humanTurn,
      gameTurn: list,
      gameList: state.gameList,
      secuencyCount: state.secuencyCount,
    );
  }

  factory SecuencyState.setState(
      {
        @required SecuencyState state,
      bool humanTurn,
      List<int> gameList,
      List<bool> gameTurn,
      int secuencyCount, 
      }) {
    return SecuencyState(
      humanTurn: humanTurn ?? state.humanTurn,
      gameTurn: gameTurn ?? state.gameTurn,
      gameList: gameList ?? state.gameList,
      secuencyCount: secuencyCount ?? state.secuencyCount,
      
    );
  }

  void addRandomtToList() {
    gameList.add(Random().nextInt(4));
  }
}
