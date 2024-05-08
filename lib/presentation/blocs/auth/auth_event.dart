part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
    const factory AuthEvent.login({
      required String username,
      required String password,
    }) = _login;
    const factory AuthEvent.register({
      required String username,
      required String password,
      required String firstName,
      required String lastName,
      required String email,
      required String phone
      
    }) = _Register;

}