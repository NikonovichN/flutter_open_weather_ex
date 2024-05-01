import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart' as rx;

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

    await rx.BehaviorSubject.seeded(_citiesBloc.stream).forEach((citiesState) async {
      await emit.forEach(
        citiesState,
        onData: (citiesData) => switch (citiesData) {
          CitiesInitial() => MainPageLoading(),
          CitiesLoading() => MainPageLoading(),
          CitiesLoaded() => MainPageLoaded(),
          CitiesError() => MainPageError(),
        },
      );
    });
  }
}
