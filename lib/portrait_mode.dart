import 'package:custom_painter_assignment/music_player_painter.dart';
import 'package:custom_painter_assignment/record_stylus_stack.dart';
import 'package:flutter/material.dart';

class PortraitMode extends StatefulWidget {
  const PortraitMode({super.key});

  @override
  State<PortraitMode> createState() => _PortraitModeState();
}

class _PortraitModeState extends State<PortraitMode>
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
    final screenWidth = MediaQuery.sizeOf(context).width;

    final boardWidth = screenWidth * 0.90;
    final boardHeight = boardWidth * 1.05;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  left: boardWidth * 0.22,
                  top: boardHeight * 0.08,
                  child: RotationTransition(
                    turns: _rotationController,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 25,
                            spreadRadius: 1.4,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: boardWidth * 0.56,
                        height: boardWidth * 0.56,
                        child: CustomPaint(painter: RecordDiskPainter()),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: boardWidth * 0.08,
                  top: boardHeight * 0.66,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SAINT LAURENT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: boardWidth * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: boardHeight * 0.008),
                      Text(
                        "WOMEN'S SUMMER 21 SOUNDTRACK",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 86, 86, 86),
                          fontSize: boardWidth * 0.030,
                        ),
                      ),
                      SizedBox(height: boardHeight * 0.004),
                      Text(
                        "BY SEBASTIAN",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 86, 86, 86),
                          fontSize: boardWidth * 0.030,
                        ),
                      ),
                      SizedBox(height: boardHeight * 0.025),
                      Container(
                        width: boardWidth * 0.84,
                        height: 1,
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  top: boardHeight * 0.84,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.skip_previous_rounded,
                        color: Colors.white,
                        size: boardWidth * 0.085,
                      ),
                      SizedBox(width: boardWidth * 0.16),
                      GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          width: boardWidth * 0.13,
                          height: boardWidth * 0.13,
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Color.fromARGB(90, 255, 255, 255),
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(71, 0, 0, 0),
                                blurRadius: 12,
                                spreadRadius: 10,
                              ),
                            ],
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 33, 33, 33),
                          ),
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: boardWidth * 0.085,
                          ),
                        ),
                      ),
                      SizedBox(width: boardWidth * 0.16),
                      Icon(
                        Icons.skip_next_rounded,
                        color: Colors.white,
                        size: boardWidth * 0.085,
                      ),
                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
