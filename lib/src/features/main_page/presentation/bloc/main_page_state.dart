part of 'main_page_bloc.dart';

sealed class MainPageState {
  const MainPageState();
}

final class MainPageInitial extends MainPageState {}

final class MainPageLoading extends MainPageState {}

final class MainPageLoaded extends MainPageState {}

final class MainPageError extends MainPageState {}
