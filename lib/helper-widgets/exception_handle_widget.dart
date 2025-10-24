import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:present_unit_flutter/helpers/assets_path/assets_path.dart';
import 'package:present_unit_flutter/helpers/extension/double_widget.dart';
import 'package:present_unit_flutter/helpers/extension/string_widget.dart';
import 'package:present_unit_flutter/main.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePaths.noData, height: 150, width: 150),
          "No Data".textWidget(fontSize: 16, fontWeight: FontWeight.bold, color: getColorScheme(context).onSurface),
        ],
      ),
    );
  }
}

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsPaths.icNoInternet,
            height: 80,
            width: 80,
            colorFilter: ColorFilter.mode(getColorScheme(context).onSurface, BlendMode.srcIn),
          ),
          4.height,
          "No Internet".textWidget(fontSize: 16, fontWeight: FontWeight.bold, color: getColorScheme(context).onSurface),
        ],
      ),
    );
  }
}
