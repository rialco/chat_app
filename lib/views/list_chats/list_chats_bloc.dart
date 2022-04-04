import 'package:flutter/cupertino.dart';

import '../../widgets/new_chat_user.dart';

class ListChatsBloc extends ChangeNotifier {
  List<NewChatsUser> _ListOfNewChatUser = [
    NewChatsUser(
        image: 'lib/assets/tromp.png',
        name: 'Donald Trump',
        password: 'Az32lop8'),
    NewChatsUser(
        image: 'lib/assets/kim.png', name: 'Kim Jong-un', password: 'E1234'),
    NewChatsUser(
        image: 'lib/assets/den.png',
        name: 'Denzel Washington',
        password: 'dL54nv'),
    NewChatsUser(
        image: 'lib/assets/petro.png',
        name: 'Gustavo Petro',
        password: '123456')
  ];
  List<NewChatsUser> _ListOfContacts = [
    NewChatsUser(
        image: 'lib/assets/isaac.png', name: 'Isaac Newton', password: '1234'),
    NewChatsUser(
        image: 'lib/assets/jesus.png', name: 'Jesucristo', password: '1234'),
    NewChatsUser(
        image: 'lib/assets/alejandro.png',
        name: 'Alejandro Magno',
        password: '1234'),
    NewChatsUser(
        image: 'lib/assets/ford.png', name: 'Henry Ford', password: 'Az32lop8'),
  ];

  getListOfNewChatUser() {
    return _ListOfNewChatUser;
  }

  setListOfNewChatUser(NewChatsUser user) {
    _ListOfNewChatUser.remove(user);
    notifyListeners();
  }

  getListOfNewContacts() {
    return _ListOfContacts;
  }

  setListOfNewContacts(NewChatsUser user) {
    _ListOfContacts.remove(user);
    _ListOfNewChatUser.add(user);
    notifyListeners();
  }
}
