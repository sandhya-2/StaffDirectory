//
//  Servicable.swift
//  Staff_Directory
//
//  Created by Sandhya on 02/05/22..
//

import Foundation

protocol Servicable {
    func get<T:Decodable>(_ baseUrl:String, path:String, type:T.Type, completionHandler:@escaping(Result<[T],   ServiceError>)->Void)
}
