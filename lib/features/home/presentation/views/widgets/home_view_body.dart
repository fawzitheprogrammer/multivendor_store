import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/features/home/presentation/views/widgets/balance_card.dart';
import 'package:multivendor_store/features/home/presentation/views/widgets/chat_and_welcome_text.dart';
import 'package:multivendor_store/features/home/presentation/views/widgets/orders_card.dart';
import 'package:multivendor_store/manager/authentication-bloc/authentication_bloc_bloc.dart';

import '../../../../../core/loading_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PaddingOrFont.size22.w, vertical: PaddingOrFont.size20.h),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                BlocConsumer<AuthenticationBlocBloc, AuthenticationBlocState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetLoggedInUser) {
                  return Column(
                    children: [
                      ChatAndWelcomeText(
                        userName: state.storeModel.fullNameOnId ?? '',
                      ),
                      SizedBox(
                        height: PaddingOrFont.size12.h,
                      ),
                      const BalanceCard(),
                      SizedBox(
                        height: PaddingOrFont.size12.h,
                      ),
                      const OrdersCard(),
                    ],
                  );
                } else {
                  return const Loading();
                }
              },
            )),
      ),
    );
  }
}
