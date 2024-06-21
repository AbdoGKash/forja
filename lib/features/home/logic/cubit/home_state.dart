part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final Movies movice;
  LoadedState(this.movice);
}
