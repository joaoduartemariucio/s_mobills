import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

enum InputRowType { text, selectable, checkbox }

class InputRow extends StatelessWidget {
  const InputRow({
    required this.icon,
    required this.hintText,
    required this.type,
    super.key,
    this.controller,
    this.textInputType,
    this.switchOn,
    this.onChanged,
    this.options,
  });

  factory InputRow.text({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    TextInputType? textInputType,
  }) {
    return InputRow(
      controller: controller,
      icon: icon,
      hintText: hintText,
      textInputType: textInputType,
      type: InputRowType.text,
    );
  }

  factory InputRow.checkbox({
    required IconData icon,
    required String hintText,
    bool? switchOn,
    ValueChanged<bool>? onChanged,
  }) {
    return InputRow(
      icon: icon,
      hintText: hintText,
      type: InputRowType.checkbox,
      switchOn: switchOn,
      onChanged: onChanged,
    );
  }

  factory InputRow.selectable({
    required IconData icon,
    required String hintText,
    List<Widget>? options,
  }) {
    return InputRow(
      icon: icon,
      hintText: hintText,
      type: InputRowType.selectable,
      options: options,
    );
  }

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final IconData icon;
  final String hintText;
  final InputRowType type;
  final bool? switchOn;
  final ValueChanged<bool>? onChanged;
  final List<Widget>? options;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (type == InputRowType.text)
          _TextRow(
            icon: icon,
            controller: controller ?? TextEditingController(),
            hintText: hintText,
            textInputType: textInputType,
          ),
        if (type == InputRowType.checkbox)
          _CheckboxRow(
            icon: icon,
            hintText: hintText,
            switchOn: switchOn,
            onChanged: onChanged,
          ),
        if (type == InputRowType.selectable)
          _SelectableRow(
            icon: icon,
            hintText: hintText,
            options: options,
          ),
        const SMobillsDivider(isVertical: false),
      ],
    );
  }
}

class _SelectableRow extends StatelessWidget {
  const _SelectableRow({
    super.key,
    required this.icon,
    required this.hintText,
    required this.options,
  });

  final IconData icon;
  final String hintText;
  final List<Widget>? options;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: context.colorScheme.onBackground.withOpacity(0.80),
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          hintText,
          style: SMobillsTextStyles.body1,
        ),
        const Spacer(),
        if (options != null)
          Row(
            children: options!,
          ),
      ],
    );
  }
}

class _CheckboxRow extends StatelessWidget {
  const _CheckboxRow({
    required this.icon,
    required this.hintText,
    required this.switchOn,
    required this.onChanged,
  });

  final IconData icon;
  final String hintText;
  final bool? switchOn;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: context.colorScheme.onBackground.withOpacity(0.80),
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          hintText,
          style: SMobillsTextStyles.body1,
        ),
        const Spacer(),
        Switch(value: switchOn ?? false, onChanged: onChanged),
      ],
    );
  }
}

class _TextRow extends StatelessWidget {
  const _TextRow({
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.textInputType,
  });

  final IconData icon;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: context.colorScheme.onBackground.withOpacity(0.80),
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: TextField(
            controller: controller,
            style: TextStyle(color: context.colorScheme.onBackground),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: context.colorScheme.onBackground.withOpacity(0.50),
              ),
            ),
            keyboardType: textInputType,
          ),
        ),
      ],
    );
  }
}
