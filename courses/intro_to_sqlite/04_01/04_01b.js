const db = openDatabase('test', '1.0', 'Test DB', 1048576);

db.transaction(function (t) {
  t.executeSql("CREATE TABLE Player (Name TEXT, Id INTEGER)", []); 
});

function addPlayer(db, name, id) {
  db.transaction(function (t) {
    t.executeSql("INSERT INTO Player VALUES(?, ?)", [name, id]);
  });    
}

addPlayer(db, "Eric Seablade", 100);

addPlayer(db, "Mauve d'Orm-mul", 200);

addPlayer(db, "Forestall Grimm", 300);

db.readTransaction(function (t) {
  t.executeSql("SELECT * FROM Player", [], function (t, result) {
    for (const row of result.rows) {
      console.log(`${row.Name}: ${row.Id}`);
    }
  });
});