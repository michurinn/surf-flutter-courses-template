import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/domain/color.dart';
import 'package:surf_flutter_courses_template/extensions/extensions.dart';
import 'package:surf_flutter_courses_template/interactors/clipboard_write_interactor.dart';

class PalleteDetailsScreen extends StatelessWidget {
  const PalleteDetailsScreen(
      {super.key,
      required this.colorElement,
      required this.clipboardWriteInteractor});
  final ColorClass colorElement;
  final double kHorizontalPadding = 20;
  final double kVerticalPadding = 30;
  final ClipboardWriteInteractor clipboardWriteInteractor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Hero(
              tag: colorElement.name,
              child: Container(
                color: colorElement.hexColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: kHorizontalPadding, top: kVerticalPadding),
            child: Text(
              colorElement.name,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: _FieldWithShadow(
                text: ['Hex', colorElement.clearValue],
                writer: clipboardWriteInteractor,
                onTap: onTap(colorElement.clearValue),
                showCopyPostfix: true),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: kHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _FieldWithShadow(
                    text: ['Red'.hardcoded, colorElement.redPart],
                    writer: clipboardWriteInteractor,
                    onTap: onTap(colorElement.redPart)),
                _FieldWithShadow(
                    text: ['Green'.hardcoded, colorElement.greenPart],
                    writer: clipboardWriteInteractor,
                    onTap: onTap(colorElement.redPart)),
                _FieldWithShadow(
                    text: ['Blue'.hardcoded, colorElement.bluePart],
                    writer: clipboardWriteInteractor,
                    onTap: onTap(colorElement.redPart)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<(bool, String)> onTap(String text) async {
    final result = await clipboardWriteInteractor.write(text);
    return result;
  }
}

class _FieldWithShadow extends StatefulWidget {
  const _FieldWithShadow(
      {super.key,
      required this.text,
      required this.writer,
      this.showCopyPostfix = false,
      required this.onTap});
  final List<String> text;
  final ClipboardWriteInteractor writer;
  final bool showCopyPostfix;
  final Future<(bool, String)> onTap;
  @override
  State<_FieldWithShadow> createState() => _FieldWithShadowState();
}

class _FieldWithShadowState extends State<_FieldWithShadow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final resultString =
            widget.text.reduce((value, element) => value += ' $element');
        final result = await widget.onTap;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: result.$1 ? Text(resultString) : Text(result.$2),
          ),
        ));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.text
                .map<Widget>(
                  (element) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: (widget.showCopyPostfix &&
                            widget.text.indexOf(element) == 1)
                        ? Row(
                            children: [
                              Text(element),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.copy_sharp,
                                color: Colors.black54,
                              )
                            ],
                          )
                        : Text(element),
                  ),
                )
                .toList()),
      ),
    );
  }
}
