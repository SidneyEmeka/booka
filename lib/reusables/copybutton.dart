import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../stylings.dart';
class CopyButton extends StatefulWidget {
  final String textToCopy;
  final Duration resetDelay;

  const CopyButton({
    Key? key,
    required this.textToCopy,
    this.resetDelay = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool _isCopied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.textToCopy));
    setState(() {
      _isCopied = true;
    });

    // Reset the button text after a delay
    Future.delayed(widget.resetDelay, () {
      if (mounted) {
        setState(() {
          _isCopied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copyToClipboard,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        decoration: BoxDecoration(
          color: _isCopied ? Colors.green :Color(0xFFFFD700),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_isCopied ? Icons.check : FluentIcons.link_28_regular,color: Colors.black, size: 15),
            const SizedBox(width: 2),
            Text(_isCopied ? 'Copied!' : 'Refer',style: Stylings.buttonTexts.copyWith(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}