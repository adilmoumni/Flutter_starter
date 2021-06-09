// import 'package:notification_project/Collective/CollectiveModel.dart';

import '../User/UserModel.dart';

class ConnectedUser {
  static final ConnectedUser _singleton = new ConnectedUser._internal();

  User connectedUser = new User();

  static void setConnectedUser(User user) {
    //connectedUser = user;
    _singleton.connectedUser = user;
  }

  factory ConnectedUser() {
    return _singleton;
  }

  ConnectedUser._internal();
}

class FilterSession {
  static final FilterSession _singleton = new FilterSession._internal();

  // List<Collective> future;

  List filter = [];

  factory FilterSession() {
    return _singleton;
  }

  FilterSession._internal();
}
