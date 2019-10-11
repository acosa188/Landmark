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
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(userData.landmarks){landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite{
                        NavigationLink(destination: LandmarkDetails(landmark: landmark)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                
            }
        .navigationBarTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
