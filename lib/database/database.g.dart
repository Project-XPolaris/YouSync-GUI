// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SyncFolderDao? _syncFolderDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SyncFolder` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `localPath` TEXT NOT NULL, `remoteId` INTEGER NOT NULL, `syncFileList` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SyncFolderDao get syncFolderDao {
    return _syncFolderDaoInstance ??= _$SyncFolderDao(database, changeListener);
  }
}

class _$SyncFolderDao extends SyncFolderDao {
  _$SyncFolderDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _syncFolderInsertionAdapter = InsertionAdapter(
            database,
            'SyncFolder',
            (SyncFolder item) => <String, Object?>{
                  'id': item.id,
                  'localPath': item.localPath,
                  'remoteId': item.remoteId,
                  'syncFileList': item.syncFileList ? 1 : 0
                }),
        _syncFolderUpdateAdapter = UpdateAdapter(
            database,
            'SyncFolder',
            ['id'],
            (SyncFolder item) => <String, Object?>{
                  'id': item.id,
                  'localPath': item.localPath,
                  'remoteId': item.remoteId,
                  'syncFileList': item.syncFileList ? 1 : 0
                }),
        _syncFolderDeletionAdapter = DeletionAdapter(
            database,
            'SyncFolder',
            ['id'],
            (SyncFolder item) => <String, Object?>{
                  'id': item.id,
                  'localPath': item.localPath,
                  'remoteId': item.remoteId,
                  'syncFileList': item.syncFileList ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SyncFolder> _syncFolderInsertionAdapter;

  final UpdateAdapter<SyncFolder> _syncFolderUpdateAdapter;

  final DeletionAdapter<SyncFolder> _syncFolderDeletionAdapter;

  @override
  Future<List<SyncFolder>> findAllSyncFolders() async {
    return _queryAdapter.queryList('SELECT * FROM SyncFolder',
        mapper: (Map<String, Object?> row) => SyncFolder(row['id'] as int?,
            row['localPath'] as String, row['remoteId'] as int,
            syncFileList: (row['syncFileList'] as int) != 0));
  }

  @override
  Future<void> insertSyncFolder(SyncFolder folder) async {
    await _syncFolderInsertionAdapter.insert(folder, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSyncFolder(SyncFolder syncFolder) async {
    await _syncFolderUpdateAdapter.update(
        syncFolder, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSyncFolder(SyncFolder syncFolder) async {
    await _syncFolderDeletionAdapter.delete(syncFolder);
  }

  @override
  Future<int> deleteSyncFolders(List<SyncFolder> syncFolders) {
    return _syncFolderDeletionAdapter
        .deleteListAndReturnChangedRows(syncFolders);
  }
}
