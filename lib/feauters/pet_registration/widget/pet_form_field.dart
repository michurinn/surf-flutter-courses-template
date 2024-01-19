import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// Элемент текстового поля ввода
class PetFormField extends StatefulWidget {
  const PetFormField({
    super.key,
    required this.label,
    this.validator,
    this.withDatePicker = false,
    this.keyboardType = TextInputType.name,
    this.formatters,
  });
  final String label;
  final String? Function(String? string)? validator;
  final List<TextInputFormatter>? formatters;
  final bool withDatePicker;
  final TextInputType keyboardType;

  @override
  State<PetFormField> createState() => _PetFormFieldState();
}

class _PetFormFieldState extends State<PetFormField> {
  late TextEditingController? controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            isCollapsed: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            labelText: widget.label,
            labelStyle: const TextStyle(
              color: Color.fromRGBO(175, 178, 188, 1),
            ),
          ),
          controller: controller,
          keyboardType: widget.keyboardType,
          onTap: widget.withDatePicker
              ? () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 20)),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    final DateFormat formatter = DateFormat('dd.MM.yyyy');
                    controller?.text = formatter.format(date).toString();
                  }
                }
              : () {},
          readOnly: widget.withDatePicker ? true : false,
          validator: widget.validator,
          inputFormatters: widget.formatters,
          cursorColor: const Color.fromRGBO(65, 70, 87, 1),
        ),
      ),
    );
  }
}
