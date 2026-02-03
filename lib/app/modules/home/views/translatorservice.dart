import 'package:translator/translator.dart';

class TranslatorService {
  final GoogleTranslator _translator = GoogleTranslator();

  Future<String> translateText(String text, String to) async {
    try {
      final translation = await _translator.translate(text, to: to);
      return translation.text;
    } catch (e) {
      print('Translation error: $e');
      return text;
    }
  }
}
