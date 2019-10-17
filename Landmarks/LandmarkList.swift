//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-10.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    @State var name = ""
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray)
                        TextField("Search landmark",text: $name)
                    }
                    
                    
                    Toggle(isOn: $userData.showFavoritesOnly){
                        Text("Favorites only")
                    }
                    ForEach(userData.landmarks){landmark in
                        
                        if (!self.userData.showFavoritesOnly || landmark.isFavorite ) && (landmark.name.contains(self.name) || self.name == ""){
                            NavigationLink(destination: LandmarkDetails(landmark: landmark)){
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("Landmarks")
                NavigationLink(destination: LandmarkGroupList(), tag: 1, selection: $selection){
                    Button(action:{
                        self.selection = 1
                    }){
                        Text("Group List")
                    }
                }
            }
            
            
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
