import 'package:flutter/material.dart';

import 'model/generation_model.dart';
import 'widget/matrix_widget.dart';

class NetworkScreen extends StatelessWidget {
  NetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [MatrixDisplayWidget(me: Me.getMyDescendants())],
      ),
    );
  }
}
