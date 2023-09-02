import mysql from "mysql";
import fs from "fs";

// server config
const connection = mysql.createConnection({
  host: "127.0.0.1",
  user: "hyfuser",
  password: "Hyfpassword@44",
  multipleStatements: true,
});

// server connection
connection.connect((err) => {
  if (err) {
    console.log(`connection error: ${err.stack}`);
  }

  console.log(`connected successfully!`);

  const sqlFile = "hack-your-kitchen.sql";
  const dbName = "hackYourKitchen";

  // read the SQL file
  fs.readFile(sqlFile, "utf8", (err, data) => {
    if (err) {
      console.error(`Error reading the ${sqlFile}:`, err.message);
      return;
    }

    // execute the sql file
    connection.query(data, (err, result) => {
      if (err) {
        console.log(`Error run the ${sqlFile}: ${err.stack}`);
        return;
      }

      console.log(`the db created successfully!: ${dbName}`);

      // use the db
      connection.query(`USE ${dbName}`, (err) => {
        if (err) {
          console.log(`Error, can not use ${dbName}`, err.stack);
        }
        console.log(`successfully using: ${dbName}`);

        // Queries
        connection.query(`SHOW TABLES FROM ${dbName}`, (err, result) => {
          if (err) throw err;

          console.log(result);
        });

        // All the vegetarian recipes with potatoes
        connection.query(
          `
            SELECT Recipes.RecipeName
            FROM Recipes
            JOIN RecipeCategories ON Recipes.RecipeID = RecipeCategories.RecipeID
            JOIN Categories ON RecipeCategories.CategoryID = Categories.CategoryID
            JOIN RecipeIngredients ON Recipes.RecipeID = RecipeIngredients.RecipeID
            JOIN Ingredients ON RecipeIngredients.IngredientID = Ingredients.IngredientID
            WHERE Categories.CategoryName = 'Vegetarian' AND Ingredients.IngredientName = 'Potatoes';
          `,
          (err, result) => {
            if (err) throw err;
            console.log("Vegetarian recipes with potatoes:", result);
          }
        );

        // All the cakes that do not need baking
        connection.query(
          `
            SELECT Recipes.RecipeName
            FROM Recipes
            JOIN RecipeCategories ON Recipes.RecipeID = RecipeCategories.RecipeID
            JOIN Categories ON RecipeCategories.CategoryID = Categories.CategoryID
            WHERE Categories.CategoryName = 'Cake' AND Categories.CategoryName != 'No-Bake';
          `,
          (err, result) => {
            if (err) throw err;
            console.log("Cakes that do not need baking:", result);
          }
        );

        // All the vegan and Japanese recipes
        connection.query(
          `
            SELECT Recipes.RecipeName
            FROM Recipes
            JOIN RecipeCategories ON Recipes.RecipeID = RecipeCategories.RecipeID
            JOIN Categories ON RecipeCategories.CategoryID = Categories.CategoryID
            WHERE Categories.CategoryName = 'Vegan' OR Categories.CategoryName = 'Japanese';
          `,
          (err, result) => {
            if (err) throw err;
            console.log("Vegan and Japanese recipes:", result);
          }
        );

        //Disconnecting from the server
        connection.end((err) => {
          if (err) {
            console.log(`Error while disconnecting: ${err.stack}`);
          }
          console.log(`Disconnected Successfully!`);
        });
      });
    });
  });
});
