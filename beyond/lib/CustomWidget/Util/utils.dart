import 'dart:convert';
import 'dart:io';

import 'package:beyond/Authentication/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

import '../../LocalData/UserState.dart';
import '../../User/UserModel.dart';

class Utils {
  static OverlayEntry showOverlayLoader(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);

    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Container(
        decoration: BoxDecoration(color: Color(0x90FFFFFF)),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
    overlayState.insert(overlayEntry);

    return overlayEntry;
  }

  static void showAlert(
      BuildContext context, String message, String buttonTitle) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          builder: (context) {
            return new CupertinoAlertDialog(
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(buttonTitle),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(message),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(buttonTitle))
              ],
            );
          });
    }
  }

  static void showAlertWithActionCancel(
      BuildContext context, String message, VoidCallback action) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          builder: (context) {
            return new CupertinoAlertDialog(
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Annuler'),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text('Confirmer'),
                  isDefaultAction: true,
                  onPressed: action,
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(message),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Annuler')),
                // ignore: deprecated_member_use
                FlatButton(onPressed: action, child: Text('Confirmer'))
              ],
            );
          });
    }
  }

  static void showAlertWithAction(
      BuildContext context, String message, VoidCallback action) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          builder: (context) {
            return new CupertinoAlertDialog(
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('OK'),
                  isDefaultAction: true,
                  onPressed: action,
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(message),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(onPressed: action, child: Text('OK'))
              ],
            );
          });
    }
  }

  static void showBottomSheet(
      BuildContext context,
      String cameraTitle,
      String libraryTitle,
      String cancelTitle,
      VoidCallback cameraAction,
      VoidCallback libraryAction) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              title: Text('Prendre une photo'),
              message: Text('Choisissez'),
              actions: <Widget>[
                CupertinoActionSheetAction(
                    onPressed: cameraAction, child: Text(cameraTitle)),
                CupertinoActionSheetAction(
                  onPressed: libraryAction,
                  child: Text(libraryTitle),
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(cancelTitle);
                  },
                  child: Text(cancelTitle)),
            );
          });
    } else {
      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text(cameraTitle),
                    onTap: cameraAction),
                new ListTile(
                  leading: new Icon(Icons.photo_album),
                  title: new Text(libraryTitle),
                  onTap: libraryAction,
                ),
                new ListTile(
                  leading: new Icon(Icons.cancel),
                  title: new Text(cancelTitle),
                  onTap: () {
                    Navigator.of(context).pop(cancelTitle);
                  },
                ),
              ],
            );
          });
    }
  }

  static void updateValidationState(bool validation) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('validation', validation);
  }

  static Future<bool> getNotificationState() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('hasNotification') == null) return false;
    return prefs.getBool('hasNotification');
  }

  static void setNotificationState(bool hasNotification) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('hasNotification', hasNotification);
  }

  static bool isValidEmail(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);

    return regex.hasMatch(mail);
  }

  static void updateConnectedUser(User user) async {
    if (user.token == null) user.token = ConnectedUser().connectedUser.token;
    ConnectedUser.setConnectedUser(user);

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString('user', jsonEncode(user));
  }

  static Future<void> logoutUserFromSharedpreferences(
      BuildContext context) async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('user');
    sharedPreferences.remove('userId');
    var route = MaterialPageRoute(builder: (context) => SignIn());
    //Navigator.of(context).pushReplacement(route);
    Navigator.of(context)
        .pushAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  /// typeMessage : 0 = success : 1 = Info : 2 = Error
  static void showSnackBar(
      GlobalKey<ScaffoldState> _scaffoldKey, String message, int typeMessage) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(
          content: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      typeMessage == 0
                          ? Icon(Icons.check, color: Colors.green)
                          : (typeMessage == 1
                              ? Icon(Icons.info_outline,
                                  color: Colors.yellow[800])
                              : Icon(Icons.close, color: Colors.red)),
                      SizedBox(width: 20),
                      new Flexible(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            new Text(message, style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    _scaffoldKey.currentState.hideCurrentSnackBar();
                  },
                )
              ],
            ),
          ),
        ))
        .close;
  }

}
