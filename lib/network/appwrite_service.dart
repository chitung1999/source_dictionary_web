import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:learning_english_web/core/constants/appwrite_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/models/note_model.dart';

final server = AppwriteService();

class AppwriteService {
  late final Client _client;
  late final Account _account;
  late final TablesDB _tablesDB;

  AppwriteService._internal() {
    _client = Client();
    _client.setEndpoint(AppWriteConstant.endPoint).setProject(AppWriteConstant.projectID).setSelfSigned(status: true);
    _account = Account(_client);
    _tablesDB = TablesDB(_client);
  }

  factory AppwriteService() => _instance;
  static final AppwriteService _instance = AppwriteService._internal();

  Future<StatusApp> checkLoginStatus() async {
    try {
      await _account.get();
      return StatusApp.bypassLogin;
    } catch (_) {
      return StatusApp.error;
    }
  }

  Future<StatusApp> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) return StatusApp.loginBlank;
    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return StatusApp.loginSuccess;
    } catch (_) {
      return StatusApp.loginError;
    }
  }

  Future<StatusApp> logout() async {
    await _account.deleteSession(sessionId: 'current');
    return StatusApp.success;
  }

  Future<({StatusApp status, List<String> words, List<NoteModel> notes})> getData() async {
    List<String> words = [];
    List<NoteModel> notes = [];
    try {
      final user = await _account.get();

      final responseWords = await _tablesDB.getRow(
        databaseId: AppWriteConstant.databaseId,
        tableId: AppWriteConstant.dataWordsTableId,
        rowId: user.$id,
      );
      words = List<String>.from(responseWords.data['data']);

      final responseNotes = await _tablesDB.getRow(
        databaseId: AppWriteConstant.databaseId,
        tableId: AppWriteConstant.dataNotesTableId,
        rowId: user.$id,
      );
      final jsonStr = responseNotes.data['data'];
      final List<dynamic> list = jsonDecode(jsonStr);
      notes = list.map((e) => NoteModel.fromJson(Map<String, dynamic>.from(e as Map))).toList(growable: false);

    return (status: StatusApp.getDataSuccess, words: words, notes: notes);
    } catch (e) {
      return (status: StatusApp.error, words: words, notes: notes);
    }
  }

  Future <StatusApp> updateWords(List<String> words) async {
    try {
      final user = await _account.get();
      await _tablesDB.updateRow(
        databaseId: AppWriteConstant.databaseId,
        tableId: AppWriteConstant.dataWordsTableId,
        rowId: user.$id,
        data: {'data': words}
      );

      return StatusApp.updateWordsSuccess;
    } catch (_) {
      return StatusApp.updateDataError;
    }
  }

  Future <StatusApp> updateNotes(List<NoteModel> notes) async {
    try {
      final user = await _account.get();
      final strJson = jsonEncode(notes.map((e) => e.toJson()).toList());
      await _tablesDB.updateRow(
          databaseId: AppWriteConstant.databaseId,
          tableId: AppWriteConstant.dataNotesTableId,
          rowId: user.$id,
          data: {'data': strJson}
      );
      return StatusApp.updateNotesSuccess;
    } catch (_) {
      return StatusApp.updateDataError;
    }
  }
}