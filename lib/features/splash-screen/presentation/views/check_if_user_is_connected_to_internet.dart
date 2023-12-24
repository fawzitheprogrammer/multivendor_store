import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/loading_widget.dart';
import 'package:multivendor_store/features/splash-screen/presentation/views/splash_screen_view.dart';
import 'package:multivendor_store/manager/connection-bloc/connection_bloc.dart';

class CheckIfUserHasNetwork extends StatelessWidget {
  const CheckIfUserHasNetwork({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, ConnectionDeviceState>(
      builder: (context, state) {
        if (state is ConnectionSuccess) {
          return child;
        } else if (state is ConnectionLoading) {
          return state.isCheckComplete ? const NoNetWork() : const Loading();
        } else {
          return const Loading();
        }
      },
    );
  }
}
