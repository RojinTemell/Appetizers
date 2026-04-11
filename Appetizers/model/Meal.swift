//
//  Meal.swift
//  Appetizers
//
//  Created by rojin on 10.04.2026.
//

import Foundation

struct MealsRespponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String
    var id: String {
        return idMeal
    }
}
struct MealMockData {
    static let sampleMeal = Meal(idMeal: "53238",
                                 strMeal: "Beef",
                                 strArea: "Vietnamese",
                                 strInstructions: "step 1\r\nTip the beef stock along with 500ml of water into a large saucepan. Sit the onion and ginger in a frying pan over a high heat and char on all sides, around 3-5 mins (you can also do this under your grill). Once charred, add to the beef stock. In the same pan, toast the spices for 2-3 mins and once they begin to smell fragrant, add them to the beef stock as well. Bring the stock to the boil, then turn to a simmer and cook for 30mins before straining.\r\n\r\nstep 2\r\nMeanwhile, cut the fat from the steak and wrap in cling film, then put into the freezer for 15 mins – this will make your steak really easy to slice! Slice it thinly, then cover with cling film again and pop into the fridge.\r\n\r\nstep 3\r\nTaste the beef stock and use the palm sugar, fish sauce and soy to season. Cook the noodles according to package instructions and split between two bowls, topping each with the sliced beef. Bring the stock to the boil and then pour into the bowls (the heat will cook the beef). Top each with the spring onions, chilli slices and herbs. Serve with the lime wedges to squeeze over.",
                                 strMealThumb: "https://www.themealdb.com/images/media/meals/pbzcrx1763765096.jpg",
                                 strYoutube: "https://www.youtube.com/watch?v=WlosNFMCnE4")
    static let meals       = [sampleMeal, sampleMeal, sampleMeal, sampleMeal]
}

