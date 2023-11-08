import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:multivendor_store/core/exports/exports.dart';
import 'package:multivendor_store/core/input_decoration.dart';
import 'package:multivendor_store/localization/app_localization.dart';

import '../../../../core/dummy/messages.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme!.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
        centerTitle: true,
        title: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translate(key: 'Chat', context: context),
                style: context.bold!.copyWith(
                  fontSize: PaddingOrFont.size18.spMax,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: PaddingOrFont.size8.h,
              ),
              Text(
                'Fawzi Gharib',
                style: context.regular!.copyWith(
                  fontSize: PaddingOrFont.size12.spMax,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: ChatViewBody(),
        ),
      ),
    );
  }
}

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  List<Messages> messages = [
    // Conversation 1 (Date 1)
    Messages(
        text: "Hey there!",
        dateTime: DateTime(2023, 10, 16, 10, 30),
        isSentByMe: true),
    Messages(
        text: "Hello! How's it going?",
        dateTime: DateTime(2023, 10, 16, 10, 35),
        isSentByMe: false),
    Messages(
        text: "I'm doing well, thanks!",
        dateTime: DateTime(2023, 10, 16, 11, 15),
        isSentByMe: true),
    Messages(
        text: "Great to hear!",
        dateTime: DateTime(2023, 10, 16, 11, 20),
        isSentByMe: false),

    // Conversation 2 (Date 2)
    Messages(
        text: "Good morning!",
        dateTime: DateTime(2023, 10, 17, 9, 0),
        isSentByMe: true),
    Messages(
        text: "Morning! Any plans for today?",
        dateTime: DateTime(2023, 10, 17, 9, 5),
        isSentByMe: false),
    Messages(
        text: "I'm working on a project.",
        dateTime: DateTime(2023, 10, 17, 9, 30),
        isSentByMe: true),
    Messages(
        text: "That sounds productive.",
        dateTime: DateTime(2023, 10, 17, 9, 35),
        isSentByMe: false),

    // Conversation 3 (Date 3)
    Messages(
        text: "Hi there!",
        dateTime: DateTime(2023, 10, 18, 14, 0),
        isSentByMe: true),
    Messages(
        text: "Hey! How's your day going?",
        dateTime: DateTime(2023, 10, 18, 14, 10),
        isSentByMe: false),
    Messages(
        text: "I had a busy day at work.",
        dateTime: DateTime(2023, 10, 18, 15, 0),
        isSentByMe: true),
    Messages(
        text: "I hope you're not too tired.",
        dateTime: DateTime(2023, 10, 18, 15, 10),
        isSentByMe: false),

    // Conversation 4 (Date 4)
    Messages(
        text: "Hello!",
        dateTime: DateTime(2023, 10, 20, 16, 45),
        isSentByMe: true),
    Messages(
        text: "Hi! What's new?",
        dateTime: DateTime(2023, 10, 20, 16, 50),
        isSentByMe: false),
    Messages(
        text: "Not much, just relaxing.",
        dateTime: DateTime(2023, 10, 20, 17, 15),
        isSentByMe: true),
    // Messages(
    //     text: "Relaxation is important.",
    //     dateTime: DateTime(2023, 10, 20, 17, 20),
    //     isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GroupedListView<Messages, DateTime>(
            reverse: true,
            order: GroupedListOrder.DESC,
            elements: messages,
            groupBy: (element) => DateTime(
              element.dateTime.year,
              element.dateTime.month,
              element.dateTime.day,
            ),
            groupHeaderBuilder: (element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40.h,
                child: Center(
                  child: Text(
                    DateFormat.yMMMd().format(element.dateTime).toString(),
                    style: context.regular!.copyWith(
                      fontSize: PaddingOrFont.size10.w,
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, element) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: PaddingOrFont.size10.w),
                alignment: element.isSentByMe != true
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    element.isSentByMe
                        ? CircleAvatar(
                            radius: 22.r,
                            backgroundImage: const AssetImage(
                              AppAssets.user,
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.all(PaddingOrFont.size10.w),
                      child: Container(
                        padding: EdgeInsets.all(PaddingOrFont.size12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: element.isSentByMe
                              ? context.colorScheme!.primary
                              : context.colorScheme!.onBackground.withAlpha(20),
                        ),
                        child: Text(
                          element.text,
                          style: context.regular!.copyWith(
                            color: element.isSentByMe
                                ? Colors.white
                                : context.colorScheme!.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        Padding(
          padding: EdgeInsets.all(PaddingOrFont.size14.w),
          child: TextField(
              decoration: inputDecoration(context).copyWith(
            hintText: translate(key: 'Type a message...', context: context),
            suffix: GestureDetector(
              onTap: () {
                setState(() {
                  messages.add(
                    Messages(
                      text: 'That\'s something for sure ',
                      dateTime: DateTime(2023, 10, 21, 17, 20),
                      isSentByMe: true,
                    ),
                  );
                });
              },
              child: Text(
                translate(key: 'Send', context: context),
                style: context.semiBold!.copyWith(
                  color: context.colorScheme!.tertiary,
                  fontSize: PaddingOrFont.size16.spMax,
                ),
              ),
            ),
          )),
        )
      ],
    );
  }
}
