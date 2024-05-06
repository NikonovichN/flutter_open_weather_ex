part of 'app_settings_bloc.dart';

sealed class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object> get props => [];
}

final class LoadAppSettingEvent extends AppSettingsEvent {
  const LoadAppSettingEvent();
}

final class WriteLocaleAppSettingsEvent extends AppSettingsEvent {
  final LocaleEntity locale;
  const WriteLocaleAppSettingsEvent({required this.locale});
  @override
  List<Object> get props => [locale];
}
