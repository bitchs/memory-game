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
    }
  }

  Stream<SecuencyState> _mapSecuencyToState(IncrementSecuency event) async* {
    if (state.humanTurn) {
      state.humanList.add(event.presedNumber);
      if (event.presedNumber == state.gameList[state.secuencyCount]) {
        print("bien");
        yield SecuencyState(
          gameList: state.gameList,
          humanList: state.humanList,
          humanTurn:
              (state.humanList.length == state.gameList.length) ? false : true,
          gameTurn: state.gameTurn + 1,
          secuencyCount: state.secuencyCount + 1,
          red: true,
          yellow: true,
          blue: true,
          green: true,
        );
      } else {
        print("lose");
        yield SecuencyState(
          gameList: [],
          humanList: [],
          humanTurn: false,
          gameTurn: state.gameTurn + 1,
          secuencyCount: 0,
          red: true,
          yellow: true,
          blue: true,
          green: true,
        );
      }
    }
  }

  Stream<SecuencyState> _mapComputerTurnToState(NewGame event) async* {
    if (!state.humanTurn) {
      // generar un numero random del 1 al 4
      int nextNumber = Random().nextInt(4);
      //agregar numero al estado lista
      state.gameList.add(nextNumber);

      print(state.gameList);

      //cambiar el estado de cada cuadro a pulsado duracion variable
      for (var item in state.gameList) {
        switch (item) {
          case 0:
            yield SecuencyState(
              gameList: state.gameList,
              humanList: [],
              humanTurn: true,
              gameTurn: state.gameTurn,
              secuencyCount: 0,
              red: false,
              yellow: true,
              blue: true,
              green: true,
            );
            break;
          case 1:
            yield SecuencyState(
              gameList: state.gameList,
              humanList: [],
              humanTurn: true,
              gameTurn: state.gameTurn,
              secuencyCount: 0,
              red: true,
              yellow: false,
              blue: true,
              green: true,
            );
            break;
          case 2:
            yield SecuencyState(
              gameList: state.gameList,
              humanList: [],
              humanTurn: true,
              gameTurn: state.gameTurn,
              secuencyCount: 0,
              red: true,
              yellow: true,
              blue: false,
              green: true,
            );
            break;
          case 3:
            yield SecuencyState(
              gameList: state.gameList,
              humanList: [],
              humanTurn: true,
              gameTurn: state.gameTurn,
              secuencyCount: 0,
              red: true,
              yellow: true,
              blue: true,
              green: false,
            );
            break;
          default:
        }
      }
    }
  }
}
