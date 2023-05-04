//
//  SubmitButtonView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 03/05/23.
//

import SwiftUI

struct SubmitButtonView: View {
    @Binding var isSubmit : Bool
    @State private var showingSheet = false
    
    var body: some View {
        ZStack(alignment: .leading){
            Capsule()
                .frame(height: 40)
                .foregroundColor(isSubmit ? Color.red : Color.red.opacity(0.3))
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.red, lineWidth: isSubmit ? 3 : 1)
                )
            HStack{
                Text("Next").foregroundColor(isSubmit ? Color.white : Color.red).padding().font(.poppinsRegular)
                Spacer()
                Image(systemName: "arrow.right").foregroundColor(isSubmit ? Color.white : Color.red).padding()
            }
        }.frame(height: 40)
    }
}

struct SubmitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButtonView(isSubmit: .constant(false))
    }
}
