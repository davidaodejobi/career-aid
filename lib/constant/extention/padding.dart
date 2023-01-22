import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppPadding on Widget {
  Widget padsymmetric(double horizontal, double vertical) {
    return RPadding(
      padding: REdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(horizontal),
        vertical: ScreenUtil().setHeight(vertical),
      ),
      child: this,
    );
  }

  Widget padall(double value) {
    return RPadding(
      padding: REdgeInsets.all(
        ScreenUtil().setWidth(value),
      ),
      child: this,
    );
  }

  Widget padonly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return RPadding(
      padding: REdgeInsets.only(
        left: ScreenUtil().setWidth(left),
        top: ScreenUtil().setHeight(top),
        right: ScreenUtil().setWidth(right),
        bottom: ScreenUtil().setHeight(bottom),
      ),
      child: this,
    );
  }

  Widget padleft(double value) {
    return RPadding(
      padding: REdgeInsets.only(
        left: ScreenUtil().setWidth(value),
      ),
      child: this,
    );
  }

  Widget padright(double value) {
    return RPadding(
      padding: REdgeInsets.only(
        right: ScreenUtil().setWidth(value),
      ),
      child: this,
    );
  }

  Widget padtop(double value) {
    return RPadding(
      padding: REdgeInsets.only(
        top: ScreenUtil().setHeight(value),
      ),
      child: this,
    );
  }

  Widget padbottom(double value) {
    return RPadding(
      padding: REdgeInsets.only(
        bottom: ScreenUtil().setHeight(value),
      ),
      child: this,
    );
  }
}
