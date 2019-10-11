//
//  UserData.swift
//  Landmarks
//
//  Created by Arjun Cosare on 2019-10-10.
//  Copyright © 2019 Arjun Cosare. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject{
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
