import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void SignInData({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    var response =
        await Dio().post("https://student.valuxapps.com/api/login", data: {
      "email": email,
      "password": password,
    });

    // if(response.data.)
    // List json = response.data;

    print(response.data.toString() + "hhhhhhhhhhhhhhhhhhhh");
    emit(SignInSuccess());
  }
}
