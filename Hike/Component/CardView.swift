//
//  CardViewName.swift
//  Hike
//
//  Created by Matt Da Silva on 26/05/2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNum: Int = 1
    @State private var randomNum: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage(){
        repeat{
            randomNum = Int.random(in: 1...5)
        } while
            imageNum == randomNum
        
        
        imageNum = randomNum
    }
    
    
    var body: some View {
        ZStack {
            
            CustomBackgroundView()
            
            VStack {
                
                //MARK: - Header
                
                VStack(alignment:.leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [Color.customGrayLight, Color.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()

                        Button{
                            // ACTION: show a sheet
                            print("the button has been pressed")
                            isShowingSheet.toggle()
                           
                        }label:{
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activities for family and friends")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(Color.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                //MARK: - MAIN CONTENT
                
                ZStack {
                    
                    
                   CustomCircleView()
                    
                    Image("image-\(imageNum)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 2), value: imageNum)
                    
                }
                //MARK: - Footer
                
                Button{
                    //ACTION: Generate a random number
                    print("the button was pressed")
                    randomImage()
                }label:{
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1, y:1)
                }
                .buttonStyle(GradientButton())
                
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
