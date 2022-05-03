//
//  RoomsResponse.swift
//  Staff_Directory
//
//  Created by Sandhya on 02/05/22.
//

import Foundation

struct RoomsResponse: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

