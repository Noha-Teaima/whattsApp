import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void SignUpData(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(SignUpLoading());
    var response = await Dio()
        .post("https://student.valuxapps.com/api/register", data: {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone
    });
    // List json = response.data;

    print(response.data.toString() + "hhhhhhhhhhhhhhhhhhhh");
    emit(SignUpSuccess());
  }
}
