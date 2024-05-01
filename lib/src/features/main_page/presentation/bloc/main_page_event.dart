part of 'main_page_bloc.dart';

sealed class MainPageEvent {
  const MainPageEvent();
}

final class ListenDependencies extends MainPageEvent {
  const ListenDependencies();
}
