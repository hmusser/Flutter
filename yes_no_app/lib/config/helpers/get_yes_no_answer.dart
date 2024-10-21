import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

//Para realizar las operaciones http se agregó el package "dio".
class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    //response contiene data en forma de un MAP, pero yo tengo que devolver un "Message".
    final response = await _dio.get('https://yesno.wtf/api');
    //Para no utilizar directamente los valores que vienen en la response, creamos un mapper propio en YesNoModel para evitar errores de tipeo.
    //En el model se mapeará (en un solo lugar) los valores y estarán disponibles en toda la App.
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
