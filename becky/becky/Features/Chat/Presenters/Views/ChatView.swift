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
    
    @State var options : [[String]] = [["yes gurlz", "no bitj", "maybe idk"], ["yes dedi", "no papa", "not sure"],["yes gurlz", "no bitj", "maybe idk"], ["yes dedi", "no papa", "not sure"]]
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var chatManager: ChatManager = ChatManager()
    @State var selectedChoiceNumber: Int?
    
    @State var messages: [String] = ["Are you buying this for the right reasons?"]
    @State private var messageText = ""
    
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
                                        
                                        HStack{
                                            Text(message).font(.poppinsRegular).padding(8)
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
                            }.padding(.horizontal, 10)
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
                                isSelected[selectedChoiceNumber!].toggle()
                                isSubmit = false
        
                                for i in 0..<isSelected.count {
                                    if i == selectedChoiceNumber! {
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
                            if isSubmit && chatManager.totalScore >= 100 {
                                showingSheet.toggle()
                                saveData()
                            } else if isSubmit {
                                chatManager.isSubmited(selectedOption: selectedChoiceNumber!-1)
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
        }.onAppear{
            chatManager.initiateQuestionPack()
        }
    }
    
    func saveData() {
        let history = History(context: moc)
        history.id = UUID()
        history.product = "\(product)"
        history.date = Date()
        history.result = "butuh"
        print("masuk")
        
//        DataController().save()
//        try? moc.save()
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
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(message)
//                messages.append("test")
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(product: "Villa 10 Hektar")
    }
}
