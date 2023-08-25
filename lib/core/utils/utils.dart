import 'package:easy_localization/easy_localization.dart';

class Utils{
  static String getDateTimeFormat(String dateString) {
    final dateDateTime= DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString);
    var outputFormat = DateFormat('MMMM dd, yyyy');
    return outputFormat.format(dateDateTime);
  }
}