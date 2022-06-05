import 'package:flutter/material.dart';

import '../helper/status.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({Key? key, required this.status}) : super(key: key);
  final double status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Stack(children: [
          Image.asset(
            getStatus(status)[0],
            height: 80,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Text(
              getStatus(status)[1],
            ),
          )
        ]),
      ),
    );
  }
}
