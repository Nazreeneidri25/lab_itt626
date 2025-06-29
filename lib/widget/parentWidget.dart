import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lab_itt626/widget/drawer.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ParentWidget extends StatelessWidget {
  final Widget child;
  const ParentWidget({super.key , required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Live XRP Price (MYR)"),
        actions: [
          IconButton(
              onPressed: () => Navigator.popAndPushNamed(context, "/about"),
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.amber,
              ),
          )
        ],
      ),
      body: LoaderOverlay(
          child: child,
          overlayWidgetBuilder: (_){
            return Center(
              child: SpinKitThreeInOut(
                color: Colors.amber,
                size: 70.0,
              ),
            );
          }
      )
    );
  }
}
