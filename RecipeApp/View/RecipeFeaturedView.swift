//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Stav Fernandes on 14/06/2023.
//

import SwiftUI


struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel

    var body: some View {
        
        VStack (alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .padding(.leading)
                .font(.largeTitle)
                .bold()
            
            GeometryReader {geo in
                
            TabView {
                
                ForEach (0..<model.recipes.count) {index in
                    
                    if model.recipes[index].featured {
                        
                        ZStack {
                            Rectangle().foregroundColor(.white)
                            
                            VStack(spacing: 0) {
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .clipped()
                                Text(model.recipes[index].name)
                                    .padding(5)
                            }.padding(.bottom)
                        }.frame(width: geo.size.width - 40, height:geo.size.height - 100, alignment: .center).cornerRadius(30)
                            .shadow(color: .black, radius:10 ,x:-5, y:5)
                    }
                   
                }
               
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("HighLights:")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
