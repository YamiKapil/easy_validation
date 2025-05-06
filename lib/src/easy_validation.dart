import "package:flutter/material.dart";

class EasyValidation<T> extends StatefulWidget {
  final String? Function(T?) validator;
  final Widget child;
  final void Function(T?) onChanged;
  final TextEditingController controller;

  const EasyValidation({
    super.key,
    required this.validator,
    required this.onChanged,
    required this.child,
    required this.controller,
  });

  @override
  EasyValidationState<T> createState() => EasyValidationState<T>();
}

class EasyValidationState<T> extends State<EasyValidation<T>> {
  late FormFieldState<T> _formFieldState;
  @override
  void initState() {
    super.initState();
    // Listen to text changes
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Remove listener
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    // Notify the parent widget of the change
    widget.onChanged(widget.controller.text as T?);
    // Notify the form field of the new value
    // _formFieldState.didChange(widget.controller.text as T?);
    _formFieldState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: widget.controller.text as T?,
      validator: (value) {
        // Validate using the provided validator function
        return widget.validator(widget.controller.text as T);
      },
      builder: (FormFieldState<T> formFieldState) {
        _formFieldState = formFieldState; // Store the FormFieldState
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use the provided child widget
            widget.child,
            // Show error message if validation fails
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  formFieldState.errorText!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
