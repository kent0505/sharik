import 'dart:developer' as developer;

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

void logger(Object message) => developer.log(message.toString());
