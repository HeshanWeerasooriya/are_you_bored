part of 'bored_bloc.dart';

abstract class BoredEvent extends Equatable {
  const BoredEvent();
}

class LoadApiEvent extends BoredEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetEvent extends BoredEvent {
  @override
  List<Object?> get props => [];
}
