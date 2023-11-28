//
//  CustomButton.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct CustomButtonView: View {
    let title: String
    let titleColor: Color
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }) {
            Text(title)
                .foregroundColor(titleColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(background)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding(.vertical, 10)
        
    }
}

#Preview {
    CustomButtonView(title: "Label",
                     titleColor: .white,
                     background: .blue) {
        
    }
}
