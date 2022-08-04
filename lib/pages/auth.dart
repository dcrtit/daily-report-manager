import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:report_manager/config.dart';
import 'package:report_manager/models/login_request_model.dart';
import 'package:report_manager/services/api_service.dart';
import 'package:report_manager/utils/email_validation.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          child: Form(
            key: globalFormKey,
            child: _authPageUI(context),
          ),
        ),
      ),
    );
  }

  Widget _authPageUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: FormHelper.inputFieldWidgetWithLabel(
                      context,
                      'email',
                      'Email',
                      'example@example.com',
                      (onValidateVal) {
                        if (onValidateVal.isEmpty) {
                          return 'Email can\'t be empty...';
                        }

                        if (validateEmail(onValidateVal)) {
                          return 'Email must be a valid...';
                        }

                        return null;
                      },
                      (onSavedVal) {
                        email = onSavedVal;
                      },
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.deepPurple,
                        size: 24.0,
                      ),
                      paddingLeft: 0,
                      paddingRight: 0,
                      borderRadius: 4,
                      borderColor: Colors.black26,
                      borderFocusColor: Colors.deepPurple,
                      hintColor: Colors.black45,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: FormHelper.inputFieldWidgetWithLabel(
                    context,
                    'password',
                    'Password',
                    'Enter password',
                    (onValidateVal) {
                      if (onValidateVal.isEmpty) {
                        return 'Password can\'t be empty...';
                      }

                      return null;
                    },
                    (onSavedVal) {
                      password = onSavedVal;
                    },
                    prefixIcon: const Icon(
                      Icons.ac_unit,
                      color: Colors.deepPurple,
                      size: 24.0,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Colors.deepPurple,
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      iconSize: 24.0,
                    ),
                    obscureText: hidePassword,
                    paddingLeft: 0,
                    paddingRight: 0,
                    borderRadius: 4,
                    borderColor: Colors.black26,
                    borderFocusColor: Colors.deepPurple,
                    hintColor: Colors.black45,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 14.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Forget Password?',
                            style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                print('Forget Password!')
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  child:
                    FormHelper.submitButton(
                      'Sign In',
                      () {
                        if (validateAndSave()) {
                          login();
                        }
                      },
                      btnColor: Colors.deepPurple,
                      borderColor: Colors.transparent,
                      txtColor: Colors.white,
                      borderRadius: 4,
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form!.validate()) {
      form.save();

      return true;
    }

    return false;
  }

  Future<void> login () async {
    setState(() {
      isAPICallProcess = true;
    });

    LoginRequestModel model = LoginRequestModel(email: email as String, password: password as String);

    APIService.login(model)
      .then((response) {
        setState(() {
          isAPICallProcess = false;
        });

        if (response) {
          Navigator.pushNamedAndRemoveUntil(context, '/manager', (route) => false);
        } else {
          FormHelper.showSimpleAlertDialog(
              context,
              Config.appName,
              'Invalid Email/Password!',
              'Ok',
              () {
                Navigator.pop(context);
              }
          );
        }
      });
  }
}
