import 'package:flutter/material.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/screen_home/widgets/numbered_poster_card.dart';
import 'package:netflix_ui/presentation/widgets/Widget_title.dart';

class NumberCardsScrollView extends StatelessWidget {
  const NumberCardsScrollView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title),
        kGapHeight10,
        SizedBox(
          height: MediaQuery.of(context).size.width / 2.2,
          child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => NumberedPosterCard(
                      number: index + 1,
                    ),
                itemCount: 10),
          ),
        )
      ],
    );
  }
}
