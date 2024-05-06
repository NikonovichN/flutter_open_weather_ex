part of 'app_settings_bloc.dart';

sealed class AppSettingsState extends Equatable {
  const AppSettingsState();

  @override
  List<Object> get props => [];
}

final class AppSettingsInitial extends AppSettingsState {}

final class AppSettingsLoading extends AppSettingsState {}

final class AppSettingsLoaded extends AppSettingsState {
  static const defaultValue = LocaleEntity(name: '');

  final LocaleEntity localeEntity;

  const AppSettingsLoaded({this.localeEntity = defaultValue});

  @override
  List<Object> get props => [localeEntity];
}

final class AppSettingsError extends AppSettingsState {}
