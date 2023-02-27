import 'package:equatable/equatable.dart';

class SwitchEvent extends Equatable{
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchEvent{}
class SwitchOffEvent extends SwitchEvent{}