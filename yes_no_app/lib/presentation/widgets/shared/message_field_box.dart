import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});
  @override
  Widget build(BuildContext context) {
    //Esto es un widget que nos permite controlar todo lo que sucede en el control en cual lo asociamos
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.send_outlined,
          ),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ));

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode
            .requestFocus(); //deja aqui el foco de la aplicación para que no se vaya y quede en la caja de texto
        onValue(value);
      },
      //Al hacer tap fuera del TextFormField.
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
