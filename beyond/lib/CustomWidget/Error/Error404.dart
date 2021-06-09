import 'package:flutter/material.dart';
import 'package:beyond/Constant/Value/Dimens.dart';
import 'package:beyond/Constant/Value/AppTheme.dart';

// ignore: must_be_immutable
class EmptyStateError extends StatefulWidget {
  Function() reload;
  EmptyStateError({Key key, this.reload}) : super(key: key);

  @override
  _EmptyStateErrorState createState() => _EmptyStateErrorState();
}

class _EmptyStateErrorState extends State<EmptyStateError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        spacing: Dimens.space_20px,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Image.asset("Assets/server_error.png"),
          Text(
            "Oups !",
            style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontSize: Dimens.text_size_xlarge,
                fontFamily: AppTheme.fontCircularStdBold),
          ),
          Text(
            "Page introuvable",
            style: TextStyle(
                color: Color(0xFFC4C4C4),
                fontSize: Dimens.text_size_mediumx,
                fontFamily: AppTheme.fontCircularStdBold),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: Dimens.space_20px, left: Dimens.space_20px),
            child: Container(
              height: Dimens.size_bubble,
              // ignore: deprecated_member_use
              child: RaisedButton(
                elevation: 0,
                onPressed: () {
                  widget.reload.call();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.space_6px)),
                padding: EdgeInsets.all(0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: AppTheme.appColor,
                      borderRadius: BorderRadius.circular(Dimens.space_6px)),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: Dimens.space_20px, right: Dimens.space_20px),
                    alignment: Alignment.center,
                    child: Text(
                      "Essayez de nouveau",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimens.text_size_xmedium,
                          color: Colors.white,
                          fontFamily: AppTheme.fontCircularStdBold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
