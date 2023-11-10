import 'package:course_app_edspert_id/src/data/datasource/banner_remote_datasource.dart';
import 'package:course_app_edspert_id/src/data/models/banner_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRemoteDataSource bannerRemoteDataSource ;
  BannerBloc({required this.bannerRemoteDataSource}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if(event is GetBannerListEvent) {
        emit(BannerLoading());

        final result = await bannerRemoteDataSource.getBanner();

        emit(BannerSuccess(bannerResponse: result));
      }
    });
  }
}
