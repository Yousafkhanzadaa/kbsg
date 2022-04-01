import 'package:flutter/material.dart';

class EmailPasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const EmailPasswordField({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _EmailPasswordFieldState createState() => _EmailPasswordFieldState();
}

class _EmailPasswordFieldState extends State<EmailPasswordField> {
  // TextEditingController? _editingController;

  @override
  void initState() {
    super.initState();
    // _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        minLines: 1,
        onChanged: widget.onChanged,
        validator: widget.validator,
        // autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: widget.hint,
          label: Text(
            widget.label,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          border: _borderDec(),
          disabledBorder: _borderDec(),
          enabledBorder: _borderDec(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderDec() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF4B5563), width: 1),
    );
  }
}
