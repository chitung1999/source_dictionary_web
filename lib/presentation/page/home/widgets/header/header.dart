import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/page_app.dart';

class HeaderApp extends StatefulWidget implements PreferredSizeWidget {
  const HeaderApp({super.key, required this.onTap});

  final Function(PageApp) onTap;

  @override
  State<HeaderApp> createState() => _HeaderAppState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderAppState extends State<HeaderApp> {
  final List<PageApp> _option = [PageApp.newWord, PageApp.words, PageApp.notes, PageApp.review, PageApp.logout];
  PageApp _currentPage = PageApp.newWord;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.bg3,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: Row(
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: MenuAnchor(
                builder: (BuildContext context, MenuController controller, Widget? child) {
                  return IconButton(
                    onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                    icon: Icon(Icons.menu, size: 40, color: ColorConstants.white),
                  );
                },
                menuChildren: [
                  for(int i = 0; i < _option.length; i++) SizedBox(
                    width: 150,
                    height: 50,
                    child: MenuItemButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_option[i].title(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: ColorConstants.black)),
                          Icon(_option[i].icon())
                        ],
                      ),
                      onPressed: () {
                        widget.onTap(_option[i]);
                        setState(() => _currentPage = _option[i]);
                      }
                    ),
                  )
                ]
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                _currentPage.title(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.white)
              ),
            ),
          ),
          Expanded(child: SizedBox.shrink())
        ],
      ),
    );
  }
}