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
    @State private var offset = CGSize(width: 0, height: -6)
    @State private var opacity = 1.0
    
    @State private var showText = false
    
    @State private var text: String = "" // add this line to declare and initialize `text`
    @State private var finalText: String = "I will assist you in tackling your impulsiveness."


    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Spacer()
                ZStack (alignment: .leading){
                    VStack{
                        VStack (alignment: .leading){
                            
                            Image("hello")
                            
                            VStack{
                                if showText{
                                    Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge).foregroundColor(Color.red).padding(.bottom,1).frame(height: 15)
                                        .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 1.3)))
                                } else {
                                    Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge).foregroundColor(Color.white).padding(.bottom,1).frame(height: 15)
                                }
                            }.onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation{
                                        self.showText = true
                                    }
                                }
                            }
                        }
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 100, height: 130)
                        .offset(offset)
                        .animation(Animation.easeInOut(duration: 2))
                        .opacity(opacity)
                }
                .onAppear {
                    offset = CGSize(width: 0, height: 120)}
                
                VStack{
                    if showText {
                        Text(text)
                            .font(.poppinsSemiBoldLarge)
                            .foregroundColor(Color.red)
                            ._lineHeightMultiple(0.85)
                            .padding(0.0)
                            .onAppear {
                                if finalText == "I will assist you in tackling your impulsiveness." {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        typeWriter()
                                                    }
                                                } else {
                                                    typeWriter()
                                                }
                            }
                    } else {
                        Text(text)
                            .font(.poppinsSemiBoldLarge)
                            .foregroundColor(Color.white)
                            .padding(0.0)
                    }
                }
            
                Text("*****").font(.poppinsLightLarge).fontWeight(.light).foregroundColor(Color.red)
                
                HStack{
                    ZStack(alignment: .leading) {
                        if name.isEmpty {
                            Text("What's Your Name") .foregroundColor(Color.red.opacity(0.75)).font(.poppinsRegular)
                        
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(Color.red)
                            .font(.poppinsRegular)
                    }.padding(.horizontal, 15) .padding(.vertical, 8).overlay( RoundedRectangle(cornerRadius: 17).stroke(Color.red, lineWidth: 1) )
                    
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
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
