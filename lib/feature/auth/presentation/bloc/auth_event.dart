part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterEvent extends AuthEvent {
  RegisterEvent({required this.typeUser});
  final TypeUser typeUser;
}

class LoginEvent extends AuthEvent {}

class CompleteRegisterDoc extends AuthEvent {}
