import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../catterScreen/chatterScreen_view.dart';
import 'list_chats_bloc.dart';

class ListChats extends StatefulWidget {
  @override
  State<ListChats> createState() => _ListChatsState();
}

class _ListChatsState extends State<ListChats> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListChatsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: Colors.deepPurple),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(25, 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            constraints: const BoxConstraints.expand(height: 1),
          ),
        ),
        backgroundColor: Colors.white10,
        title: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Chats activos',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.deepPurple),
                ),
                Text('Chat seguro de extremo a extremo',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 8,
                        color: Colors.deepPurple))
              ],
            ),
          ],
        ),
        actions: <Widget>[
          GestureDetector(
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView(
            shrinkWrap: true,
            children: provider.getListOfNewChatUser().map<Widget>((e) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatterScreen(
                                    user: e,
                                    mess: [],
                                  )),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                        ),
                        height: 100,
                        width: 300,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  // color: Colors.blue,
                                ),
                                child: Image.asset('${e.image}'),
                                height: 60,
                                width: 60,
                              ),
                              Text(
                                e.name,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Container()
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.setListOfNewChatUser(e);
                        //  provider.ListOfNewChatUser.remove(e);
                      },
                      child: Container(
                        height: 100,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Tu lista de contactos: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                  child: ListView(
                                shrinkWrap: true,
                                children: provider
                                    .getListOfNewContacts()
                                    .map<Widget>((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.of(context).pop();

                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            barrierColor: Colors.black45,
                                            transitionDuration: const Duration(
                                                milliseconds: 150),
                                            pageBuilder:
                                                (context, anim1, anim2) {
                                              return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16.0))),
                                                title: Text(
                                                    '¿Quieres iniciar un nuevo chat con ${e.name}?'),
                                                content: TextField(
                                                    controller: textController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'Ingresa la clave*',
                                                        hintStyle:
                                                            const TextStyle(
                                                                fontSize: 16),
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                borderSide:
                                                                    const BorderSide(
                                                                  width: 0,
                                                                  style:
                                                                      BorderStyle
                                                                          .none,
                                                                )))),
                                                actions: <Widget>[
                                                  TextButton(
                                                      child: const Text(
                                                        "Aceptar",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurple),
                                                      ),
                                                      // textColor: Colors.blue,
                                                      onPressed: () {
                                                        // Navigator.of(context) .pop();
                                                        setState(() {
                                                          if (textController
                                                                  .text ==
                                                              e.password) {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ChatterScreen(
                                                                            user:
                                                                                e,
                                                                            mess: [],
                                                                          )),
                                                            );

                                                            provider
                                                                .setListOfNewContacts(
                                                                    e);
                                                          } else {
                                                            showGeneralDialog(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    true,
                                                                barrierLabel: MaterialLocalizations.of(
                                                                        context)
                                                                    .modalBarrierDismissLabel,
                                                                barrierColor:
                                                                    Colors
                                                                        .black45,
                                                                transitionDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            150),
                                                                pageBuilder:
                                                                    (context,
                                                                        anim1,
                                                                        anim2) {
                                                                  return AlertDialog(
                                                                    shape: const RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(16.0))),
                                                                    title: Text(
                                                                        'La clave es incorrecta, ingresa nuevamente'),
                                                                    actions: <
                                                                        Widget>[
                                                                      TextButton(
                                                                          child:
                                                                              const Text(
                                                                            "Ok",
                                                                            style:
                                                                                TextStyle(color: Colors.blue),
                                                                          ),

                                                                          //textColor: Colors.red,
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          }),
                                                                    ],
                                                                  );
                                                                },
                                                                transitionBuilder:
                                                                    (context,
                                                                        anim1,
                                                                        anim2,
                                                                        child) {
                                                                  return SlideTransition(
                                                                    position: Tween(
                                                                            begin: const Offset(0,
                                                                                1),
                                                                            end: const Offset(0,
                                                                                0))
                                                                        .animate(
                                                                            anim1),
                                                                    child:
                                                                        child,
                                                                  );
                                                                });
                                                          }
                                                        });
                                                      }),
                                                  TextButton(
                                                      child: const Text(
                                                        "Cancelar",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),

                                                      //textColor: Colors.red,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                ],
                                              );
                                            },
                                            transitionBuilder:
                                                (context, anim1, anim2, child) {
                                              return SlideTransition(
                                                position: Tween(
                                                        begin:
                                                            const Offset(0, 1),
                                                        end: const Offset(0, 0))
                                                    .animate(anim1),
                                                child: child,
                                              );
                                            });
                                      });

                                      // provider.setListOfNewContacts(e);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Image.asset('${e.image}'),
                                            height: 40,
                                            width: 40,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(e.name),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ))
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      child: Icon(Icons.add),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
