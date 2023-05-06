//
//  HistoryView.swift
//  becky
//
//  Created by Michelle Annice on 03/05/23.
//

import SwiftUI

struct HistoryView: View {
    @State var todoItems = [ ToDoItem(name: "Meet Eddie for lunch"),
                              ToDoItem(name: "Buy toilet paper"),
                              ToDoItem(name: "Write a new tutorial"),
                              ToDoItem(name: "Buy two bottles of wine"),
                              ToDoItem(name: "Prepare the presentation deck")]
    @State private var searchText = ""
    
//    @StateObject private var dataController = DataController()
    
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
                        
                        
                        ForEach(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }))  { item in

                            VStack{
                                HStack{
                                    
                                    VStack(alignment: .leading) {
                                        /*@START_MENU_TOKEN@*/Text(item.name)/*@END_MENU_TOKEN@*/
                                            .foregroundColor(.accentColor)
                                        Spacer()
                                        Text("12/34/56")
                                            .opacity(0.5)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("butuh")
                                        .font(.poppinsBold)
                                        .foregroundColor(.accentColor)
                                    
                                }
                                
                                .padding(.horizontal, 20)
                                
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

