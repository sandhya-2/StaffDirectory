//
//  ServiceError.swift
//  Staff_Directory
//
//  Created by Sandhya on 02/05/22.
//

import Foundation

enum ServiceError: Error {
    case serviceNotAvailable
    case parsingFailed
    case requestNotFormatted
}
