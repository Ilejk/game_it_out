import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_logout_simple_ui/src/constants/list_constants.dart';
import 'package:login_logout_simple_ui/src/constants/string_constants.dart';
import 'package:login_logout_simple_ui/src/providers/task.dart';

class TaskProvider with ChangeNotifier {
  final _storageBox = Hive.box('tBox');
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
    if (tasks != null) {
      _items = (tasks as List<dynamic>)
          .map((task) => Task.fromJson(
              (task as Map<dynamic, dynamic>).cast<String, dynamic>()))
          .toList();
    } else {
      _items = [];
    }
  }

  void updateDataBase() {
    _storageBox.put('TASKS', _items.map((task) => task.toJson()).toList());
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

  double currentExpValue = 0.0;
  double maxValueExpValue = 100.0;
  double previousMaxValueExpValue = 100.0;
  double leftValue = 0.0;
  changeMaxExpValue() {
    for (int i = 0; i < ListConstants.kMaxExpValuesList.length; i++) {
      if (currentExpValue >= ListConstants.kMaxExpValuesList[i]) {
        if (i + 1 < ListConstants.kMaxExpValuesList.length) {
          maxValueExpValue = ListConstants.kMaxExpValuesList[i + 1];
        } else {
          maxValueExpValue = ListConstants.kMaxExpValuesList[i];
        }
      } else {
        break;
      }
    }

    if (maxValueExpValue != previousMaxValueExpValue) {
      leftValue = (previousMaxValueExpValue - currentExpValue) * -1;
      currentExpValue = 0.0 + leftValue;
      previousMaxValueExpValue = maxValueExpValue;
    }
    notifyListeners();
  }

  double differenceInExpValue = 0.0;
  void getDifferenceInExpValue() {
    differenceInExpValue = maxValueExpValue - currentExpValue;
  }

  double differenctInPercentageExpValue = 0.0;
  getPercentageInExpValue() {
    getDifferenceInExpValue();
    differenctInPercentageExpValue =
        1.0 - (differenceInExpValue / maxValueExpValue);
    return differenctInPercentageExpValue;
  }

  void addTaskExp(Task task) {
    currentExpValue += task.exp;
    changeMaxExpValue();
    getPercentageInExpValue();
    notifyListeners();
  }

  void printKijano() {
    // ignore: avoid_print
    print(StringConstants.kKijano1);
    // ignore: avoid_print
    print(StringConstants.kKijano2);
    // ignore: avoid_print
    print(StringConstants.kKijano3);
    // ignore: avoid_print
    print(StringConstants.kKijano4);
    // ignore: avoid_print
    print(StringConstants.kKijano5);
    // ignore: avoid_print
    print(StringConstants.kKijano6);
    // ignore: avoid_print
    print(StringConstants.kKijano7);
    // ignore: avoid_print
    print(StringConstants.kKijano8);
  }

  void deleteTask(String title) {
    final existingTaskIndex = _items.indexWhere((task) => task.title == title);
    // ignore: unused_local_variable
    Task? existingTask = _items[existingTaskIndex];
    _items.removeAt(existingTaskIndex);
    updateDataBase();
    loadDataBase();
    printKijano();
    notifyListeners();

    existingTask = null;
  }
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      title: fields[0] as String,
      difficulty: fields[1] as String,
      duration: fields[2] as double,
      exp: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.title);
    writer.writeByte(1);
    writer.write(obj.difficulty);
    writer.writeByte(2);
    writer.write(obj.duration);
    writer.writeByte(3);
    writer.write(obj.exp);
  }
}
