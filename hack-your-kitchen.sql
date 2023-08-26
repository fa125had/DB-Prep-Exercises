/*
 Entities:
 Recipes
 Categories
 Ingredients
 Steps
 
 Attributes:
 Recipes: RecipeID, RecipeName
 Categories: CategoryID, CategoryName
 Ingredients: IngredientID, IngredientName
 Steps: StepID, StepDescription
 
 Relations:
 Recipe to Category: Many-to-many via RecipeCategories
 Recipe to Ingredient: Many-to-many via RecipeIngredients
 Recipe to Step: Many-to-many via RecipeSteps
 
 */

--  Creating DATABASE
DROP DATABASE IF EXISTS `hackYourKitchen`;

CREATE DATABASE `hackYourKitchen`;

USE hackYourKitchen;

--  Creating Tables
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

-- Recipes
INSERT INTO
  Recipes (RecipeName)
VALUES
  ('Cheesecake'),
  ('Mac and Cheese'),
  ('Japanese Omelette');

-- Bridge Tables Data Insertion
-- RecipeCategories
INSERT INTO
  RecipeCategories (RecipeID, CategoryID)
VALUES
  -- Cheesecake
  (1, 1),
  -- Gluten-Free
  (2, 5),
  -- Japanese
  (3, 6);

-- RecipeIngredients
INSERT INTO
  RecipeIngredients (RecipeID, IngredientID)
VALUES
  -- Condensed milk
  (1, 1),
  -- Cream Cheese
  (1, 2),
  -- Olive oil
  (2, 10),
  -- Macaroni
  (2, 11),
  -- Eggs
  (3, 17),
  -- Soy sauce
  (3, 18);

-- RecipeSteps
INSERT INTO
  RecipeSteps (RecipeID, StepID, StepOrder)
VALUES
  -- Cheesecake Step 1
  (1, 1, 1),
  -- Cheesecake Step 2
  (1, 2, 2),
  -- Mac and Cheese Step 1
  (2, 3, 1),
  -- Mac and Cheese Step 2
  (2, 4, 2),
  -- Japanese Omelette Step 1
  (3, 7, 1),
  -- Japanese Omelette Step 2
  (3, 8, 2);