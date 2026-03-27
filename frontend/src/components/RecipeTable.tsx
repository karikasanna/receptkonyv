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
  const mainUrl = "http://127.0.0.1:8000/api/";
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [recipeId, setRecipeId] = useState("");
  const singleRecipe = `http://127.0.0.1:8000/api/recipes/${recipeId}`;
  const [recipe, setRecipe] = useState<Recipe | null>(null);
  const [endpoint, setEndpoint] = useState("recipes");

  useEffect(() => {
    fetch(mainUrl + endpoint)
      .then((res) => res.json())
      .then((data) => {
        setRecipes(data);
      });
  }, [endpoint]);

  useEffect(() => {
    if (!recipeId) return;
    fetch(singleRecipe)
      .then((res) => res.json())

      .then((data) => {
        setRecipe(data[0]);
      });
  }, [recipeId]);

  return (
    <div>
      <h1>Receptkönyv</h1>
      <div className="dropdown">
        <label>Válassz kategóriát: </label>

        <select
          onChange={(e) => setEndpoint(`recipes/category/${e.target.value}`)}
        >
          <option value="">Összes</option>
          <option value="1">Főétel</option>
          <option value="2">Leves</option>
          <option value="3">Desszert</option>
          <option value="4">Saláta</option>
        </select>
      </div>
      <div className="recipeTable">
        <table border={1} cellPadding={10} width={500}>
          <thead>
            <tr>
              <th>Recept neve</th>
              <th>Kategória</th>
            </tr>
          </thead>
          <tbody>
            {recipes.map((recipe, index) => (
              <tr key={index}>
                <td
                  onClick={() => {
                    setRecipeId(recipe.recipe_id.toString());
                  }}
                >
                  {recipe.recipe_name}
                </td>
                <td>{recipe.cat_name}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <div className="recipeCard">
        <h1>{recipe?.recipe_name}</h1>
        <p>{recipe?.description}</p>
        <img src={recipe?.img_source} alt={recipe?.recipe_name} width={500}/>
      </div>
    </div>
  );
}

export default RecipeTable;
