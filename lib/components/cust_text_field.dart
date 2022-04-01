import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController? _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _editingController,
        minLines: 1,
        onChanged: widget.onChanged,
        validator: widget.validator,
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

  @override
  void dispose() {
    super.dispose();
    _editingController!.dispose();
  }
}
