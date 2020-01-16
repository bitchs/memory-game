import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import './secuency_event.dart';
import './secuency_state.dart';

export './secuency_event.dart';
export './secuency_state.dart';

class SecuencyBloc extends Bloc<SecuencyEvent, SecuencyState> {
  @override
  SecuencyState get initialState => SecuencyState.initial();

  @override
  Stream<SecuencyState> mapEventToState(SecuencyEvent event) async* {
    if (event is NewGame) {
      yield* _mapComputerTurnToState(event);
    } else if (event is IncrementSecuency) {
      yield* _mapSecuencyToState(event);
    } else if (event is ActiveButton) {
      yield* _mapActiveButtonToState(event);
    }
  }

  Stream<SecuencyState> _mapSecuencyToState(IncrementSecuency event) async* {
    if (state.humanTurn) {
      if (event.presedNumber == state.gameList[state.secuencyCount]) {
      
       
            print(state.secuencyCount);
        yield SecuencyState.setState(
            state: state, secuencyCount: state.secuencyCount + 1);

        if (state.gameList.last == state.gameList[state.secuencyCount]) {
          yield SecuencyState.setState(state: state, humanTurn: false);
        }
      } else {
        print("pierdes");
        yield SecuencyState.initial();
      }
    }
  }

  Stream<SecuencyState> _mapActiveButtonToState(ActiveButton event) async* {}

  Stream<SecuencyState> _mapComputerTurnToState(NewGame event) async* {
    if (!state.humanTurn) {
      // generar un numero random del 1 al 4
      //agregar numero al estado lista
      state.addRandomtToList();
      print(state.gameList);

      for (var i = 0; i < state.gameList.length; i++) {
        await Future.delayed(Duration(milliseconds: 400));
        yield SecuencyState.turnOff(state: this.state, i: state.gameList[i]);
        await Future.delayed(Duration(milliseconds: 300));
        yield SecuencyState.setState(
            state: this.state, gameTurn: initialState.gameTurn);
      }
      await Future.delayed(Duration(milliseconds: 100));
      yield SecuencyState.setState(state: state, humanTurn: true);
    }
  }
}
