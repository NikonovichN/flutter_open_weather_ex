import 'package:bloc/bloc.dart';

import '../../../cities/cities.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final CitiesBloc _citiesBloc;

  MainPageBloc({required CitiesBloc citiesBloc})
      : _citiesBloc = citiesBloc,
        super(MainPageInitial()) {
    on<ListenDependencies>(_listenDependencies);
  }

  Future<void> _listenDependencies(ListenDependencies event, Emitter emit) async {
    emit(MainPageLoading());

    await _citiesBloc.stream.forEach((citiesState) {
      switch (citiesState) {
        case CitiesInitial():
          emit(MainPageLoading());
        case CitiesLoading():
          emit(MainPageLoading());
        case CitiesLoaded():
          emit(MainPageLoaded());
        case CitiesError():
          emit(MainPageError());
      }
    });
  }
}
