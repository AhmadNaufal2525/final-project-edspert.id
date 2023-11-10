part of 'banner_bloc.dart';

abstract class BannerState {}

class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final BannerResponseModel bannerResponse;

  BannerSuccess({required this.bannerResponse});
}

final class BannerFailed extends BannerState {
  final String? message;

  BannerFailed({this.message});
}