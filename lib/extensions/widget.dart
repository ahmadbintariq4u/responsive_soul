part of '../flutter_soul.dart';

extension LayoutExtension on Widget {
  // int
  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding paddingTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Padding paddingBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Padding paddingLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Padding paddingRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Padding paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Padding paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Container marginAll(double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  Container marginTop(double value) {
    return Container(
      margin: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Container marginBottom(double value) {
    return Container(
      margin: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Container marginLeft(double value) {
    return Container(
      margin: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Container marginRight(double value) {
    return Container(
      margin: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Container marginHorizontal(double value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Container marginVertical(double value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  ClipRRect roundAll(value) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(value)),
      child: this,
    );
  }

  List<Widget> repeat(int length) {
    return List.generate(length, (index) => this);
  }
}
