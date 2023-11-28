//
//  SingleItemView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 28/11/2023.
//

import SwiftUI

struct SingleItemView: View {
    let imageName: String
    let image: Image
    
    var body: some View {
        VStack(alignment: .leading) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width-20, maxHeight: 500)
                .cornerRadius(5)
                .shadow(radius: 5)
            
            CustomLabelView(title: "imagename")
                .padding(.vertical, 10)
            
            Button(action: {
                // Add your action for "Show Combinations" button here
                print("Show Combinations Pressed")
            }) {
                Text("Show Combinations")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .padding()
    }
}


#Preview {
    SingleItemView(imageName: "Image", image: Image("img1"))
}
