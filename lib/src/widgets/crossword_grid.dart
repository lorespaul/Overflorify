import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CrosswordGrid extends StatelessWidget {
  CrosswordGrid({this.rows, this.columns, this.onChange});

  final BorderSide _borderSide = BorderSide(color: Colors.blue[500], width: 3);
  final String _validCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  final int rows;
  final int columns;
  final Function(int, int, String) onChange;

  @override
  Widget build(BuildContext context) {
    var widgetRows = List<Row>();

    for (int i = 0; i < rows; i++) {
      var widgetColumns = List<Column>();

      for (int n = 0; n < columns; n++) {
        final textEditingController = TextEditingController();
        final row = i;
        final column = n;

        widgetColumns.add(Column(
          children: <Container>[
            Container(
              padding: EdgeInsets.only(left: 14, top: 8, right: 5, bottom: 4),
              decoration: BoxDecoration(border: _buildBorders(i, n)),
              width: 50,
              height: 50,
              alignment: Alignment.bottomCenter,
              child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'RobotoMono',
                      fontFeatures: [FontFeature.tabularFigures()]),
                  textAlignVertical: TextAlignVertical.top,
                  controller: textEditingController,
                  onChanged: (String text) {
                    _manageChangeText(text, textEditingController);
                    if (onChange != null) {
                      onChange(row, column, textEditingController.text);
                    }
                  }),
            )
          ],
        ));
      }
      widgetRows.add(Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgetColumns,
      ));
    }

    return Container(
        decoration: BoxDecoration(
          border:
              Border.all(color: _borderSide.color, width: _borderSide.width),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // boxShadow: [
          //   BoxShadow(
          //       color: _borderSide.color,
          //       spreadRadius: 5,
          //       blurRadius: 7,
          //       offset: Offset(0, 3))
          // ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetRows,
        ));
  }

  Border _buildBorders(int row, int column) {
    if (row == 0 && column == 0) {
      return Border();
    } else if (row == 0) {
      return Border(left: _borderSide);
    } else if (column == 0) {
      return Border(top: _borderSide);
    } else {
      return Border(left: _borderSide, top: _borderSide);
    }
  }

  void _manageChangeText(String text, TextEditingController controller) {
    var newText = text.substring(text.length - 1).toUpperCase();
    if (_validCharacters.contains(newText)) {
      controller.text = newText;
    } else if (text.length > 1) {
      controller.text = text.substring(0, 1).toUpperCase();
    } else {
      controller.text = '';
    }
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }
}
