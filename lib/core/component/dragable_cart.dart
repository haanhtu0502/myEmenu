import 'package:emenu/core/design_system/resource/image_const.dart';
import 'package:emenu/core/extensions/context_extension.dart';
import 'package:emenu/routes/app_pages.dart';
import 'package:emenu/theme/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

const double cartWidth = 50;
const double cartHeight = 50;

const double bigCartWidth = 55;
const double bigCartHeight = 55;

class DragableCart extends StatefulWidget {
  const DragableCart(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  State<DragableCart> createState() => _DragableCartState();
}

class _DragableCartState extends State<DragableCart> {
  double? _positionTop;
  double? _positionLeft;

  double _cartBubbleWidth = cartWidth;
  double _cartBubbleHeight = cartHeight;

  @override
  void initState() {
    setState(() {
      _resetPosition();
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DragableCart oldWidget) {
    if (oldWidget.screenHeight != widget.screenHeight ||
        oldWidget.screenWidth != widget.screenWidth) {
      _resetPosition();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _resetPosition() {
    setState(() {
      _positionTop = widget.screenHeight / 3 + 50;
      _positionLeft = widget.screenWidth - _cartBubbleWidth - 10;
    });
  }

  void _onMouseEnter() {
    setState(() {
      _cartBubbleHeight = bigCartHeight;
      _cartBubbleWidth = bigCartWidth;
    });
  }

  _onMouseExit() {
    setState(() {
      _cartBubbleHeight = cartHeight;
      _cartBubbleWidth = cartWidth;
    });
  }

  void _onDragEnd(DraggableDetails details) {
    setState(() {
      _cartBubbleHeight = cartHeight;
      _cartBubbleWidth = cartWidth;
      _positionTop = details.offset.dy;

      if (details.offset.dx < widget.screenWidth / 2) {
        _positionLeft = 10;
      } else {
        _positionLeft = widget.screenWidth - _cartBubbleWidth - 10;
      }
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _positionTop = details.globalPosition.dy;
      _positionLeft = details.globalPosition.dx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: _positionTop,
      left: _positionLeft,
      child: Draggable(
        onDragEnd: _onDragEnd,
        onDragUpdate: _onDragUpdate,
        feedback: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: bigCartHeight,
              width: bigCartWidth,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.transparent, width: 0),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                ImageConst.shoppingBag,
                width: bigCartWidth - 30,
                height: bigCartHeight - 30,
                fit: BoxFit.contain,
              ),
            ),
            _buildItemsNumber(context),
          ],
        ),
        childWhenDragging: const SizedBox(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            MouseRegion(
              onEnter: (event) {
                _onMouseEnter();
              },
              onExit: (event) {
                _onMouseExit();
              },
              child: GestureDetector(
                onTap: () {
                  context.push(AppPages.cart);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: _cartBubbleHeight,
                  width: _cartBubbleWidth,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.transparent, width: 0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    ImageConst.shoppingBag,
                    width: _cartBubbleWidth - 30,
                    height: _cartBubbleHeight - 30,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            _buildItemsNumber(context),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsNumber(BuildContext context) {
    return Positioned(
      top: -7,
      right: 0,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: ThemeConfig.redColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.transparent, width: 0),
        ),
        child: Center(
          child: Text(
            '1',
            style: context.titleSmall.copyWith(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
