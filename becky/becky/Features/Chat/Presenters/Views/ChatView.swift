//
//  ChatView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 02/05/23.
//

import SwiftUI

struct ChatView: View {
    @State var product: String
    @State private var isSelected : [Bool] = [false, false, false]
    @State private var isSubmit = false
    @State private var showingSheet = false
    
    @State private var currentQuestionIndex = 0
    
    @State private var messageText = ""
    @State var messages: [String] = ["Are you buying this for the right reasons?"]
    
    @State var options : [[String]] = [["yes gurlz", "no bitj", "maybe idk"], ["yes dedi", "no papa", "not sure"], ["need", "want", "both"], ["yes no", "not now", "no bitj"], ["yes gurlz", "no bitj", "maybe idk"], ["yes dedi", "no papa", "not sure"], ["need", "want", "both"]]
    
    struct ChatBubble: View {
        let text: String
        let sender: String
        let isFromCurrentUser: Bool
        let date: Date = Date()

        var body: some View {
            Group {
                if isFromCurrentUser {
                    HStack {
                        Spacer()
                        Text(text)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    HStack {
                        Text(sender)
                            .font(.caption)
                        Text(text)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text("*********************").font(.poppinsLightLarge).foregroundColor(Color.red.opacity(0.4))
                ScrollView{
                    ScrollViewReader{
                        reader in HStack{
                            VStack (alignment: .trailing){
                                Text(product)
                                    .padding(8)
                                    .foregroundColor(Color.white)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .font(.poppinsRegular)
                                ForEach(messages, id: \.self) {
                                    message in
                                    if message.contains("[USER]") {
                                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                                        
                                        HStack{
                                            Spacer()
                                            Text(newMessage).font(.poppinsRegular)
                                                .frame(minWidth: 50)
                                                .padding(8)
                                                .foregroundColor(Color.white)
                                                .background(Color.red)
                                                .cornerRadius(20)
                                                .font(.poppinsRegular)
                                        }
                                    } else {
                                        HStack{
                                            Text(message).font(.poppinsRegular).padding(8)
                                                .foregroundColor(Color.red)
                                                .background(Color.white)
                                                .cornerRadius(20)
                                                .font(.poppinsRegular)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.red, lineWidth: 1)
                                                )
                                            Spacer()
                                        }
                                    }
                                }.padding(.horizontal, 10)
                            }
                        }
                    }.rotationEffect(.degrees(180))
                }.rotationEffect(.degrees(180))
                
                Spacer()
                VStack{
                    ForEach(0..<3){ index in ZStack(alignment: .leading){
                        Capsule()
                            .frame(height: 40)
                            .foregroundColor(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.red, lineWidth: isSelected[index] ? 3 : 1)
                            )
                        Text(options[currentQuestionIndex][index]).foregroundColor(Color.red).padding().font(isSelected[index] ? .poppinsSemiBold : .poppinsRegular)
                    }.frame(height: 40).onTapGesture {
                        isSelected[index].toggle()
                        isSubmit = false
                        
                        for i in 0..<isSelected.count {
                            if i == index {
                                messageText = options[currentQuestionIndex][index]
                            } else {
                                isSelected[i] = false
                            }
                        }
                        
                        for i in isSelected {
                            if i == true {
                                isSubmit=true
                            }
                        }

                    }
                        
                    }
        
                    SubmitButtonView(isSubmit: $isSubmit)
                        .onTapGesture {
                            if isSubmit && currentQuestionIndex == options.count-1 { showingSheet.toggle()
                            } else if isSubmit {
                                currentQuestionIndex += 1
                                sendMessage(message: messageText)
                                for i in 0..<isSelected.count {
                                    isSelected[i] = false
                                }
                                isSubmit = false
                            }
                        }
                }.padding()
            }
        }.overlay{
            if showingSheet{
                ResultView()
            }
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(getBeckyResponse(message: message))
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(product: "Villa 10 Hektar")
    }
}
