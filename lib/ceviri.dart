import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'button_text': 'you have clicked',
        },
        'tr_TR': {'hello': 'merhaba', 'button_text': 'butona basılma miktarı'}
      };
}
