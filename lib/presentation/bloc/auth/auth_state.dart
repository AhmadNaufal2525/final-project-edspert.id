part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}


final class LoadingRegisterstate extends AuthState {}

final class SucessRegisterstate extends AuthState {}

class ErrorRegisterState extends AuthState {
  final String message;

  ErrorRegisterState({required this.message});
}

class LoadingGetProfileState extends AuthState {}

class SuccessGetProfileState extends AuthState {
  final UserModelData userModel;

  SuccessGetProfileState({required this.userModel});
}

class ErrorGetProfileState extends AuthState {
  final String message;

  ErrorGetProfileState({required this.message});
}