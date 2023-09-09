# Prep exercise week 4

## What are the collections?

* Collections

  * Recipes
  * Categories
  * Ingredients
  * Steps

## What information will you embed in a document and which will you store normalized?

I have used Embedded documents for handling one-to-one and one-to-many relations in mongoDB 
and Normalized documents for handle many-to-many relations.  

### Recipes Collection

```
{
  "_id",
  "RecipeName": "Pasta",
  "Ingredients": [
    {
      "IngredientName": "Salt"
    },
    {
      "IngredientName": "Pasta"
    }
  ],
  "Steps": [
    {
      "StepDescription": "Boil water",
      "StepOrder": 1
    },
    {
      "StepDescription": "Add pasta",
      "StepOrder": 2
    }
  ],
  "Categories": [ObjectId("_id"), ObjectId("_id")]
}

```