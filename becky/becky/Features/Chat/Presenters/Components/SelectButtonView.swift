//
//  SelectButtonView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 03/05/23.
//

import SwiftUI

struct SelectButtonView: View {
    @Binding var isSelected: Bool
    @State var text: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Capsule()
                .frame(height: 40)
                .foregroundColor(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.red, lineWidth: isSelected ? 3 : 1)
                )
            Text(text).foregroundColor(Color.red).padding().font(isSelected ? .poppinsSemiBold : .poppinsRegular)
        }.frame(height: 40)
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        SelectButtonView(isSelected: .constant(false), text: "Option")
    }
}
