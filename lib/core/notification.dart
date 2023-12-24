import 'package:elegant_notification/elegant_notification.dart';
import 'package:multivendor_store/core/exports/exports.dart';

void notification(String result, String resultBody, BuildContext context) {
  TextStyle notificationTextStyle = context.medium!.copyWith(
      fontSize: PaddingOrFont.size12, color: context.colorScheme!.onBackground);

  if (result == 'Success') {
    return ElegantNotification.success(
      background: context.colorScheme!.background,
      description: Text(
        resultBody,
        style: notificationTextStyle,
      ),
      width: double.infinity,
    ).show(context);
  } else if (result == 'Failure') {
    return ElegantNotification.error(
      background: context.colorScheme!.background,
      description: Text(
        resultBody,
        style: notificationTextStyle,
      ),
      width: double.infinity,
    ).show(context);
  } else {
    return ElegantNotification.info(
      background: context.colorScheme!.background,
      description: Text(
        resultBody,
        style: notificationTextStyle,
      ),
      width: double.infinity,
    ).show(context);
  }
}
