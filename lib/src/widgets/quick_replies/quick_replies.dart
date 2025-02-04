part of dash_chat_2;

/// @nodoc
class QuickReplies extends StatelessWidget {
  const QuickReplies({
    required this.quickReplies,
    this.quickReplyOptions = const QuickReplyOptions(),
    Key? key,
  }) : super(key: key);

  /// List of quick replies to show
  final List<QuickReply> quickReplies;

  /// Options used to customize quick replies behaviour and design
  final QuickReplyOptions quickReplyOptions;

  @override
  Widget build(BuildContext context) {
    return quickReplyOptions.quickReplyContainerBuilder != null
        ? quickReplyOptions.quickReplyContainerBuilder!(quickReplies)
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: quickReplyOptions.quickReplyScrollDirection ?? Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: quickReplies.map((QuickReply r) {
                      return quickReplyOptions.quickReplyBuilder != null
                          ? quickReplyOptions.quickReplyBuilder!(r)
                          : DefaultQuickReply(
                              quickReply: r,
                              quickReplyOptions: quickReplyOptions,
                            );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
  }
}
