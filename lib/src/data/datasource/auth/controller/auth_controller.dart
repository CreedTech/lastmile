import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/models/user_model.dart';
import 'package:lastmile/src/data/repository/auth_repo.dart';
import 'package:lastmile/src/presentation/auth/login/view/forgot_password_otp_verify_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/login_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/reset_password_view.dart';
import 'package:lastmile/src/presentation/auth/login/view/successful_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_alert.dart';
import 'package:lastmile/utils/show_snackbar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository);
});
// AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

class AuthController extends StateNotifier<AsyncValue<bool>> {
  AuthRepository authRepository;
  bool isLoading = false;
  // bool get loading => _isLoading;
  AuthController(this.authRepository) : super(const AsyncLoading());

  Future signUp(BuildContext context, firstName, lastName, email, password,
      phoneNumber, howDidYouHear) async {
    print("Fields");
    print(firstName);
    print(lastName);
    print(email);
    print(password);
    print(phoneNumber);
    print(howDidYouHear);
    isLoading = true;

    if (firstName.isEmpty ||
        firstName == '' ||
        lastName.isEmpty ||
        lastName == '' ||
        email.isEmpty ||
        email == '' ||
        password.isEmpty ||
        password == '' ||
        phoneNumber.isEmpty ||
        phoneNumber == '' ||
        howDidYouHear.isEmpty ||
        howDidYouHear == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }
    UserModel user = UserModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      print('Got here in auth contrl');
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.signUp(user.toJson());
      // EasyLoading.dismiss();
      state = const AsyncData(false);
      if (response.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessfulView(
                // email: email,
                ),
          ),
        );
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("username is too short")) {
        message = 'username is too short';
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        // custTomDialog(context, message,
        //     additionalText:
        //         "Username too short. Please choose a longer username.");
        return;
      } else if (response.success == false &&
          response.message.contains("Phone Number already taken")) {
        message = "Phone Number already taken";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        // custTomDialog(context, message,
        //     additionalText:
        //         "I'm sorry, but it seems the phone number you provided is already in use.");

        return;
      } else if (response.success == false &&
          response.message
              .contains("String must contain at least 11 character(s)")) {
        message = "Phone Number must be at least 11";
        // custTomDialog(
        //   context,
        //   message,
        // );
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("Password is too short")) {
        message = "Password is too short";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Uh-oh! Your password is too short. Please choose a password that meets our security requirements to help keep your account safe');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("Email is already taken")) {
        message = "Email is already taken";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Sorry, but it appears that the email you entered is already taken. Please try using a different email address.');

        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("Invalid email")) {
        message = "Invalid email";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Oops! It seems the email you provided is invalid. Please double-check and try again');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Something went wrong. Please check your internet connection and try again.');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      print('This is the error ' + e.toString());

      message = "Ooops something went wrong";
      // custTomDialog(context, message,
      //     additionalText:
      //         'Something went wrong. Please check your internet connection and try again.');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      return;
      //  debugPrint(state.toString());
      // print(e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future signIn(BuildContext context, email, password) async {
    isLoading = true;
    if (email.isEmpty || email == '' || password.isEmpty || password == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }
    Map<String, dynamic> user = {'email': email, 'password': password};
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      print('Got here in auth contrl');
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.signIn(user);
      // EasyLoading.dismiss();
      state = const AsyncData(false);
      print('response.message');
      print(response.message);
      if (response.success == true) {
        isLoading = false;
        // authStatus = AuthStatus.LOGGED_IN;
        await getUserData(context)
            .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
                  // RouteList.pin_code,
                  home,
                  (route) => false,
                ));

        return;
      } else
        print(response.message.toString());
      // authStatus = AuthStatus.NOT_LOGGED_IN;

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("Incorrect credentials")) {
        // authStatus = AuthStatus.NOT_LOGGED_IN;
        message = "Incorrect credentials";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        // custTomDialog(context, message,
        //     additionalText:
        //         'Oops! Incorrect credentials. Please double-check your username and password.');
        return;
      } else if (response.success == false &&
          response.message
              .contains("User not verified, please verify your account")) {
        // authStatus = AuthStatus.NOT_LOGGED_IN;
        message = "User not verified, please verify your account";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        // Navigator.of(context).pushNamed(otp_verify, arguments: email);
        return;
      } else {
        // authStatus = AuthStatus.NOT_LOGGED_IN;
        // to capture other errors later
        message = "Something went wrong";

        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        // custTomDialog(context, message,
        //     additionalText:
        //         'Something went wrong. Please check your internet connection and try again.');

        return;
      }
      // state = const AsyncLoading();

      // state = AsyncData(true);
    } catch (e) {
      // authStatus = AuthStatus.NOT_LOGGED_IN;
      // state = AsyncData(false);
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      // custTomDialog(context, message,
      //     additionalText:
      //         'Something went wrong. Please check your internet connection and try again.');

      return;
      //  debugPrint(state.toString());
      // print(e.toString());
    } finally {
      isLoading = false;
      return;
    }
  }

  Future verifyOtp(BuildContext context, email, otp) async {
    print("Fields");
    print(email);
    print(otp);
    isLoading = true;
    if (otp.isEmpty || otp == '') {
      // showSnackBar(context: context, content: 'All fields are required');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: 'All fields are required',
        ),
      );
      return;
    }
    Map<String, dynamic> body = {'email': email, 'otp': otp};
    print("body");
    print(body);
    String message;

    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      final response = await authRepository.verifyOtp(body);
      // EasyLoading.dismiss();
      if (response.success) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
        return;
      } else if (response.success == false &&
          response.message.contains("Invalid OTP")) {
        message = "Invalid OTP";
        // showSnackBar(context: context, content: message);
        // custTomDialog(
        //   context,
        //   message,
        // );
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("This otp has expired")) {
        message = "This otp has expired";
        // custTomDialog(context, message);
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      message = "Ooops something went wrong";
      // custTomDialog(context, message);
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      // EasyLoading.dismiss();

      return;
    } finally {
      isLoading = false;
    }
  }

  Future resendOtp(BuildContext context, email) async {
    print(email);
    isLoading = true;
    if (email.isEmpty || email == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }

    Map<String, dynamic> mail = {'email': email};
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.resendOTP(mail);
      // EasyLoading.dismiss();
      if (response.success) {
        resendVerification(context);
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("User not found")) {
        message = "User not found";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        // custTomDialog(context, message,
        //     additionalText:
        //         'Oops! It seems the email you provided is invalid. Please double-check and try again');
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Something went wrong. Please check your internet connection and try again.');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      // custTomDialog(context, message,
      //     additionalText:
      //         'Something went wrong. Please check your internet connection and try again.');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    } finally {
      isLoading = false;
    }
  }

  Future verifyForgotPasswordOtp(BuildContext context, email, otp) async {
    print("Fields");
    print(email);
    print(otp);
    isLoading = true;
    if (otp.isEmpty || otp == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }
    Map<String, dynamic> body = {'email': email, 'otp': otp};
    print("body");
    print(body);
    String message;

    try {
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      final response = await authRepository.verifyForgotPasswordOtp(body);
      // EasyLoading.dismiss();
      if (response.success) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPasswordView(email: email)));
        return;
      } else if (response.success == false &&
          response.message.contains("Invalid OTP")) {
        message = "Invalid OTP";
        // showSnackBar(context: context, content: message);
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("This otp has expired")) {
        message = "This otp has expired";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    }
    return;
  }

  Future forgotPassword(BuildContext context, email) async {
    print(email);
    isLoading = true;
    if (email.isEmpty || email == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }

    Map<String, dynamic> mail = {'email': email};
    print(mail);
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.forgotPassword(mail);
      if (response.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotPasswordOtpVerification(
                // email: email
                ),
          ),
        );
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("User not found")) {
        message = "User not found";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    } finally {
      isLoading = false;
    }
  }

  Future resetPassword(
      BuildContext context, email, newPassword, repeatPassword) async {
    print("email");
    print(email);
    print("newPassword");
    print(newPassword);
    print("repeatPassword");
    print(repeatPassword);
    isLoading = true;
    if (email.isEmpty ||
        email == '' ||
        newPassword.isEmpty ||
        newPassword == '' ||
        repeatPassword.isEmpty ||
        repeatPassword == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }

    Map<String, dynamic> params = {
      'email': email,
      "newPassword": newPassword,
      'repeatPassword': repeatPassword
    };
    print('params');
    print(params);
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.resetPassword(params);
      if (response.success) {
        resetPasswordDialog(context);
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("User not found")) {
        message = "User not found";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Oops! It seems the email you provided is invalid. Please double-check and try again');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else if (response.success == false &&
          response.message.contains("Passwords do not match")) {
        message = "Oops! The Passwords you entered does not match!";
        // cusTomDialog(context, message);
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        // custTomDialog(context, message,
        //     additionalText:
        //         'Something went wrong. Please check your internet connection and try again.');
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      // custTomDialog(context, message,
      //     additionalText:
      //         'Something went wrong. Please check your internet connection and try again.');
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
      return;
    } finally {
      isLoading = false;
    }
  }

  Future resendPasswordOtp(BuildContext context, email) async {
    print(email);
    isLoading = true;
    if (email.isEmpty || email == '') {
      showSnackBar(context: context, content: 'All fields are required');
      return;
    }

    Map<String, dynamic> mail = {'email': email};
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.resendPasswordOtp(mail);
      if (response.success) {
        resendVerification(context);
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("User not found")) {
        message = "User not found";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    } finally {
      isLoading = false;
    }
  }

  Future getUserData(BuildContext context) async {
    isLoading = true;
    String message;
    try {
      isLoading = true;
      state = const AsyncLoading();
      // EasyLoading.show(
      //   indicator: CustomLoader(),
      //   maskType: EasyLoadingMaskType.clear,
      //   dismissOnTap: true,
      // );
      var response = await authRepository.getUserData();
      if (response.success) {
        // EasyLoading.dismiss();
        isLoading = false;
        // notifyListeners();
        state = AsyncValue.data(true);
        return;
      } else
        print(response.message.toString());

      // check for different reasons to enhance users experience
      if (response.success == false &&
          response.message.contains("invalid signature")) {
        message = "User info could not be retrieved , Try again later.";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );
        return;
      } else {
        // to capture other errors later
        message = "Something went wrong";
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: message,
          ),
        );

        return;
      }
    } catch (e) {
      // EasyLoading.dismiss();
      state = AsyncError(e, StackTrace.current);
      message = "Ooops something went wrong";
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );

      return;
    } finally {
      isLoading = false;
      // EasyLoading.dismiss();
      return;
    }
  }
}
