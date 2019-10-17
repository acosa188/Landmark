//
//  LandmarkGroup.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-14.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI

struct LandmarkGroup: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var landmarks:[Landmark]
}
