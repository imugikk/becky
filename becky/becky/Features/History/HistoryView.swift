//
//  HistoryView.swift
//  becky
//
//  Created by Michelle Annice on 03/05/23.
//

import SwiftUI

struct HistoryView: View {
//    @State var todoItems = [ ToDoItem(name: "Meet Eddie for lunch"),
//                              ToDoItem(name: "Buy toilet paper"),
//                              ToDoItem(name: "Write a new tutorial"),
//                              ToDoItem(name: "Buy two bottles of wine"),
//                              ToDoItem(name: "Prepare the presentation deck")
//                                ]
    @State private var searchText = ""
    
    @FetchRequest(entity: History.entity() ,sortDescriptors: []) var histories : FetchedResults<History>
    
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
                            .foregroundColor(.accentColor)
                        
                        
                        ForEach(histories.filter({ searchText.isEmpty ? true : $0.product!.contains(searchText) }))  { item in
                            VStack{
                                HStack{
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.product ?? "Unknown")
                                            .foregroundColor(.accentColor)
                                        Text("12/34/56")
                                    }
                                    
                                    Spacer()
                                    
                                    Text("butuh")
                                        .foregroundColor(.accentColor)
                                    
                                }
                                
                                .padding()
                                
                                Divider()
                                    .frame(width: 345)
                            }
                        }
                    }//:VStack
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

