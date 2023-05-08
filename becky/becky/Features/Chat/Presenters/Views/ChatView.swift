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
    
    @State var messages: [String] = []
    @State private var messageText = ""
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var chatManager: ChatManager = ChatManager()
    @State var selectedChoiceNumber: Int?
    @State var index: Int = 0
    
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

                                ForEach(chatManager.arrOfString, id: \.self) {
                                    message in
                                    if message.contains("[USER]") {
                                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                                        
                                        HStack{
                                            Spacer()
                                            Text(newMessage).font(.poppinsRegular)
                                                .frame(minWidth: 50)
                                                .padding(10)
                                                .foregroundColor(Color.white)
                                                .background(Color.red)
                                                .cornerRadius(20)
                                                .font(.poppinsRegular)
                                        }
                                    } else {
                                        HStack{
                                            Text(message).font(.poppinsRegular).padding(10)
                                                .foregroundColor(Color.red)
                                                .background(Color.white)
                                                .cornerRadius(20)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.red, lineWidth: 1)
                                                )
                                            Spacer()
                                        }
                                    }
                                }
                            }.padding(.horizontal, 20)
                        }
                    }.rotationEffect(.degrees(180))
                }.rotationEffect(.degrees(180))
                
                Spacer()
                VStack{
                    ForEach(chatManager.questionPack?.choices ?? []){ choice in

                        Text("\(choice.text)" as String)
                            .padding(8)
                            .foregroundColor(Color.red)
                            .background(Color.white)
                            .cornerRadius(20)
                            .font(.poppinsRegular)
                            .padding(.leading, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay{
                                if let selectedChoiceNumber, choice.no == selectedChoiceNumber{
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.red, lineWidth: 3)
                                } else {
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color.red, lineWidth: 1)
                                }
                            }
                            .onTapGesture {
                                selectedChoiceNumber = choice.no
                                isSelected[selectedChoiceNumber! - 1 ].toggle()
                                isSubmit = false
        
                                for i in 0..<isSelected.count {
                                    if i == selectedChoiceNumber! - 1 {
                                        messageText = choice.text
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
                            if isSubmit && (chatManager.totalScore >= 100 || index >= 5 ) {
                                showingSheet.toggle()
                                saveData()
                            } else if isSubmit {
                                chatManager.isSubmited(selectedOption: selectedChoiceNumber! - 1)
                                sendMessage(message: messageText)
                                index += 1
                                
                                print(index)
                                
                                for i in 0..<isSelected.count {
                                    selectedChoiceNumber = 0
                                    isSelected[i] = false
                                }
                                
                                isSubmit = false
    
                            }
                        }
                }.padding()
            }
        }.overlay{
            if showingSheet{
                if chatManager.totalScore <= 100 {
                    ResultView(score: "bye")
                } else {
                    ResultView(score: "buy")
                }
            }
        }.onAppear{
            chatManager.initiateQuestionPack()
        }
    }
    
    func saveData() {
        let history = History(context: moc)
        history.id = UUID()
        history.product = "\(product)"
        history.date = Date()
        if chatManager.totalScore <= 100 {
            history.result = "Bye"
        } else {
            history.result = "Buy"
        }
        print("masuk")
        
        do {
            try moc.save()
            if moc.hasChanges {
                print("Data was successfully saved to Core Data.")
            } else {
                print("No changes were made to the Core Data store.")
            }
        } catch let error {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            chatManager.arrOfString.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                chatManager.arrOfString.append("\(chatManager.questionPack!.question)")
//                print(chatManager.arrOfString)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(product: "Villa 10 Hektar")
    }
}
