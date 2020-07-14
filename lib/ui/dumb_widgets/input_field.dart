import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool autofocus;
  final String hint;
  final String label;
  final bool isPassword;
  final Function validator;

  InputField(
      {this.controller,
      this.inputType,
      this.autofocus,
      this.hint,
      this.label,
      this.isPassword,
      this.validator});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _showPassword;
  @override
  void initState() {
    _showPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) => widget.validator(val),
      keyboardType: widget.inputType,
      autofocus: widget.autofocus ?? false,
      obscureText:
          (widget.isPassword == true) ? _showPassword ? false : true : false,
      decoration: InputDecoration(
        labelText: widget.label ?? "",
        hintText: widget.hint ?? "",
        fillColor: Colors.white,
        suffixIcon: (widget.isPassword == true)
            ? (_showPassword
                ? IconButton(
                    icon: Icon(FontAwesomeIcons.eyeSlash),
                    onPressed: () {
                      togglePassword();
                    })
                : IconButton(
                    icon: Icon(FontAwesomeIcons.eye),
                    onPressed: () {
                      togglePassword();
                    }))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
