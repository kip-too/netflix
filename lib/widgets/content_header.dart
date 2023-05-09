import 'package:flutter/material.dart';
import 'package:netflix_clone1/models/content_model.dart';
import 'package:netflix_clone1/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () => print("My list"),
                ),
                _playButton(),
                VerticalIconButton(
                  icon: Icons.info,
                  title: "Info",
                  onTap: () => print("Info"),
                ),
              ],
            ))
      ],
    );
  }
}

class _playButton extends StatelessWidget {
  const _playButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set the background color to white
      ),
      onPressed: () => print("play"),
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30.0,
      ),
      label: const Text(
        "Play",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black, // Set the text color to black
        ),
      ),
    );
  }
}
