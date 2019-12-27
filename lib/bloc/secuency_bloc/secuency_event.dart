import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SecuencyEvent extends Equatable {
  const SecuencyEvent();

  @override
  List<Object> get props => [];
}

class NewGame extends SecuencyEvent {}

class IncrementSecuency extends SecuencyEvent {
  final int presedNumber;
  final String colorPressed;
  

  const IncrementSecuency(
      {this.presedNumber, this.colorPressed});

  @override
  List<Object> get props => [presedNumber, colorPressed];
}
