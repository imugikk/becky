//
//  ContentView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 28/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var placeholder: String = ""
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Spacer()
                Image("hello")
                Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(.bottom,1).frame(height: 15)
                Text("I will assist you in tackling your impulsiveness.").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(0.0)
                Text("*****").font(.poppinsLightLarge).fontWeight(.light).foregroundColor(Color.red)
                
                HStack{
                    ZStack(alignment: .leading) {
                        if name.isEmpty {
                            Text("What's Your Name") .foregroundColor(Color.red.opacity(0.4)).font(.poppinsRegular)
                        
                        }
                        
                        TextField("", text: $name).foregroundColor(Color.red).font(.poppinsRegular)
                    }.padding(.horizontal, 15) .padding(.vertical, 8).overlay( RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 1) )
                    
                    if name.isEmpty { Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.right").padding(.vertical, 7).padding(.horizontal, 8)
                    }
                    .padding(7)
                    .background(.red.opacity(0.4))
                    .foregroundColor(.red)
                        .cornerRadius(100)
                    } else {
                        Button{

                        } label: {
                            NavigationLink (destination: BeckyView(nama: name).navigationBarBackButtonHidden(true)){
                                Image(systemName: "arrow.right").padding(.vertical, 7).padding(.horizontal, 8)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
