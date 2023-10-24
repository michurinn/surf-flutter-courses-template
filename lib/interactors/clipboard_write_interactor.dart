import 'package:super_clipboard/super_clipboard.dart';
import 'package:surf_flutter_courses_template/extensions/extensions.dart';

class ClipboardWriteInteractor {
  final ClipboardWriter clipboardWriter;

  ClipboardWriteInteractor({required this.clipboardWriter});

  Future<(bool, String)> write(String text) async {
    try {
      await clipboardWriter.write([
        DataWriterItem()
          ..add(
            Formats.plainText(text),
          )
      ]);
      return (true, text);
    } on Exception catch (_) {
      return (false, 'Something went wrong'.hardcoded);
    }
  }
}
