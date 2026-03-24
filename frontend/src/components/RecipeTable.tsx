import { useEffect, useState } from "react";
import RecipeCard from "./RecipeCard";

export interface Recipe {
  recipe_id: number;
  recipe_name: string;
  cat_id: number;
  cat_name: string;
  img_source: string;
  description: string;

}

function RecipeTable() {
  const allRecipes = "http://127.0.0.1:8000/api/all-recipes";
  const [recipes, setRecipes] = useState<Recipe[]>([]);

  useEffect(() => {
    fetch(allRecipes)
      .then((res) => res.json())

      .then((data) => {
        console.log("API válasz:", data);
        setRecipes(data);
      });
  }, []);
  console.log(recipes);

  const handleRecept = (id: number) => {
    console.log(id);
  };

  return (
    <>
      <table border={1} cellPadding={5}>
        <thead>
          <tr>
            <th>Recept neve</th>
            <th>Kategória</th>
          </tr>
        </thead>
        <tbody>
          {recipes.map((recipe, id) => (
            <tr key={id}>
              <td onClick={() => handleRecept(recipe.recipe_id)}>{recipe.recipe_name}</td>
              <td>{recipe.cat_name}</td>
            </tr>
          ))}
        </tbody>
      </table>
      <div className="card">
        <RecipeCard />
      </div>
    </>
  );
}

export default RecipeTable;
