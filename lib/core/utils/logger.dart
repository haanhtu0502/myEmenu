import 'package:talker_logger/talker_logger.dart';

enum PrintType { debug, info, error, good, warning, verbose, log }

void logPrint(Object object, {PrintType printType = PrintType.info}) {
  final logger = TalkerLogger();

  assert(() {
    switch (printType) {
      case PrintType.debug:
        logger.debug(object);
        break;
      case PrintType.info:
        logger.info(object);
        break;
      case PrintType.error:
        logger.error(object);
        break;
      case PrintType.good:
        logger.debug(object);
        break;
      case PrintType.warning:
        logger.warning(object);
        break;
      case PrintType.verbose:
        logger.log(object, pen: AnsiPen()..xterm(50));
        break;
      case PrintType.log:
        logger.log(object, pen: AnsiPen()..xterm(49));
        break;
    }
    return true;
  }());
}
