import 'package:flutter/material.dart';

class RelaxView extends StatelessWidget {
  final AnimationController animationController;

  const RelaxView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _relaxAnimation,
                child: Text(
                  "𝑻𝒓𝒆𝒌 𝒄𝒂𝒎𝒑𝒊𝒏𝒈𝒐",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
              SlideTransition(
                position: _textAnimation,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "𝐼𝑓 𝑦𝑜𝑢 𝑎𝑟𝑒 𝑎 𝑓𝑎𝑛 𝑜𝑓 𝑐𝑎𝑚𝑝𝑖𝑛𝑔 𝑎𝑛𝑑 𝑔𝑜𝑖𝑛𝑔 𝑜𝑢𝑡 𝑜𝑛 𝑜𝑢𝑡𝑖𝑛𝑔𝑠 𝑡𝑜 𝑛𝑎𝑡𝑢𝑟𝑒 𝑎𝑛𝑑 𝑑𝑖𝑠𝑐𝑜𝑣𝑒𝑟𝑖𝑛𝑔 𝑏𝑒𝑎𝑢𝑡𝑖𝑓𝑢𝑙 𝑝𝑙𝑎𝑐𝑒𝑠 ,𝑇𝑟𝑒𝑘 𝑐𝑎𝑚𝑝𝑖𝑛𝑔𝑜 𝑖𝑠 𝑡ℎ𝑒 𝑠𝑜𝑙𝑢𝑡𝑖𝑜𝑛 !!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                    'assets/imgs/pic4.jpg',
                    fit: BoxFit.contain,
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
