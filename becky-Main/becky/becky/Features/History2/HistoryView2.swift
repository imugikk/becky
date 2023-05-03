//
//  HistoryView2.swift
//  becky
//
//  Created by Michelle Annice on 03/05/23.
//

import SwiftUI

struct HistoryView2: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY

    var body: some View {
            
            NavigationView {
                ZStack{
//                    Color.accentColor.edgesIgnoringSafeArea(.all)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 20) {
                            // MARK: - SECTION 1
                            
                            GroupBox(
                                label:
                                    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                            ) {
                                Divider().padding(.vertical, 4)
                                
                                HStack(alignment: .center, spacing: 10) {
                                    Image("logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(9)
                                    
                                    Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                        .font(.footnote)
                                }
                            }
                            
                            // MARK: - SECTION 2
                            
                            GroupBox(
                                label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                            ) {
                                Divider().padding(.vertical, 4)
                                
                                Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                    .padding(.vertical, 8)
                                    .frame(minHeight: 60)
                                    .layoutPriority(1)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                
                                Toggle(isOn: $isOnboarding) {
                                    if isOnboarding {
                                        Text("Restarted".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.green)
                                    } else {
                                        Text("Restart".uppercased())
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.secondary)
                                    }
                                }
                                .padding()
                                .background(
                                    Color(UIColor.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                )
                            }
                            
                            // MARK: - SECTION 3
                            
                            GroupBox(
                                label:
                                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                            ) {
                                SettingsRowView(name: "Developer", content: "John / Jane")
                                SettingsRowView(name: "Designer", content: "Robert Petras")
                                SettingsRowView(name: "Compatibility", content: "iOS 16")
                                SettingsRowView(name: "Website", linkLabel: "Credo Academy", linkDestination: "credo.academy")
                                SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                                SettingsRowView(name: "SwiftUI", content: "4")
                                SettingsRowView(name: "Version", content: "1.5.0")
                            }
                            
                        } //: VSTACK
                        .navigationBarTitle(Text("Settings").font(.poppinsRegular).foregroundColor(.white), displayMode: .large)
                        .navigationBarItems(
                            trailing:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "xmark")
                                }
                        )
                        .padding()
                    } //: SCROLL
                }
                } //: NAVIGATION
        }
    }

struct HistoryView2_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView2()
            .previewDevice("iPhone 14")
    }
}
