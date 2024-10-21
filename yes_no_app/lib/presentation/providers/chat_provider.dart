import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = new ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners(); //Algo del provider cambio asi que notifica a todos los que estén escuchando.
    moveScrollToBotton();
    if (text.endsWith('?')) {
      herReply();
    }
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBotton();
  }

//El Future, async y await se agregaron para ralentizar un poco la animación del scrolleo.
//es solo para dar la sensación de que el mensajito se procesa y se envía.
  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
