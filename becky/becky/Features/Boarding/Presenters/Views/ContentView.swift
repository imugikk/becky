//
//  ContentView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 28/04/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var name: String = ""
    @State private var placeholder: String = ""
    @State private var offset = CGSize(width: 0, height: -6)
    @State private var opacity = 1.0
    
    @State private var showText = false
    
    @State private var text: String = "" // add this line to declare and initialize `text`
    @State private var finalText: String = "I will assist you in tackling your impulsiveness."
    @State private var opacity1 = 0.0
    @State private var opacity2 = 0.0
    @State private var opacity3 = 0.0


    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    HStack{
                        Image("Becky_Frontpage")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.3)
                            .offset(x: -40, y: 250)
                        
                    }
                    .offset(y:-140)
                    
                    
                    VStack{
                        Image("Hello-3")
                            .padding(.bottom, -5)
                            .offset(x: -2)
                            .opacity(opacity1)
                            .animation(.easeIn(duration: 1)
                                .speed(1)
                                .delay(0)
                                       , value: self.opacity1)
                            .onAppear{
                            opacity1 = 100.0
                            }
                        
                        Image("Hello-2")
                            .padding(.bottom, -5)
                            .offset(x: 0)
                            .opacity(opacity2)
                            .animation(.easeIn(duration: 1)
                                .speed(2)
                                .delay(1)
                                       , value: self.opacity2)
                            .onAppear{
                            opacity2 = 100.0
                            }
                        Image("Hello-1")
                            .padding(.bottom, 2)
                            .offset(x: -1)
                            .opacity(opacity3)
                            .animation(.easeIn(duration: 1)
                                .speed(3)
                                .delay(2)
                                       , value: self.opacity3)
                            .onAppear{
                            opacity3 = 100.0
                            }
                        
//                        Image("hello")
                    }
                    .offset(x:-130, y:100)
                    HStack{
                        if showText{
                            Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge)
                            //                                        .foregroundColor(Color.red)
                                .foregroundColor(isDarkMode ? .red : .red)
                                .padding(.bottom,1).frame(height: 15)
                                .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 1.3)))
                        } else {
                            Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge)
                                .foregroundColor(isDarkMode ? .black : .white) // update foreground color
                            //                                        .foregroundColor(Color.white)
                                .padding(.bottom,1).frame(height: 15)
                        }
                    }
                    .offset(x:-35, y:100)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation{
                                self.showText = true
                            }
                        }
                    }
                    
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
                                .cornerRadius(100)
                        })
                    }
                    .padding()
                    .preferredColorScheme(isDarkMode ? .dark : .light) // set preferredColorScheme
                    .offset(x:170, y:-375)
                    
//                    Spacer()
                    
                    
                    //                    ZStack (alignment: .leading){
                    //                        VStack{
                    ////                            VStack (alignment: .leading){
                    ////
                    ////                                Image("hello")
                    ////
                    ////                                VStack{
                    ////                                    if showText{
                    ////                                        Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge)
                    ////    //                                        .foregroundColor(Color.red)
                    ////                                            .foregroundColor(isDarkMode ? .red : .red)
                    ////                                            .padding(.bottom,1).frame(height: 15)
                    ////                                            .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 1.3)))
                    ////                                    } else {
                    ////                                        Text("Hello, I'm \(Text("Becky").font(.poppinsItalicLarge).underline())!").font(.poppinsSemiBoldLarge)
                    ////                                            .foregroundColor(isDarkMode ? .black : .white) // update foreground color
                    ////    //                                        .foregroundColor(Color.white)
                    ////                                            .padding(.bottom,1).frame(height: 15)
                    ////                                    }
                    ////                                }.onAppear{
                    ////                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    ////                                        withAnimation{
                    ////                                            self.showText = true
                    ////                                        }
                    ////                                    }
                    ////                                }
                    ////                            }
                    //                        }
                    //
                    ////                        Rectangle()
                    ////                            .fill(isDarkMode ? Color.black : Color.white)
                    ////                            .frame(width: 100, height: 130)
                    ////                            .offset(offset)
                    ////                            .animation(Animation.easeInOut(duration: 2))
                    ////                            .opacity(opacity)
                    //                    }
                    //                    .onAppear {
                    //                        offset = CGSize(width: 0, height: 120)}
                    
                    HStack{
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
                    }.offset(x:-18, y: 20)
                        .padding()
                        .frame(width: 350, height: 200, alignment: .leading)
                    
                    HStack {
                        Text("*****").font(.poppinsLightLarge).fontWeight(.light).foregroundColor(Color.red)
                            .offset(x:-133, y:-25)
                    }
                    
                    HStack{
                        ZStack(alignment: .leading) {
                            if name.isEmpty {
                                Text("What's your name?") .foregroundColor(Color.red.opacity(0.75)).font(.poppinsRegular)
                                
                            }
                            
                            TextField("", text: $name)
                                .foregroundColor(Color.red)
                                .font(.poppinsRegular)
                        }.padding(.horizontal, 15) .padding(.vertical, 8).overlay( RoundedRectangle(cornerRadius: 70).stroke(Color.red, lineWidth: 1) )
                        
                        if name.isEmpty { Button(action: {
                            
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
                                NavigationLink (destination: BeckyView(nama: name).navigationBarBackButtonHidden(true)){
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
                    .offset(y:-30)
                        .padding()
                    
                    
                }
            }
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
