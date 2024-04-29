import 'package:flutter/material.dart';
import 'package:joblance/view/widgets/conversation_shimmer.dart';

class ConversationsShimmer extends StatelessWidget {
  const ConversationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ConversationShimmer();
      },
    );
  }
}
