import 'package:beyond/CustomWidget/Util/utils.dart';
import 'package:flutter/material.dart';
import 'package:beyond/Constant/Value/Dimens.dart';
import 'package:beyond/Constant/Value/AppTheme.dart';
import '../Home/HomePage.dart';
import 'LoginService.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  _SignInState();

  var mailTextController = new TextEditingController();
  var pwdTextController = new TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwdFocusNode = FocusNode();
  String textErrorEmail;
  String textErrorPwd;
  bool _accepted = false;
  bool showPageView = true;
  bool isFocusPwd = false;
  OverlayEntry overlayEntry;
  bool isDisable = true;

  @override
  void initState() {
    super.initState();
    mailTextController.addListener(() {
      verifBtn();
    });
    pwdTextController.addListener(() {
      verifBtn();
    });
  }

  bool verifLogin() {
    if (mailTextController.text.isEmpty) {
      setState(() {
        textErrorEmail = "Veuillez entrer votre email";
      });
      return false;
    }
    setState(() {
      textErrorEmail = null;
    });
    if (!Utils.isValidEmail(mailTextController.text.toString())) {
      setState(() {
        textErrorEmail = "Veuillez entrer un email valide";
      });
      return false;
    }
    setState(() {
      textErrorEmail = null;
    });

    if (pwdTextController.text.isEmpty) {
      setState(() {
        textErrorPwd = "Veuillez entrer votre password";
      });
      return false;
    }
    if (pwdTextController.text.length < 8) {
      setState(() {
        textErrorPwd = "Le mot de passe doit contenir au moins 9 caractères";
      });
      return false;
    }
    setState(() {
      textErrorPwd = null;
    });
    return true;
  }

  void verifBtn() {
    if ((mailTextController.text.trim().isNotEmpty) &&
        (pwdTextController.text.trim().isNotEmpty)) {
      if (isDisable) {
        setState(() {
          isDisable = false;
        });
      }
    } else {
      if (!isDisable) {
        setState(() {
          isDisable = true;
        });
      }
    }
  }

  void gotoForgotPassword() {}

  void gotoSignIn() {}

  void goToHome(String uiId) async {
    final getUser = await LoginApiProvider().getUserInfo(uiId);
    // ignore: unnecessary_null_comparison
    if (getUser != null) {
      var route = MaterialPageRoute(builder: (context) {
        return HomePage();
      });
      overlayEntry.remove();
      Navigator.of(context).pushReplacement(route);
    }
  }

  onClickLogin() async {
    if (!isDisable && verifLogin()) {
      overlayEntry = Utils.showOverlayLoader(context);
      final uiid = await LoginApiProvider().getUiid(
          mailTextController.text.toString(),
          pwdTextController.text.toString());
      switch (uiid) {
        case "-1":
          overlayEntry.remove();
          // ignore: todo
          //TODO show EMAIL et ou MOT DE PASSE manquants
          break;
        case "-2":
          // ignore: todo
          //TODO show USER not found
          overlayEntry.remove();
          setState(() {
            textErrorPwd = "merci de bien vérifier votre email et votre mot de passe";
          });
          break;
        default:
          // ignore: todo
          //TODO go to home
          goToHome(uiid);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80, bottom: Dimens.space_40px),
                child: Container(),
                // Image.asset("Assets/logo_tutos_2.png",),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimens.space_20px),
              child: Text(
                "Connexion",
                style: TextStyle(
                    color: AppTheme.appColor,
                    fontSize: Dimens.text_size_mediumx,
                    fontFamily: AppTheme.fontCircularStdBold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimens.space_20px, bottom: Dimens.space_20px),
              child: Text(
                "Veuillez entrez vos informations",
                style: TextStyle(
                    color: Color(0xFF333A4F),
                    fontSize: Dimens.text_size_mediumx,
                    fontFamily: AppTheme.fontCircularStdMedium),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: Dimens.space_20px,
                    right: Dimens.space_20px,
                    top: Dimens.space_8px,
                    bottom: Dimens.space_8px),
                child: TextField(
                  autofillHints: [AutofillHints.email],
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocusNode,
                  onSubmitted: (t) {
                    emailFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(pwdFocusNode);
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: mailTextController,
                  style: TextStyle(
                      fontFamily: AppTheme.fontCircularStdBook,
                      fontSize: Dimens.text_size_medium),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Adresse email",
                    labelStyle: TextStyle(color: AppTheme.edittext_black),
                    contentPadding: EdgeInsets.all(Dimens.space_8px),
                    errorText: textErrorEmail,
                    errorMaxLines: 2,
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.red_error)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.red_error)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.appColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.edittext_border)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.edittext_border)),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: Dimens.space_20px,
                    right: Dimens.space_20px,
                    top: Dimens.space_8px,
                    bottom: Dimens.space_8px),
                child: TextField(
                  autofillHints: [AutofillHints.password],
                  onSubmitted: (t) {
                    onClickLogin();
                  },
                  focusNode: pwdFocusNode,
                  obscureText: _accepted ? false : true,
                  controller: pwdTextController,
                  style: TextStyle(
                      fontFamily: AppTheme.fontCircularStdBook,
                      fontSize: Dimens.text_size_medium),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _accepted ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFFCDCDCD),
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _accepted = !_accepted;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Mot de passe",
                    labelStyle: TextStyle(color: AppTheme.edittext_black),
                    contentPadding: EdgeInsets.all(Dimens.space_8px),
                    errorText: textErrorPwd,
                    errorMaxLines: 2,
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.red_error)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.red_error)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.appColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.edittext_border)),
                    disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.edittext_border)),
                  ),
                )),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: Dimens.space_40px,
                    bottom: Dimens.space_30px,
                    right: Dimens.space_20px,
                    left: Dimens.space_20px),
                child: TextButton(
                  onPressed: () {
                    // ignore: todo
                    //TODO go to forgot pwd
                    gotoForgotPassword();
                  },
                  child: Text(
                    "Mot de passe oublié?",
                    style: TextStyle(
                        color: Color(0xFF455A64),
                        fontSize: Dimens.text_size_small,
                        fontFamily: AppTheme.fontCircularStdBook),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: Dimens.space_20px, left: Dimens.space_20px),
              child: Container(
                height: Dimens.size_bubble,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  elevation: 0,
                  onPressed: onClickLogin,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.space_6px)),
                  padding: EdgeInsets.all(0),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: (isDisable)
                            ? AppTheme.disable_btn
                            : AppTheme.appColor,
                        borderRadius: BorderRadius.circular(Dimens.space_6px)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Je me connecte",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Dimens.text_size_xmedium,
                            color: Colors.white,
                            fontFamily: AppTheme.fontCircularStdBold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimens.space_12px,
                  bottom: Dimens.space_20px,
                  right: Dimens.space_20px,
                  left: Dimens.space_20px),
              child: Container(
                height: Dimens.size_bubble,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () {
                    // ignore: todo
                    //TODO go to creat compte
                    gotoSignIn();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.space_6px),
                      side: BorderSide(color: AppTheme.appColor)),
                  padding: EdgeInsets.all(0),
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.space_6px)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Je crée un compte",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Dimens.text_size_xmedium,
                            color: AppTheme.appColor,
                            fontFamily: AppTheme.fontCircularStdBold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
