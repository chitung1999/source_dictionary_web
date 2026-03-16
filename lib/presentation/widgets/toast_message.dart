import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';

abstract class ToastMessage {
  static OverlayEntry? _currentOverlayEntry;

  static Icon getIcon(StatusApp status) {
    switch(status) {
      case StatusApp.success:
      case StatusApp.loginSuccess:
        return Icon(Icons.check, color: Colors.green);
      case StatusApp.error:
      case StatusApp.loginBlank:
      case StatusApp.loginError:
      case StatusApp.updateDataError:
        return Icon(Icons.clear, color: Colors.red);
      default:
        return Icon(Icons.priority_high, color: Colors.yellow);
    }
  }

  static String getMessage(StatusApp status) {
    switch(status) {
      case StatusApp.success:
        return '';
      case StatusApp.error:
        return 'Something is wrong!';
      case StatusApp.loginBlank:
        return 'Username or Password cannot be blank!';
      case StatusApp.loginError:
        return 'Login Error!';
      case StatusApp.loginSuccess:
        return 'Login successful!';
      case StatusApp.updateDataError:
        return 'Update data Error!';
      case StatusApp.noteEmpty:
        return 'Title or Content cannot be blank!';
      // case StatusApp.newWordExist:
      //   return 'New word already exist!';
      // case StatusApp.newWordInvalid:
      //   return 'New word contains invalid character!';
      // case StatusApp.updateFail:
      //   return 'Data update failed!';
      default:
        return '';
    }
  }

  static show(BuildContext context, StatusApp status, {int delay = 5000}) {
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;

    Icon icon = getIcon(status);
    String msg = getMessage(status);

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              _currentOverlayEntry?.remove();
              _currentOverlayEntry = null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
              decoration: BoxDecoration(
                color: ColorConstants.bg3,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  icon,
                  Text(
                    msg,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    _currentOverlayEntry = overlayEntry;
    overlay.insert(overlayEntry);

    Future.delayed(Duration(milliseconds: delay), () {
      if (_currentOverlayEntry == overlayEntry) {
        _currentOverlayEntry?.remove();
        _currentOverlayEntry = null;
      }
    });
  }

  static Future<bool> showConfirm(BuildContext context, String message, String textButton) async {
    final overlay = Overlay.of(context, rootOverlay: true);
    final completer = Completer<bool>();
    late OverlayEntry entry;

    void close(bool result) {
      if (!completer.isCompleted) {
        completer.complete(result);
      }
      entry.remove();
    }

    entry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => close(false),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: ColorConstants.bg3,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Flexible(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Nút Delete
                        TextButtonApp.primary(
                          text: textButton,
                          textStyle: TextStyle(
                            fontSize: 17,
                            color: ColorConstants.black,
                          ),
                          width: 80,
                          height: 40,
                          radius: 5,
                          bgColor: ColorConstants.white,
                          onPressed: () => close(true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(entry);
    return completer.future;
  }
}