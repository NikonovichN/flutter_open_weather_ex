import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/data/locale_repository.dart';
import '../../domain/entity/locale.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final LocaleRepository _localeRepository;

  AppSettingsBloc({required LocaleRepository localeRepository})
      : _localeRepository = localeRepository,
        super(AppSettingsInitial()) {
    on<LoadAppSettingEvent>(_loadAppSettings);
    on<WriteLocaleAppSettingsEvent>(_writeLocaleAppSettings);
  }

  Future<void> _loadAppSettings(LoadAppSettingEvent event, Emitter emit) async {
    emit(AppSettingsLoading());

    final localeResponse = await _localeRepository.readLocale();

    localeResponse.fold(
      (error) => emit(AppSettingsError()),
      (locale) => emit(
        AppSettingsLoaded(localeEntity: locale),
      ),
    );
  }

  Future<void> _writeLocaleAppSettings(WriteLocaleAppSettingsEvent event, Emitter emit) async {
    final localeResponse = await _localeRepository.writeLocale(event.locale);
    localeResponse.fold(
      (error) => emit(AppSettingsError()),
      (right) {
        right ? emit(AppSettingsLoaded(localeEntity: event.locale)) : emit(AppSettingsError());
      },
    );
  }
}
