SELECT Recipes.RecipeTitle, 
  COUNT(RI.RecipeID) AS IngredCount
FROM (Recipe_Classes 
  INNER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID) 
  LEFT OUTER JOIN
     (SELECT Recipe_Ingredients.RecipeID
      FROM (Recipe_Ingredients
        INNER JOIN Ingredients
          ON Recipe_Ingredients.IngredientID = 
      Ingredients.IngredientID) 
        INNER JOIN Ingredient_Classes 
          ON Ingredients.IngredientClassID = 
         Ingredient_Classes.IngredientClassID) AS RI
    ON Recipes.RecipeID = RI.RecipeID 
WHERE Recipe_Classes.RecipeClassDescription = 'Main Course' 
  AND RI.IngredientClassDescription = 'Spice'
GROUP BY Recipes.RecipeTitle
HAVING COUNT(RI.RecipeID) < 3;
