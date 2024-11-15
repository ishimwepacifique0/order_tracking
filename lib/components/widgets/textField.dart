import 'package:flutter/material.dart';
import 'package:order/theme/colors.dart';

class EntryField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool showSuffixIcon;
  final int? maxLines;

  EntryField(this.labelText, this.hintText, this.showSuffixIcon,
      {this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText!,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black, fontSize: 13.5),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: maxLines,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey),
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: showSuffixIcon
                ? Icon(Icons.arrow_drop_down_outlined, color: Colors.grey)
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 13.5, color: Color(0xffb3b3b3)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class EntryFieldR extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool showSuffixIcon;

  EntryFieldR(this.labelText, this.hintText, this.showSuffixIcon);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText!,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey, fontSize: 13.5),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey, fontSize: 13.5),
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: showSuffixIcon
                ? Icon(
                    Icons.verified_user,
                    color: primaryColor,
                    size: 17,
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!)),
            hintText: hintText,
            hintStyle:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13.5),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
