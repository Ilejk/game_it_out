import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/base_values.dart';
import 'package:login_logout_simple_ui/src/constants/images_constants.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/features/achievement_components/achievemnet.dart';
import 'package:login_logout_simple_ui/src/features/task_components/task.dart';

class LogicProvider with ChangeNotifier {
  final _storageBox = Hive.box('6969Box');
  List<Task> _items = ListConstants.kTaskBaseList;
  List<Achievement> _achievements = ListConstants.kAchievementList;
  List<Achievement> get achievements {
    return [..._achievements];
  }

  void _updateAchievements() {
    _achievements = ListConstants.kAchievementList.map((achievement) {
      return Achievement(
        title: achievement.title,
        isFinished: currentExpValue >= achievement.exp ||
            currentLvlCount >= achievement.lvl,
        description: achievement.description,
        exp: achievement.exp,
        lvl: achievement.lvl,
      );
    }).toList();
    notifyListeners();
  }

  String name = '';
  String surname = '';
  String character = '';

  void createInitialDataBase() {
    _achievements;
    _items;
  }

  void loadDataBase() {
    var tasks = _storageBox.get('TASKS');
    var currentLvlCountS = _storageBox.get('LEVEL_COUNT');
    var currentExpValueS = _storageBox.get('EXP_VALUE');
    var currentMaxValueS = _storageBox.get('MAX_VALUE');
    var diffInPercentageS = _storageBox.get('DIFF_IN_PERCENTAGE');
    var nameS = _storageBox.get('NAME');
    var surnameS = _storageBox.get('SURNAME');
    var characterS = _storageBox.get('CHARACTER');
    var achievementS = _storageBox.get('ACHIEVEMENTS');

    _items = tasks == null
        ? []
        : (tasks as List<dynamic>)
            .map((task) => Task.fromJson(
                (task as Map<dynamic, dynamic>).cast<String, dynamic>()))
            .toList();
    currentLvlCount = currentLvlCountS ?? 1;
    currentExpValue = currentExpValueS ?? 0.0;
    currentMaxExpValue = currentMaxValueS ?? 100.0;
    differenctInPercentageExpValue = diffInPercentageS ?? 0.0;
    name = nameS ?? 'John';
    surname = surnameS ?? 'Doe';
    character = characterS ?? ImagesConstants.kManCharacterPNG;
    _achievements = achievementS?.cast<Achievement>() ?? [];
  }

  void updateDataBase() {
    _storageBox.put('TASKS', _items.map((task) => task.toJson()).toList());
    _storageBox.put('LEVEL_COUNT', currentLvlCount);
    _storageBox.put('EXP_VALUE', currentExpValue);
    _storageBox.put('MAX_VALUE', currentMaxExpValue);
    _storageBox.put('DIFF_IN_PERCENTAGE', differenctInPercentageExpValue);
    _storageBox.put('NAME', name);
    _storageBox.put('SURNAME', surname);
    _storageBox.put('CHARACTER', character);
    _storageBox.put('ACHIEVEMENTS', _achievements);
  }

  List<Task> get items {
    return [..._items];
  }

  void addTask(Task task) {
    final newTask = Task(
      title: task.title,
      difficulty: task.difficulty,
      duration: task.duration,
      exp: task.exp,
    );
    _items.add(newTask);
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }

  int currentLvlCount = 1;
  double currentExpValue = BaseValues.kBaseCurrentExpValue;
  double currentMaxExpValue = ListConstants.kMaxExpValuesList[0];
  double differenctInPercentageExpValue =
      BaseValues.kBaseDifferenctInPercentageExpValue;

  void changeMaxExpValue() {
    // ignore: prefer_typing_uninitialized_variables
    var maxLvl = ListConstants.kMaxExpValuesList.length - 1;
    var lvlIndex = maxLvl;
    for (int i = 0; i < maxLvl; i++) {
      var currentElementValue = ListConstants.kMaxExpValuesList[i];
      var nextElementValue = ListConstants.kMaxExpValuesList[i + 1];
      if (currentExpValue > currentElementValue &&
          currentExpValue <= nextElementValue) {
        lvlIndex = i;
        updateDataBase();
        loadDataBase();
        break;
      }
    }

    if (currentLvlCount < lvlIndex + 1) currentLvlCount = lvlIndex + 1;
    if (currentLvlCount < maxLvl) {
      var startLvlRange = ListConstants.kMaxExpValuesList[lvlIndex];
      var endLvlRange = ListConstants.kMaxExpValuesList[lvlIndex + 1];
      updatePrecentageValue(endLvlRange, startLvlRange);
    } else {
      differenctInPercentageExpValue = 1.0;
    }
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }

  void updatePrecentageValue(
      double nextElementValue, double currentElementValue) {
    var diffValue = nextElementValue - currentElementValue;
    differenctInPercentageExpValue =
        (currentExpValue - currentElementValue) / diffValue;
    updateDataBase();
    loadDataBase();
  }

  void addTaskExp(Task task) {
    currentExpValue += task.exp;
    changeMaxExpValue();
    _updateAchievements();
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }

  void deleteTask(String title) {
    final existingTaskIndex = _items.indexWhere((task) => task.title == title);
    // ignore: unused_local_variable
    Task? existingTask = _items[existingTaskIndex];
    _items.removeAt(existingTaskIndex);
    updateDataBase();
    loadDataBase();
    notifyListeners();

    existingTask = null;
  }

  void addName(String eneteredName) {
    name = eneteredName;
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }

  void addSurname(String eneteredSurname) {
    surname = eneteredSurname;
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }

  void pickedCharacter(String pickedCharacter) {
    character = pickedCharacter;
    updateDataBase();
    loadDataBase();
    notifyListeners();
  }
}
