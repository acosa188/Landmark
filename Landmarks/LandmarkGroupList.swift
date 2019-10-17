//
//  LandmarkGroupList.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-12.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI

struct LandmarkGroupList: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var selection: Int? = nil
    
    var body: some View {
        ZStack{
                       List{
                           ForEach(userData.groups){ group in
                               NavigationLink(destination: LandmarkGroupEntryView(group: group)){
                                   Text(group.name)
                               }
                           }
                           .onDelete(perform: delete)
                       }
                       VStack {
                           Spacer()
                           
                           HStack{
                              Spacer()
                               NavigationLink(destination: LandmarkGroupSelect(), tag: 1, selection: $selection){
                                   Button(action:{
                                       self.selection = 1
                                       //self.isModal = true
                                       }){
                                          Text("+")
                                           .font(.system(.largeTitle))
                                           .frame(width: 77, height:70)
                                           .foregroundColor(Color.white)
                                           .padding(.bottom, 7)
                                       }
                                       .background(Color.blue)
                                       .cornerRadius(38.5)
                                   .padding()
                                       .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                               }
                               
                           }
                       
                       }
                       .navigationBarTitle("Group List")
                       .navigationBarItems(
                           trailing: EditButton()
                       )
                   }

    }
    
    func delete(at offset: IndexSet){
        userData.groups.remove(atOffsets: offset)
        
    }
}

struct LandmarkGroupList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkGroupList()
        .environmentObject(UserData())
    }
}
