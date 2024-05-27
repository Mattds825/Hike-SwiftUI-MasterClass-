//
//  SettingsView.swift
//  Hike
//
//  Created by Matt Da Silva on 27/05/2024.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppicons: [String] =
    [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List{
            
            //MARK: Section Header
            
            
            Section {
                HStack{
                    
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors' Choice")
                        .fontWeight(.medium)                }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                
                VStack(spacing: 8.0){
                    Text("Where can you find \nperferct tracks")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which look gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: SECTION ICONS
            
            Section(header: Text("Alternate Icons")){
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12.0) {
                        ForEach(alternateAppicons.indices, id: \.self) { item in
                            Button{
                                
                                print("Icon \(alternateAppicons[item]) was pressed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppicons[item]) {
                                    error in
                                    if error != nil {
                                        print("Failed request to update app's icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! you have changed the app icon to \(alternateAppicons[item])")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppicons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }.listRowSeparator(.hidden)
            
            //MARK: SECTION ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright All rights reserved")
                    Spacer()
                }.padding(.vertical, 8)
            ){
                
                CustomListRow(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRow(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOS, IPadOS", rowTintColor: .red)
                
                CustomListRow(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRow(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRow(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Matthew G. Da Silva", rowTintColor: .blue)
                
                CustomListRow(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .blue)
                
                CustomListRow(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowTintColor: .blue,
                    rowLinkLabel: "Mattds825 Github", rowLinkDestination: "https://github.com/Mattds825"
                )
               
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
