//
//  BeckyView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 02/05/23.
//

import SwiftUI

struct BeckyView: View {
    @State private var product: String = ""
    @State private var placeholder: String = ""
    
    let nama: String
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Image("Becky_Frontpage")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.6)
                    .offset(x: -80, y: 120)
                
                Image("hello")
                    .offset(x:-0.5, y: 18)
                
                Spacer()
                Text("Hello, \(Text(nama).font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(.bottom,1)
                Text("Shall we assess your shopping cart?").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(0.0)
                    ._lineHeightMultiple(0.85)
                Text("*****").font(.poppinsLightLarge).fontWeight(.light).foregroundColor(Color.red)
                
                HStack{
                    ZStack(alignment: .leading) {
                        if product.isEmpty {
                            Text("Insert product name here..") .foregroundColor(Color.red.opacity(0.75)).font(.poppinsRegular)
                        
                        }
                        
                        TextField("", text: $product).foregroundColor(Color.red).font(.poppinsRegular)
                    }.padding(.horizontal, 15) .padding(.vertical, 8).overlay( RoundedRectangle(cornerRadius: 70).stroke(Color.red, lineWidth: 1) )
                    
                    if product.isEmpty { Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.right").padding(.vertical, 7).padding(.horizontal, 8)
                            .frame(width:50, height:33)
                            .scaleEffect(1.2)
                    }
                    .padding(7)
                    .background(.red.opacity(0.4))
                    .foregroundColor(.red)
                        .cornerRadius(100)
                    } else {
                        Button{

                        } label: {
                            NavigationLink (destination: ChatView(product: product).navigationBarBackButtonHidden(true)){
                                Image(systemName: "arrow.right").padding(.vertical, 7).padding(.horizontal, 8)
                                    .frame(width:50, height:33)
                                    .scaleEffect(1.2)
                            }
                        }
                        .padding(7)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                    }
                }
            }
            .padding()
        }
    }
}

struct BeckyView_Previews: PreviewProvider {
    static var previews: some View {
        BeckyView(nama: "")
    }
}
