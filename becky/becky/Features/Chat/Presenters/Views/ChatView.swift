//
//  ChatView.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 02/05/23.
//

import SwiftUI

struct ChatView: View {
    @State private var isSelected1 = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var isSubmit = false
    @State private var showingSheet = false
    
    @State private var currentQuestionIndex = 0
    
    let questions : [[String: Any]] = [
        [
            "question": "Are you buying this for the right reasons?",
            "option": [
                "No" : 7,
                "Yes" : 5,
                "Maybe" : 0
            ]
        ],
        [
            "question": "Is this a need or a want?",
            "option": [
                "Need" : 7,
                "Want" : 5,
                "Both" : 0
            ],
        ],
        [
            "question": "Can you get by without it?",
            "option": [
                "No" : 7,
                "Yes" : 5,
                "Not Sure" : 0
            ],
        ],
        [
            "question": "Do you need it right now?",
            "option": [
                "Yes because it is gonna be used now" : 7,
                "Not now but soon I will need it " : 5,
                "No it can be purchased any time in the future" : 0
            ],
        ]
    ]
    
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
                                Text("Villa 10 Hektar")
                                    .padding(8)
                                    .foregroundColor(Color.white)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .font(.poppinsRegular)

                                ForEach(0..<currentQuestionIndex+1, id: \.self){ index in
                                    Text(questions[index]["question"] as! String)
                                        .padding(8)
                                        .foregroundColor(Color.red)
                                        .background(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.red, lineWidth: 1)
                                        )
                                        .cornerRadius(20)
                                        .frame(alignment: .leading)
                                        .padding(.trailing,70)
                                        .font(.poppinsRegular)

                                }
                                
                                Text("Smallest bubble speech")
                                    .padding(8)
                                    .foregroundColor(Color.white)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .font(.poppinsRegular)
                            }
                        }
                        Spacer()
                    }
                }
                Spacer()
                VStack{
                    ForEach(0..<3){ index in SelectButtonView(isSelected: $isSelected1, text: "Option two alias 2").onTapGesture {
                        isSelected1.toggle()
                        isSubmit = false
                        
                            if isSelected1 {
                                isSelected2 = false
                                isSelected3 = false
                                isSubmit = true
                            }
                        }
                    }
        
                    SubmitButtonView(isSubmit: $isSubmit)
                        .onTapGesture {
                            if isSubmit && currentQuestionIndex == questions.count-1 { showingSheet.toggle()
                            } else {
                                currentQuestionIndex = currentQuestionIndex + 1
                            }
                        }
                }
            }.padding()
        }.overlay{
            if showingSheet{
                ResultView()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
