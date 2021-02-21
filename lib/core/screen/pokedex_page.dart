import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/colors/colors.dart';
import 'package:pokedex/core/screen/pikachu.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 375,
        height: 667,
        child: Stack(
          children: [
            Background(),
            Positioned(
              top: 24,
              left: 24,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lamp(),
                  SizedBox(
                    width: 20,
                  ),
                  TreeLeds(),
                ],
              ),
            ),
            Positioned(
              top: 205,
              left: 24,
              child: ScreeFrame(),
            )
          ],
        ),
      ),
    );
  }
}

class ScreeFrame extends StatelessWidget {
  const ScreeFrame({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 288,
          height: 236,
          child: ClipPath(
            clipper: ScreenClipper(),
            child: Container(
              color: AppColors.screenFrame,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 29,
                  right: 26,
                  bottom: 44,
                  left: 26,
                ),
                child: buildInternalFrame(),
              ),
            ),
          ),
        ),
        Pikachu(),
      ],
    );
  }

  Container buildInternalFrame({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff777474),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class ScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0, 0),
          Offset(
            size.width,
            size.height,
          ),
        ),
        Radius.circular(30),
      ),
    );

    var p1 = Offset(0, size.height - 46);
    var p2 = Offset(0, size.height);
    var p3 = Offset(46, size.height);
    final triangle = Path()
      ..moveToOffset(p1)
      ..lineToOffset(p2)
      ..lineToOffset(p3)
      ..close();

    return Path.combine(
      PathOperation.difference,
      path,
      triangle,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

extension on Path {
  void lineToOffset(Offset offset) {
    lineTo(offset.dx, offset.dy);
  }

  void moveToOffset(Offset offset) {
    moveTo(offset.dx, offset.dy);
  }
}

class TreeLeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildLed(
          AppColors.redLedInner,
          AppColors.redLedOuter,
          AppColors.redLedBorder,
        ),
        _buildLed(
          AppColors.yellowLedInner,
          AppColors.yellowLedOuter,
          AppColors.yellowLedBorder,
        ),
        _buildLed(
          AppColors.greenLedInner,
          AppColors.greenLedOuter,
          AppColors.greenLedBorder,
        ),
      ],
    );
  }

  Widget _buildLed(
    Color color1,
    Color color2,
    Color color3,
  ) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [
            color1,
            color2,
            color3,
          ], stops: [
            0,
            0.9,
            1,
          ]),
        ),
      ),
    );
  }
}

class Lamp extends StatelessWidget {
  const Lamp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lampFrame,
      ),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  AppColors.lampInner,
                  AppColors.lampOuter,
                ], stops: [
                  0.7,
                  1
                ]),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.lampShineIner,
                      AppColors.lampShineOuter,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.pokeballRedBottom,
    );
  }
}
