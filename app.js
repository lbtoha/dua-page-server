const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('dua_main.sqlite', (err) => {
  if (err) {
    console.error('Error opening database', err);
    return;
  }

  // Get schema for category table
  db.all("PRAGMA table_info(category)", [], (err, categorySchema) => {
    console.log("\nCategory Table Schema:", categorySchema);
  });

  // Get schema for sub_category table
  db.all("PRAGMA table_info(sub_category)", [], (err, subCategorySchema) => {
    console.log("\nSub Category Table Schema:", subCategorySchema);
  });

  // Get schema for dua table
  db.all("PRAGMA table_info(dua)", [], (err, duaSchema) => {
    console.log("\nDua Table Schema:", duaSchema);
  });
});