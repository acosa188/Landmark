//
//  LandmarkGroupEntryModel.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-14.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI

struct LandmarkGroupEntryModel: Hashable, Codable{
    var landmark: Landmark
    var inGroup: Bool
}
