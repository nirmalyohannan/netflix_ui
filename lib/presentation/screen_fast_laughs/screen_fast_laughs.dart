import 'package:flutter/material.dart';
import 'package:netflix_ui/presentation/screen_fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    const shortsUrl = [
      "https://www.youtube.com/shorts/TzXkS9QPjPY",
      "https://www.youtube.com/shorts/ID72C7jsOAA",
      "https://www.youtube.com/shorts/BM_JQ4AL8gc",
      "https://www.youtube.com/watch?v=0jKoQcZOwTw",
      "https://www.youtube.com/shorts/9zgZO3EFmNw",
      "https://www.youtube.com/shorts/Ob8-HJ7uh7s",
    ];
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(shortsUrl.length,
          (index) => VideoListItem(index: index, videoUrl: shortsUrl[index])),
    );
  }
}
