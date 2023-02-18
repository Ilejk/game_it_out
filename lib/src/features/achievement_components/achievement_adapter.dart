import 'package:hive/hive.dart';
import 'achievemnet.dart';

class AchievementAdapter extends TypeAdapter<Achievement> {
  @override
  int get typeId => 1;

  @override
  Achievement read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Achievement(
      title: fields[0] as String,
      isFinished: fields[1] as bool,
      description: fields[2] as String,
      exp: fields[3] as double,
      lvl: fields[4] as int,
      finished: fields[5] as int,
      deleted: fields[6] as int,
      created: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Achievement obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isFinished)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.exp)
      ..writeByte(4)
      ..write(obj.lvl)
      ..writeByte(5)
      ..write(obj.finished)
      ..writeByte(6)
      ..write(obj.deleted)
      ..writeByte(7)
      ..write(obj.created);
  }
}
