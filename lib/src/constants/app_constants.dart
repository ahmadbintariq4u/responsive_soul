// ignore_for_file: public_member_api_docs, sort_constructors_first
/// [Category: theme]
/// A class that will manage your app constants throughout the application.

class AppConstants {
  double padding;
  double margin;
  double radius;
  AppConstants({
    this.padding = 16.0,
    this.margin = 16.0,
    this.radius = 16.0,
  });

  set setPadding(double value) => padding = value;
  set setMargin(double value) => margin = value;
  set setRadius(double value) => radius = value;

  @override
  String toString() =>
      'AppConstants(padding: $padding, margin: $margin, radius: $radius)';
}
