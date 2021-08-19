import 'package:flutter/material.dart';
import 'package:lifestyle_hub/ui/widgets/image_loader.dart';
import 'package:lifestyle_hub/utils/pallets.dart';

class ChatEditText extends StatelessWidget {
  const ChatEditText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Pallets.grey50,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: TextFormField(
          controller: null,
          style: TextStyle(
            fontSize: 16.0,
          ),
          enabled: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          cursorColor: Pallets.orange500,
          decoration: new InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Pallets.grey100),
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: 'Type a message...',
              hintStyle: TextStyle(color: Pallets.grey400),
              suffixIcon: ImageLoader(
                path: 'assets/svgs/share.svg',
              )),
        ),
      ),
    );
  }
}
