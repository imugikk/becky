//
//  ContentView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 28/04/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State var name: String = ""
    @State private var placeholder: String = ""
    @State private var offset = CGSize(width: 0, height: -6)
    @State private var opacity = 1.0
    
    @State private var showText = false
    
    @State private var text: String = "" // add this line to declare and initialize `text`
    @State private var finalText: String = "I will assist you in tackling your impulsiveness."

    @Environment(\.managedObjectContext) var masterMoc
    @State private var showNextView = false
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    HStack{
                        Image("Becky_Frontpage")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.3)
                            .offset(x: -75, y: 250)
                        
                    }
                    .offset(y:-140)
                    
                    
                    VStack{
                        Image("Hello-3")
                            .padding(.bottom, -5)
                            .offset(x: -2)
                        Image("Hello-2")
                            .padding(.bottom, -5)
                            .offset(x: 0)
                        Image("Hello-1")
                            .padding(.bottom, 2)
                            .offset(x: -1)
                        
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
                                .background(.red.opacity(0.4))
                                .cornerRadius(100)
                        })
                    }
                    .padding()
                    .preferredColorScheme(isDarkMode ? .dark : .light) // set preferredColorScheme
                    .offset(x:150, y:-300)
                    
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
                                print("test")
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
                            VStack{
                                Button(action: {
                                    print(name)
                                    saveData()
                                    showNextView.toggle()
                                }, label: {
                                        Image(systemName: "arrow.right").padding(.vertical, 7).padding(.horizontal, 8)
                                            .frame(width:50, height:33)
                                            .scaleEffect(1.2)
                                    })
                                    .padding(7)
                                    .background(.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                
                                NavigationLink (destination: BeckyView(nama: name).navigationBarBackButtonHidden(), isActive: $showNextView) {
                                    EmptyView()
                                }
                            }
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
    
    func saveData() {
        let master = Master(context: masterMoc)
        master.id = UUID()
        master.name = "\(name)"
        print("masuk")
        
        do {
            try masterMoc.save()
            if masterMoc.hasChanges {
                print("Data was successfully saved to Core Data.")
            } else {
                print("No changes were made to the Core Data store.")
            }
        } catch let error {
            print("Error saving data: \(error.localizedDescription)")
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
