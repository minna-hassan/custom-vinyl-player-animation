import 'package:custom_painter_assignment/music_player_painter.dart';
import 'package:custom_painter_assignment/record_stylus_stack.dart';
import 'package:flutter/material.dart';

class LandScapeMode extends StatefulWidget {
  const LandScapeMode({super.key});

  @override
  State<LandScapeMode> createState() => _LandScapeModeState();
}

class _LandScapeModeState extends State<LandScapeMode>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _rotationController.repeat();
      } else {
        _rotationController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final boardHeight = screenHeight * 0.88;
    final boardWidth = boardHeight * 1.05;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: Center(
        child: Container(
          width: boardWidth,
          height: boardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 33, 33, 33),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(55, 0, 0, 0),
                blurRadius: 25,
                spreadRadius: 1.4,
              ),
            ],
          ),

          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: boardHeight * 0.07,
                left: boardWidth * 0.18,
                child: RotatingRecord(
                  rotationController: _rotationController,
                  boardHeight: boardHeight,
                ),
              ),

              Positioned(
                left: boardWidth * 0.1,
                top: 0,
                child: RecordStylus(
                  boardWidth: boardWidth,
                  boardHeight: boardHeight,
                ),
              ),

              Positioned(
                left: boardWidth * 0.08,
                bottom: boardHeight * 0.18,
                right: boardWidth * 0.08,
                child: MusicPlayerLabel(boardHeight: boardHeight),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: boardHeight * 0.05,
                child: Center(
                  child: PlaybackControls(
                    isPlaying: isPlaying,
                    onTogglePlayPause: _togglePlayPause,
                    boardHeight: boardHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotatingRecord extends StatelessWidget {
  final AnimationController rotationController;
  final double boardHeight;

  const RotatingRecord({
    super.key,
    required this.rotationController,
    required this.boardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final recordSize = boardHeight * 0.62;

    return RotationTransition(
      turns: rotationController,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 25, spreadRadius: 1.4),
          ],
        ),
        child: SizedBox(
          width: recordSize,
          height: recordSize,
          child: CustomPaint(painter: RecordDiskPainter()),
        ),
      ),
    );
  }
}

class MusicPlayerLabel extends StatelessWidget {
  final double boardHeight;
  const MusicPlayerLabel({super.key, required this.boardHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "SAINT LAURENT",
          style: TextStyle(
            color: Colors.white,
            fontSize: boardHeight * 0.026,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: boardHeight * 0.005),
        Text(
          "WOMEN'S SUMMER 21 SOUNDTRACK",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 86, 86),
            fontSize: boardHeight * 0.021,
          ),
        ),
        SizedBox(height: boardHeight * 0.003),
        Text(
          "BY SEBASTIAN",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 86, 86),
            fontSize: boardHeight * 0.021,
          ),
        ),
        SizedBox(height: boardHeight * 0.025),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white.withOpacity(0.15),
        ),
      ],
    );
  }
}

class PlaybackControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTogglePlayPause;
  final double boardHeight;

  const PlaybackControls({
    super.key,
    required this.isPlaying,
    required this.onTogglePlayPause,
    required this.boardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = boardHeight * 0.056;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.skip_previous_rounded, color: Colors.white, size: iconSize),
        SizedBox(width: boardHeight * 0.16),
        GestureDetector(
          onTap: onTogglePlayPause,
          child: Container(
            width: boardHeight * 0.08,
            height: boardHeight * 0.08,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: const Color.fromARGB(90, 255, 255, 255),
                ),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(71, 0, 0, 0),
                  blurRadius: 12,
                  spreadRadius: 10,
                ),
              ],
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 33, 33, 33),
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
        SizedBox(width: boardHeight * 0.16),
        Icon(Icons.skip_next_rounded, color: Colors.white, size: iconSize),
      ],
    );
  }
}
