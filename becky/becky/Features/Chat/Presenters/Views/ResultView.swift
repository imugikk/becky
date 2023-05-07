//
//  ResultView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 03/05/23.
//

import SwiftUI

struct ResultView: View {
    
    let result : [String] = ["ga butuh", "butuh"]
//    let showResult = result.randomElement()!
    
    var body: some View {
        NavigationView{
            Color.gray.opacity(0.5).ignoresSafeArea().overlay{
                ZStack{
                    Rectangle().cornerRadius(13).foregroundColor(Color.red).ignoresSafeArea().padding(.top, 10)
                    
                    VStack{
                        Text("*****").font(.poppinsLightLarge).foregroundColor(Color.white).padding(.top, 30)
                        Text("ga butuh").font(.poppinsSemiBoldLarge).foregroundColor(Color.white)
                        Image(systemName: "shareplay").resizable().frame(width: 300.0, height: 150.0).foregroundColor(Color.white).padding()
                        Text("Boohoo kamu impulsive. Biggest, longest speech bubble from Becky. What if she becomes sentient?jkxvhsdivofh ndziofvjs sioocpdshfskcn ioghdopvs os shfudzucshidiadiahfsiac. Shuidsnfsfs ef spfosgodsgopdrgvi niodfs fheiosfbosdfvcso;dfhiyvbso sd dsjfhgav iagahvsihb oshncfaporv hs").padding().font(.poppinsRegular).foregroundColor(Color.white)
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
                                NavigationLink(destination: HistoryView()){
                                    HStack{
                                        Text("Start Again")
                                    }
                                    .frame(maxWidth: .infinity).foregroundColor(Color.red).padding().background(Color.white).font(.poppinsSemiBold).cornerRadius(10)
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

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
