import 'package:flutter/material.dart';
import 'package:forja/features/home/data/model/movice_model.dart';
import 'package:bloc/bloc.dart';
import 'package:forja/features/home/data/repo/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  void moviceData() async {
    emit(LoadingState());
    final response = await _homeRepo.home();
    emit(LoadedState(response));
  }
}
