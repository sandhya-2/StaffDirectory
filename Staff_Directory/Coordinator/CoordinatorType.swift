//
//  CoordinatorType.swift
//  StaffsDirectory
//
//  Created by Sandhya on 02/05/22.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
