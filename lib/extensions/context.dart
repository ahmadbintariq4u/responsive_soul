part of '../flutter_soul.dart';

/// [returns] the responsive status [bool] based on context.
extension ContextExtension on BuildContext {
  bool isXSM() => ResponsiveSoul.isXSM(this);
  bool isSM() => ResponsiveSoul.isSM(this);
  bool isMD() => ResponsiveSoul.isMD(this);
  bool isLG() => ResponsiveSoul.isLG(this);
  bool isXL() => ResponsiveSoul.isXL(this);
  bool isXXL() => ResponsiveSoul.isXXL(this);
}


// For Padding
