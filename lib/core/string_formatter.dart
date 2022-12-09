import 'package:intl/intl.dart';

final thousandFormatter = NumberFormat.decimalPattern('id');

extension ThuosandsFormatter on num {
  String get withThousandsSeparator =>
      NumberFormat.decimalPattern('id').format(this);
}
