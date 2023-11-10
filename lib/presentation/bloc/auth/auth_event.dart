part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterUserRequestModel request;

  RegisterEvent({required this.request});
}

class GetUserProfileEvent extends AuthEvent {}