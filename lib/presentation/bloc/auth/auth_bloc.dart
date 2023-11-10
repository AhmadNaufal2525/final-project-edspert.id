import 'package:course_app_edspert_id/src/data/datasource/auth_remote_datasource.dart';
import 'package:course_app_edspert_id/src/data/models/register_user_request_model.dart';
import 'package:course_app_edspert_id/src/data/models/user_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDataSource authRemoteDataSource ;
  AuthBloc({required this.authRemoteDataSource}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if (event is RegisterEvent) {
        emit(LoadingRegisterstate());
         emit(SucessRegisterstate());
        } else {
          emit(ErrorRegisterState(message: 'Register failed!'));
      }
    });
  }
}
