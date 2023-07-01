import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'HCl + AgNO₃ -> AgCl↓ + HNO₃',
                style: TextStyle(
                    fontFamily: 'Mefika', color: Colors.white, fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Avatar(),
                  Text(
                    'Nikolay,\n 33 y.o.',
                    style: TextStyle(
                        fontFamily: 'Mefika',
                        color: Colors.white,
                        fontSize: 32),
                  )
                ],
              ),
              Text(
                'I like:\n - Myself\n - Science\n - Then my code works',
                style: TextStyle(
                    fontFamily: 'Mefika', color: Colors.white, fontSize: 32),
              ),
              Text(
                'I have been programming on Flutter for 10 months as a freelancer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Mefika', color: Colors.white, fontSize: 32),
              ),
              MyButton()
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        builder: (context) => const VideoScreen(),
      ),
      child: const Text(
        'Finish it',
        textAlign: TextAlign.center,
        style:
            TextStyle(fontFamily: 'Mefika', color: Colors.amber, fontSize: 32),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: const DecorationImage(
          scale: 2,
          fit: BoxFit.cover,
          image: AssetImage(
            'lib/assets/images/photo.jpg',
          ),
        ),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('lib/assets/images/that-s-all-folks.mp4');
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: started(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data ?? false) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        } else {
          return const Text('waiting for video to load');
        }
      },
    );
  }
}
