//
//  CustomLabelView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 28/11/2023.
//

import SwiftUI

struct CustomTitleView: View {
    @State var title  = ""
    
    var body: some View {
        Text(title)
            .font(.system(size: 36, weight: .bold, design: .default))
            .foregroundColor(.black)
            .padding(.vertical, 8)
    }
}

struct CustomLabelView: View {
    @State var title  = ""
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(.black)
            .padding(.vertical, 8)
    }
}

#Preview {
    CustomTitleView()
}
