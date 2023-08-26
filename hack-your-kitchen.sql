/*
 ERD --- https://dbdiagram.io/d/64e9d05702bd1c4a5e71c2cb

 ERD --- lucid.app / lucidchart / 6f79f5e6 - 03fe -4763 - a58c - 64295a2aebaf / edit ? invitationId = inv_23837bd3 - 9ea0 - 4b6a - b141 - d6d4cc0e8dd7 & page = 0_0 #

 ERD --- https://drive.google.com/file/d/1cP38EVn9fP1KleK2gqgyw3ADLcqzPNs7/view?usp=sharing

 Entities:
 Recipe
 Category
 Ingredient
 Step
 
 Attributes:
 Recipe: RecipeID, RecipeName
 Category: CategoryID, CategoryName
 Ingredient: IngredientID, IngredientName
 Step: StepID, StepDescription
 
 Relationships:
 Recipe to Category: Many-to-many via RecipeCategories
 Recipe to Ingredient: Many-to-many via RecipeIngredients
 Recipe to Step: Many-to-many via RecipeSteps
 
 */
--  Creating DATABASE
DROP DATABASE IF EXISTS `hackYourKitchen`;

CREATE DATABASE `hackYourKitchen`;

USE hackYourKitchen;

--  Creating Main Tables
CREATE TABLE Recipes (
  RecipeID INT PRIMARY KEY AUTO_INCREMENT,
  RecipeName VARCHAR(50) NOT NULL
);

CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY AUTO_INCREMENT,
  CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Ingredients (
  IngredientID INT PRIMARY KEY AUTO_INCREMENT,
  IngredientName VARCHAR(100) NOT NULL
);

CREATE TABLE Steps (
  StepID INT PRIMARY KEY AUTO_INCREMENT,
  StepDescription TEXT NOT NULL
);

-- Creating Junction Tables
CREATE TABLE RecipeCategories (
  RecipeID INT,
  CategoryID INT,
  FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
  FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
  PRIMARY KEY (RecipeID, CategoryID)
);

CREATE TABLE RecipeIngredients (
  RecipeID INT,
  IngredientID INT,
  FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
  FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID),
  PRIMARY KEY (RecipeID, IngredientID)
);

CREATE TABLE RecipeSteps (
  RecipeID INT,
  StepID INT,
  StepOrder INT NOT NULL,
  FOREIGN KEY (RecipeID) REFERENCES Recipes(RecipeID),
  FOREIGN KEY (StepID) REFERENCES Steps(StepID),
  PRIMARY KEY (RecipeID, StepID)
);

-- Data Insertion
-- Categories
INSERT INTO
  Categories (CategoryName)
VALUES
  ('Cake'),
  ('No-Bake'),
  ('Vegetarian'),
  ('Vegan'),
  ('Gluten-Free'),
  ('Japanese');

-- Ingredients
INSERT INTO
  Ingredients (IngredientName)
VALUES
  ('Condensed milk'),
  ('Cream Cheese'),
  ('Lemon Juice'),
  ('Pie Crust'),
  ('Cherry Jam'),
  ('Brussels Sprouts'),
  ('Sesame seeds'),
  ('Pepper'),
  ('Salt'),
  ('Olive oil'),
  ('Macaroni'),
  ('Butter'),
  ('Flour'),
  ('Milk'),
  ('Shredded Cheddar cheese'),
  ('Eggs'),
  ('Soy sauce'),
  ('Sugar');

-- Steps
INSERT INTO
  Steps (StepDescription)
VALUES
  ("Cook Macaroni for 8'"),
  ('Melt butter in a saucepan'),
  ('Add flour, salt, pepper and mix'),
  ('Add Milk and mix'),
  ('Cook until mix is smooth'),
  ('Add cheddar cheese'),
  ('Add the macaroni'),
  ('Beat the eggs'),
  ('Add soya sauce, sugar and salt'),
  ('Add oil to a sauce pan'),
  ('Bring to medium heat'),
  ('Add some mix to the sauce pan'),
  ("Let is cook for 1'"),
  ('Add oil to a sauce pan'),
  ('Add some mix to the sauce pan'),
  ("Let is cook for 1'"),
  ('Remove pan from fire');