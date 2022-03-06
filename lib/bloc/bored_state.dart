part of 'bored_bloc.dart';

abstract class BoredState extends Equatable {
  const BoredState();
}

class HomeLoadingState extends BoredState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends BoredState {
  final String activityName;
  final String activityType;
  final int participants;

  HomeLoadedState(this.activityName, this.activityType, this.participants);
  @override
  // TODO: implement props
  List<Object?> get props => [activityName, activityType, participants];
}

class HomeNoInternetState extends BoredState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
