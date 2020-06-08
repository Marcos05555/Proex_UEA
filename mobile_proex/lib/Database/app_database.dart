import 'package:mobile_proex/modelos/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bancomeu.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE usuario('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'senha INTEGER,'
          'foto TEXT) ');
    }, version: 1,
    //  onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(User contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> userMap = Map();
      // userMap['id'] = contact.id;
    userMap['name'] = contact.logindeuser;
    userMap['senha'] = contact.idade;
    userMap['foto'] = contact.fotodeuser;
    return db.insert('usuario', userMap);
  });
}

Future<List<User>> findAll() {
  return createDatabase().then((db){
    return  db.query('usuario').then((maps) {
      final List<User> users = List();
      for (Map<String, dynamic> map in maps) {
        final User contact =
            User(map['id'], map['name'], map['senha'], map['foto']);
            users.add(contact);
            
      }
      return users;
    });
  });
}

