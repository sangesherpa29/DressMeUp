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
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(titleColor)
                    .bold()
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    CustomButtonView(title: "Label",
                     titleColor: .white,
                     background: .black) {
        
    }
}
