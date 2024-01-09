/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple_ic.svg
  String get appleIc => 'assets/icons/apple_ic.svg';

  /// File path: assets/icons/book_ic_svg.svg
  String get bookIcSvg => 'assets/icons/book_ic_svg.svg';

  /// File path: assets/icons/checked_ic_svg.svg
  String get checkedIcSvg => 'assets/icons/checked_ic_svg.svg';

  /// File path: assets/icons/done_icon.png
  AssetGenImage get doneIcon =>
      const AssetGenImage('assets/icons/done_icon.png');

  /// File path: assets/icons/fb_ic.svg
  String get fbIc => 'assets/icons/fb_ic.svg';

  /// File path: assets/icons/gender_ic_svg.svg
  String get genderIcSvg => 'assets/icons/gender_ic_svg.svg';

  /// File path: assets/icons/gg_ic.svg
  String get ggIc => 'assets/icons/gg_ic.svg';

  /// File path: assets/icons/heart_svg.svg
  String get heartSvg => 'assets/icons/heart_svg.svg';

  /// File path: assets/icons/ic_next.svg
  String get icNext => 'assets/icons/ic_next.svg';

  /// File path: assets/icons/ion_language_svg.svg
  String get ionLanguageSvg => 'assets/icons/ion_language_svg.svg';

  /// File path: assets/icons/logApp.png
  AssetGenImage get logApp => const AssetGenImage('assets/icons/logApp.png');

  /// File path: assets/icons/logoSvg.svg
  String get logoSvg => 'assets/icons/logoSvg.svg';

  /// File path: assets/icons/next_icon.png
  AssetGenImage get nextIcon =>
      const AssetGenImage('assets/icons/next_icon.png');

  /// File path: assets/icons/uncheckd_ic_svg.svg
  String get uncheckdIcSvg => 'assets/icons/uncheckd_ic_svg.svg';

  /// List of all assets
  List<dynamic> get values => [
        appleIc,
        bookIcSvg,
        checkedIcSvg,
        doneIcon,
        fbIc,
        genderIcSvg,
        ggIc,
        heartSvg,
        icNext,
        ionLanguageSvg,
        logApp,
        logoSvg,
        nextIcon,
        uncheckdIcSvg
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_login.png
  AssetGenImage get backgroundLogin =>
      const AssetGenImage('assets/images/background_login.png');

  /// File path: assets/images/login_sigup.png
  AssetGenImage get loginSigup =>
      const AssetGenImage('assets/images/login_sigup.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [backgroundLogin, loginSigup, onboarding1, onboarding2, onboarding3];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
