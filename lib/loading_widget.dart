// import 'package:anywork_mobile_app/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isBusy;
  const LoadingWidget({this.isBusy=false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isBusy? Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child:SizedBox(
      height:30,
        width:30,
        child: CircularProgressIndicator(),
      ),
      ),
    ):const SizedBox.shrink();
  }
}
