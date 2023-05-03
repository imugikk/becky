//
//  HistoryView.swift
//  becky
//
//  Created by Michelle Annice on 03/05/23.
//

import SwiftUI

struct HistoryView: View {
    private var todoItems = [ ToDoItem(name: "Meet Eddie for lunch"),
                              ToDoItem(name: "Buy toilet paper"),
                              ToDoItem(name: "Write a new tutorial"),
                              ToDoItem(name: "Buy two bottles of wine"),
                              ToDoItem(name: "Prepare the presentation deck")
                                ]
    @State private var searchText = ""
    
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all).opacity(1.0)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        HStack{
                            Text("History")
                                .font(.poppinsBoldLarge)
                                .foregroundColor(.accentColor)
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            })
                            {ZStack{
                                Image(systemName: "xmark.circle.fill")
                                    .renderingMode(.original)
                                    .foregroundColor(.accentColor)
                                    .font(.title)
                                .opacity(0.8)}
                            }
                            .padding()
                        }//:HStack
                        
                        SearchBar(text: $searchText)
                        
                        List(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
                            Text(item.name)
                        }
                        
//                        List {
//                            ForEach(searchResults, id: \.self) { name in
//                                NavigationLink {
//                                    Text(name)
//                                } label: {
//                                    Text(name)
//                                }
//                            }
//                        }

//                        .searchable(text: $searchText, prompt: "Search previous entry"){
//                            ForEach(searchResults, id: \.self) { result in
//                                Text("Are you looking for \(result)?").searchCompletion(result)
//                            }
//                        }
                        
                    }//:VStack
                }
            }
        }
    }
    
//    var searchResults: [String] {
//            if searchText.isEmpty {
//                return names
//            } else {
//                return names.filter { $0.contains(searchText) }
//            }
//        }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

