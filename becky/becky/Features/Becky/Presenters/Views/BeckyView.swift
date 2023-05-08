//
//  BeckyView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 02/05/23.
//

import SwiftUI

struct BeckyView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var product: String = ""
    @State private var placeholder: String = ""
    @State private var OpacityBecky1 = 0.0
    @State private var OpacityBecky2 = 0.0
    @State private var OpacityBecky3 = 0.0
    
    
    let nama: String
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                HStack{
                    Button(action: {
                    
                    }, label: {
                        NavigationLink(destination: HistoryView()){
                            Image(systemName: isDarkMode ? "clock.arrow.circlepath" :  "clock.arrow.circlepath")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                        }
                    }) .offset(x:-12)
                    
                    Button(action: {
                        // TOGGLE APPEARANCE
                        isDarkMode.toggle()
                    }, label: {
                        Image(systemName: isDarkMode ? "circle.righthalf.filled" :  "circle.lefthalf.filled")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .font(.system(.title, design: .rounded))
//                            .background(.red.opacity(0.4))
                            .cornerRadius(100)
                    })
                }
                .offset(x:320)
                .padding()
                .preferredColorScheme(isDarkMode ? .dark : .light) // set preferredColorScheme

                
                Image("Becky_Frontpage")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .offset(x: -70, y: 90)
                
                VStack{
                    Image("Hello-3")
                        .padding(.bottom, -5)
                        .offset(x: -1)
                        .opacity(OpacityBecky1)
                        .animation(.easeIn(duration: 1)
                            .speed(1)
                            .delay(0)
                                   , value: self.OpacityBecky1)
                        .onAppear{
                        OpacityBecky1 = 100.0
                        }
                    Image("Hello-2")
                        .padding(.bottom, -5)
                        .offset(x: 1)
                        .opacity(OpacityBecky2)
                        .animation(.easeIn(duration: 1)
                            .speed(2)
                            .delay(1)
                                   , value: self.OpacityBecky2)
                        .onAppear{
                        OpacityBecky2 = 100.0
                        }
                    
                    Image("Hello-1")
                        .padding(.bottom, 2)
                        .offset(x: 0)
                        .opacity(OpacityBecky3)
                        .animation(.easeIn(duration: 1)
                            .speed(3)
                            .delay(2)
                                   , value: self.OpacityBecky3)
                        .onAppear{
                        OpacityBecky3 = 100.0
                        }
                }
                .offset(x:0, y:18)
                
//                Image("hello")
//                    .offset(x:-0.5, y: 18)
                
                Spacer()
                Text("Hello, \(Text(nama).font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(.bottom,1)
                Text("Tell me what you want to buy").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(0.0)
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
        BeckyView(nama: "Ugik")
    }
}
