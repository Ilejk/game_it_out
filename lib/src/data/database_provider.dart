import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/base_values.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/data/achievemnet.dart';
import 'package:login_logout_simple_ui/src/data/task.dart';

class DataBaseProvider with ChangeNotifier {
  final _storageBox = Hive.box('dBox');
  List<Achievement> _achievements = ListConstants.kAchievementList;
  List<Achievement> get achievements {
    return [..._achievements];
  }

  List<Task> _items = [];

  void createInitialDataBase() {
    _items = [
      Task(
        title: 'Code',
        difficulty: 'Medium',
        duration: 5.0,
        exp: 50.55,
      ),
      Task(
        title: 'Read',
        difficulty: 'Easy',
        duration: 1.0,
        exp: 10.0,
      ),
      Task(
        title: 'Go for a walk',
        difficulty: 'Easy',
        duration: 2.0,
        exp: 20.0,
      ),
      Task(
        title: 'Exercise',
        difficulty: 'Hard',
        duration: 0.5,
        exp: 15.0,
      ),
      Task(
        title: 'Study',
        difficulty: 'Medium',
        duration: 2.5,
        exp: 22.25,
      ),
      Task(
        title: 'Clean up',
        difficulty: 'Easy',
        duration: 1.0,
        exp: 10.0,
      ),
      Task(
        title: 'Cook dinner',
        difficulty: 'Easy',
        duration: 1.5,
        exp: 15.0,
      ),
      Task(
        title: 'Spend time with family',
        difficulty: 'Easy',
        duration: 1.5,
        exp: 15.0,
      ),
    ];
  }

  void loadDataBase() {
    var tasks = _storageBox.get('TASKS');
    var currentLvlCountS = _storageBox.get('LEVEL_COUNT');
    var currentExpValueS = _storageBox.get('EXP_VALUE');
    var currentMaxValueS = _storageBox.get('MAX_VALUE');
    var diffInPercentageS = _storageBox.get('DIFF_IN_PERCENTAGE');

    if (tasks != null) {
      _items = (tasks as List<dynamic>)
          .map((task) => Task.fromJson(
              (task as Map<dynamic, dynamic>).cast<String, dynamic>()))
          .toList();
    } else {
      _items = [];
    }
    if (currentLvlCountS != null) {
      currentLvlCount = currentLvlCountS;
    } else {
      currentLvlCount = 1;
    }

    if (currentExpValueS != null) {
      currentExpValue = currentExpValueS;
    } else {
      currentExpValue = 0.0;
    }

    if (currentMaxValueS != null) {
      currentMaxExpValue = currentMaxValueS;
    } else {
      currentMaxExpValue = 100.0;
    }
    if (diffInPercentageS != null) {
      differenctInPercentageExpValue = diffInPercentageS;
    } else {
      differenctInPercentageExpValue = 0.0;
    }
  }

  void updateDataBase() {
    _storageBox.put('TASKS', _items.map((task) => task.toJson()).toList());
    _storageBox.put('LEVEL_COUNT', currentLvlCount);
    _storageBox.put('EXP_VALUE', currentExpValue);
    _storageBox.put('MAX_VALUE', currentMaxExpValue);
    _storageBox.put('DIFF_IN_PERCENTAGE', differenctInPercentageExpValue);
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
//   void addAchievement(Achievement achievement) {
// final newAchievement
//   }
}
