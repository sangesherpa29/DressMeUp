//
//  HeaderView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 25/11/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let textColor: Color
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: -15))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(textColor)
                    .bold()
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
    }
}

#Preview {
    HeaderView(title: "Dress Me Up",
               textColor: .white,
               background: .pink)
}
