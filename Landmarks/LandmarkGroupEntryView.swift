//
//  LandmarkGroupEntry.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-13.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI

struct LandmarkGroupEntryView: View {
    var group: LandmarkGroup
    
    var body: some View {
        VStack{
            HStack {
                Text(group.name)
                    .font(.headline)
                Spacer()
            }
            List{
                ForEach(group.landmarks){landmark in
                    NavigationLink(destination: LandmarkDetails(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
    .padding()
    }
    
}

struct LandmarkGroupEntryView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkGroupEntryView(group: LandmarkGroup(id: 0, name: "Category 1", landmarks: landmarkData))
            
        
    }
}
