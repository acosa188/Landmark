//
//  LandmarkGroupSelect.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-13.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI


struct LandmarkGroupSelect: View {
    @EnvironmentObject var userData: UserData
    @State private var groupName:String = ""
    @State private var group: [Landmark] = []
    @State private var inGroup = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter group name", text: $groupName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                
            List(userData.landmarks){landmark in
                LandmarkRow(landmark: landmark)
                Button(action:{
                    if(!self.group.contains(landmark)){
                        self.group.append(landmark)
                    }
                    
                }){
                    Text("+")
                    .font(.system(.largeTitle))
                    .frame(width: 27, height:20)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 7)
                }
                .background(Color.blue)
                    .cornerRadius(38.5)
                .padding()
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
            Button(action:{
                self.userData.groupsSize += 1
                self.userData.groups.append(LandmarkGroup(id: self.userData.groupsSize ,name: self.groupName, landmarks: self.group))
                self.presentation.wrappedValue.dismiss()
            }){
                Text("Add")
            }
        }
    .padding()
    }
}


struct LandmarkGroupSelect_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkGroupSelect()
        .environmentObject(UserData())
    }
}
