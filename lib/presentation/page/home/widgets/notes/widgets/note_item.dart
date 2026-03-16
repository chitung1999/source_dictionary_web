import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.title, required this.note, required this.onEdit, required this.onDelete});
  final String title;
  final String note;
  final Function onEdit;
  final Function onDelete;

  @override
  NoteItemState createState() => NoteItemState();
}

class NoteItemState extends State<NoteItem> {
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => setState(() => _showDetail = !_showDetail),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 0, top: 5, bottom: 5),
              decoration: BoxDecoration(color: ColorConstants.bg2),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorConstants.hint),
                    ),
                  ),
                  MenuAnchor(
                    builder: (BuildContext context, MenuController controller, Widget? child) {
                      return IconButton(
                        onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                        icon: Icon(Icons.more_vert, color: ColorConstants.hint),
                      );
                    },
                    menuChildren: [
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: MenuItemButton(
                          child: Text('Edit', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: ColorConstants.black)),
                          onPressed: () => widget.onEdit()
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: MenuItemButton(
                            child: Text('Delete', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: ColorConstants.black)),
                            onPressed: () => widget.onDelete()
                        ),
                      )
                    ]
                  )
                  // IconButton(icon: Icon(Icons.more_vert, color: ColorConstants.hint), onPressed: () {})
                ],
              ),
            )
          ),
        ),
        if(_showDetail) Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(border: Border.all(color: ColorConstants.bg2)),
          child: Text(
            widget.note,
            style: TextStyle(fontSize: 16, color: ColorConstants.hint),
          ),
        )
      ],
    );
  }
}
