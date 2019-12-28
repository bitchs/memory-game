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
      state.humanList.add(event.presedNumber);

      ///pregunta si el numero pulsado es igual al numero de la lista de juego
      if (event.presedNumber == state.gameList[state.secuencyCount]) {
        print("bien");

        ///si son iguales instancia [SecuencyState]
        yield SecuencyState(
          gameList: state.gameList,
          humanList: state.humanList,
          humanTurn:
              (state.secuencyCount + 1 == state.gameList.length) ? false : true,
          gameTurn: [false, false, false, false],
          secuencyCount: state.secuencyCount + 1,
        );
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
      int nextNumber = Random().nextInt(4);
      //agregar numero al estado lista
      state.gameList.add(nextNumber);
      
      for (var i = 0; i < state.gameList.length; i++) {
       
        await Future.delayed(Duration(milliseconds: 1000));
        
        state.gameTurn[0] = false;
        state.gameTurn[1] = false;
        state.gameTurn[2] = false;
        state.gameTurn[3] = false;
        state.gameTurn[state.gameList[i]] = true;
        print(state.gameList);
        print(state.gameTurn[state.gameList[i]]);

        if (i == state.gameList.length - 1) {
          yield SecuencyState(
            gameList: state.gameList,
            humanList: state.humanList,
            humanTurn: false,
            gameTurn: state.gameTurn,
            secuencyCount: 1,
          );
          await Future.delayed(Duration(milliseconds: 550));
          yield SecuencyState(
            gameList: state.gameList,
            humanList: state.humanList,
            humanTurn: true,
            gameTurn: [false, false, false, false],
            secuencyCount: 0,
          );
        } else {
          yield SecuencyState(
            gameList: state.gameList,
            humanList: state.humanList,
            humanTurn: false,
            gameTurn: state.gameTurn,
            secuencyCount: i,
          );
          await Future.delayed(Duration(milliseconds: 550));
          yield SecuencyState(
            gameList: state.gameList,
            humanList: state.humanList,
            humanTurn: false,
            gameTurn: [false, false, false, false],
            secuencyCount: 0,
          );
        }
      }
    }
  }
}
