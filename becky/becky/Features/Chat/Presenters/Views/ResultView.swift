//
//  ResultView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 03/05/23.
//

import SwiftUI

struct ResultView: View {
    @State var score : String

    let recomendations : [String] = ["Do something else, if you are feeling anxious, stressed, or sad, and you find yourself shopping. Stop and do something else. Go for a walk, listen to music, or call a friend", "Wait a day! If tomorrow you still feel like really need it, maybe you do. If you don’t feel like it, you have control your impulsive behavior", "Share with a friend your wishlist. Your friend input will allow your brain to reconsider your decision and stop you being impulsive", "Pause and wait before you buy anything. To slow down your purchasing and give your brain time to process what you’re doing, why you’re doing it and whether you have a really good reason to be doing it, take a pause", "Do you have something similar? If you do, forget about buying another one. It just a waste of money", "Think about what you’ll do with the item when you’ve bought it. Do you really need that extra piece of handbags? Take a breather and look around you, do you still need another one?", "Don’t go shopping when you are feeling emotional. When you’re feeling up or down  and particularly drawn to reckless purchasing, think about exactly what you’re feeling and what triggered it", "Set a budget before you shop! You could set a budget for each area of your spending as it helps you understand that shopping and spending doesn’t have to be all or nothing", "Make it difficult to spend your money! Limit your daily or completely get rid of credit cards. Don’t even use mobile banking, you have to walk to the convenience store to shop online.", "It’s difficult to buy something on a whim when you’re not near a shop to make that purchase. So, if you’re feeling like you want to spend your money don’t go near online shopping app."]
    
    let beckyBuy : [String] = ["Buy-1", "Buy-2", "Buy-5", "Buy-6", "Buy-12", "Buy-13", "Buy-14", "Buy-16", "Buy-17"]
    let beckyBye : [String] = ["Bye-3", "Bye-4", "Bye-7", "Bye-8", "Bye-9", "Bye-10", "Bye-11", "Bye-15", "Bye-18"]
    
    var body: some View {
        NavigationView{
            Color.gray.opacity(0.5).ignoresSafeArea().overlay{
                ZStack{
                    if score == "bye" {
                        Rectangle().cornerRadius(13).foregroundColor(.accentColor).ignoresSafeArea().padding(.top, 10)
                        
                        VStack{
                            Text("*****").font(.poppinsLightLarge).foregroundColor(Color.white).padding(.top, 30)
                            Text("Bye").font(.poppinsSemiBoldLarge).foregroundColor(Color.white)
                            Image(beckyBye.randomElement()!).resizable().frame(width: 200.0, height: 200.0).padding()
                            Text("\(recomendations.randomElement()!)").padding().font(.poppinsRegular).foregroundColor(Color.white)
                                ._lineHeightMultiple(0.85)
                            
                            VStack{
                                Button(){
                                    
                                } label: {
                                    HStack{
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Share your result")
                                    }
                                    .frame(maxWidth: .infinity).foregroundColor(Color.red).padding().background(Color.white).font(.poppinsSemiBold).cornerRadius(10)
                                }
                                Button(){
                                    
                                } label: {
                                    NavigationLink(destination: ContentView().navigationBarHidden(true)){
                                        HStack{
                                            Image(systemName: "arrow.counterclockwise").foregroundColor(.accentColor)
                                            Text("Start Again")
                                        }
                                        .frame(maxWidth: .infinity).foregroundColor(Color.red).padding().background(Color.white).font(.poppinsSemiBold).cornerRadius(10)
                                    }
                                }
                            }.padding()
                            
                            Spacer()
                        }
                    } else {
                        Rectangle().cornerRadius(13).foregroundColor(Color.white).ignoresSafeArea().padding(.top, 10)
                        
                        VStack{
                            Text("*****").font(.poppinsLightLarge).foregroundColor(.accentColor).padding(.top, 30)
                            Text("Buy").font(.poppinsSemiBoldLarge).foregroundColor(.accentColor)
                            Image(beckyBuy.randomElement()!).resizable().frame(width: 200.0, height: 200.0).padding()
                            Text("\(recomendations.randomElement()!)").padding().font(.poppinsRegular).foregroundColor(.accentColor)
                                ._lineHeightMultiple(0.85)
                            
                            VStack{
                                Button(){
                                    
                                } label: {
                                    HStack{
                                        Image(systemName: "square.and.arrow.up").foregroundColor(.white)
                                        Text("Share your result").foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity).foregroundColor(Color.red).padding().background(Color.accentColor).font(.poppinsSemiBold).cornerRadius(10)
                                }
                                Button(){
                                    
                                } label: {
                                    NavigationLink(destination: ContentView().navigationBarHidden(true)){
                                        HStack{
                                            Image(systemName: "arrow.counterclockwise").foregroundColor(.white)
                                            Text("Start Again").foregroundColor(.white)
                                        }
                                        .frame(maxWidth: .infinity).foregroundColor(Color.red).padding().background(Color.accentColor).font(.poppinsSemiBold).cornerRadius(10)
                                    }
                                }
                            }.padding()
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: "bye")
    }
}
