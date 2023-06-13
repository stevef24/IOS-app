//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Stav Fernandes on 13/06/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill().frame(width: 400, height: 200)
                    .clipped()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom, 5)
              
              
                ForEach(recipe.ingredients) {item in
                    Text(item.name)
                    
                    }
                }.padding(.horizontal)
                
                //MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline)
                        .padding([.bottom, .top],5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                        
                    }
                }.padding(.horizontal)
                
            }.padding(.horizontal, 10)
            
        }.navigationBarTitle(recipe.name)
   
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //Create a dummy recipe and pass it into the
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
