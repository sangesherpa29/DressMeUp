//
//  OutfitView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 28/11/2023.
//

import SwiftUI

struct OutfitView: View {
    let images = ["img1", "img2", "img3", "img4"]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),
                                    GridItem(.flexible(), spacing: 10)],
                          spacing: 5) {
                    ForEach(images, id: \.self) { imageName in
                        
                        NavigationLink(destination: SingleItemView(imageName: imageName, image: Image(imageName))) {
                            VStack(alignment: .leading) {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (UIScreen.main.bounds.width - 48)/2, height: 220)
                                    .cornerRadius(5)
                                    .clipped()
                                
                                CustomLabelView(title: imageName)
                            }
                            .padding(.top, 10)
                        }
                    }
                }.padding(10)
            }
            .navigationTitle("Outfits")
            .padding(.top, 10)
        }
        
    }
}

#Preview {
    OutfitView()
}
