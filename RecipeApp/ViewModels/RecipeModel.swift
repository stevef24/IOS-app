//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Stav Fernandes on 12/06/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init () {
            
        //set our recipes to the return of the function in the file above
        
        self.recipes = DataService.getLocalData()
        
    }
    
}
