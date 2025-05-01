import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';
import 'package:se7ety/core/constants/enum/type_user.dart';
import 'package:se7ety/feature/auth/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        await register(event, emit);
      } else if (event is LoginEvent) {
        await logIn(event, emit);
      } else if (event is CompleteRegisterDoc) {
        await completeRegisterDoc(event, emit);
      }
    });
  }

  String? path;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController specializtionController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController opentimeController = TextEditingController();
  TextEditingController closetimeController = TextEditingController();

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    var response = await AuthRepo.register(
      emailController.text,
      passwordController.text,
      nameController.text,
      event.typeUser,
    );
    if (response == StatusRequest.success) {
      emit(AuthSuccess());
    } else if (response == StatusRequest.failureWeakPassword) {
      emit(AuthError('كلمة المرور المقدمة ضعيفة جدًا.'));
    } else if (response == StatusRequest.failureEmailExists) {
      emit(AuthError("الحساب موجود بالفعل لهذا البريد الإلكتروني."));
    } else {
      emit(AuthError("هناك شيء خاطئ"));
    }
  }

  Future<void> logIn(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    var response = await AuthRepo.login(
      emailController.text,
      passwordController.text,
    );
    if (response == StatusRequest.success) {
      emit(AuthSuccess());
    } else if (response == StatusRequest.failureEmialNotExists) {
      emit(AuthError("لم يتم العثور على مستخدم لهذا البريد الإلكتروني."));
    } else if (response == StatusRequest.failurePasswordWrong) {
      emit(AuthError('تم إدخال كلمة مرور خاطئة لهذا المستخدم.'));
    } else {
      emit(AuthError("هناك شيء خاطئ"));
    }
  }

  Future<void> completeRegisterDoc(
    CompleteRegisterDoc event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    var name = path?.split("/").last ?? "image";
    var response = await AuthRepo.completeRegisterDoc({
      "image": "doctor/${LocalStorageApp.getData('uid')}/$name",
      "phone1": phone1Controller.text,
      "phone2": phone2Controller.text,
      "address": addressController.text,
      "openHour": opentimeController.text,
      "closeHour": closetimeController.text,
      "bio": introductionController.text,
      "specialization": specializtionController.text,
    });
    if (response == StatusRequest.success) {
      if (path != null) {
        AuthRepo.upLoadImage(
          "doctor/${LocalStorageApp.getData('uid')}/$name",
          path!,
        );
      }
      emit(AuthSuccess());
    } else {
      emit(AuthError("Some thing is wrong"));
    }
  }
}
