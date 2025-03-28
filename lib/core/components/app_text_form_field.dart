import 'package:flutter/cupertino.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool enabled;
  final Widget? suffix;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool showCursor;
  final bool readOnly;
  final int? maxLength;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    required this.textEditingController,
    this.enabled = true,
    this.suffix,
    this.placeholder,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.obscureText = false,
    this.onSubmitted,
    this.onTap,
    this.showCursor = true,
    this.readOnly = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscureText = false;
  @override
  void initState() {
    isObscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        controller: widget.textEditingController,
        onSubmitted: (value) {
          widget.onSubmitted != null ? widget.onSubmitted!(value) : null;
        },
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        obscureText: isObscureText,
        suffix: suffixWidget(),
        placeholder: widget.placeholder,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        padding: const EdgeInsets.all(10),
        style: const TextStyle(
          fontSize: 18,
        ),
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        showCursor: widget.showCursor,
        prefix: widget.prefixIcon != null
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Icon(
                  widget.prefixIcon,
                ),
              )
            : null,
        decoration: BoxDecoration(
          // color: CupertinoDynamicColor.withBrightness(
          //   color: ColorConstants.lightTextField,
          //   darkColor: ColorConstants.darkTextField,
          // ),
          border: Border.all(
            // color: CupertinoDynamicColor.withBrightness(
            //   color: ColorConstants.lightBackgroundColorActivated,
            //   darkColor: ColorConstants.darkBackgroundColorActivated,
            // ),
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        // cursorColor: ColorConstants.lightPrimaryIcon,
        onTap: widget.onTap,
      ),
    );
  }

  Widget suffixWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.suffix ?? const SizedBox(),
        widget.obscureText
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  isObscureText
                      ? CupertinoIcons.eye_solid
                      : CupertinoIcons.eye_slash_fill,
                ),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              )
            : const SizedBox(),
      ],
    );
  }
}

class AppFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool enabled;
  final Widget? suffix;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final bool? showCursor;
  final int? maxLength;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool? readOnly;

  const AppFormField({
    super.key,
    required this.textEditingController,
    required this.enabled,
    this.suffix,
    this.placeholder,
    this.keyboardType,
    this.textInputAction,
    this.showCursor,
    this.maxLength,
    this.onTap,
    this.onEditingComplete,
    this.onChanged,
    this.prefix,
    this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      children: [
        CupertinoTextFormFieldRow(
          controller: textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return "$placeholder can't be empty";
            }
            return null;
          },
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          placeholder: placeholder,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          maxLength: maxLength,
          readOnly: readOnly!,
          style: const TextStyle(
            fontSize: 18,
            color: CupertinoDynamicColor.withBrightness(
              color: CupertinoColors.black,
              darkColor: CupertinoColors.white,
            ),
          ),
          enabled: enabled,
          showCursor: showCursor,
          prefix: prefix,
          // cursorColor: ColorConstants.lightPrimary,
          onTap: onTap,
        ),
      ],
    );
  }
}
