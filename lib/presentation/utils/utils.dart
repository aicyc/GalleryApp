import 'package:flutter/material.dart';

class Utils {
  final BuildContext _context;
  Utils.of(BuildContext context) : _context = context;

  MediaQueryData get _mediaQueryOf => MediaQuery.of(_context);

  Size get sizeDevice => _mediaQueryOf.size;
  EdgeInsets get paddingDevice => _mediaQueryOf.padding;
}
