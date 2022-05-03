//
//  PeoplesViewModel.swift
//  Staff_Directory
//
//  Created by Sandhya on 02/05/22.
//

import Foundation

protocol PeopleViewModelType: AnyObject {
    var delegate: PeoplesViewable? {get set}
    var peoplesCount:Int { get }
    func fetchPeoples(baseUrl: String, path: String)
    func getPeopleDetailFor(index:Int)-> People?
}

final class PeoplesViewModel: PeopleViewModelType {
   
    private var peoples:[PeopleResponse] = []

    var peoplesCount:Int {
        return peoples.count
    }
    
    private var serviceManager: Servicable
    weak var delegate: PeoplesViewable?
    
    init(serviceManager: Servicable = ServiceManager()) {
        self.serviceManager = serviceManager
    }
        
    func fetchPeoples(baseUrl: String, path: String) {
        
        serviceManager.get(baseUrl, path: path, type: PeopleResponse.self) {[weak self] result in
            
            switch result {
            case .success(let peoples) :
                self?.peoples = peoples
                self?.delegate?.refreshUI()
            case .failure(_) :
                self?.peoples = []
                self?.delegate?.showError()
            }
        }
    
    }
    
    func getPeopleDetailFor(index: Int)-> People? {
        guard index < peoplesCount && index >= 0 else {
            return nil
        }
        
        let people = peoples[index]
        
        return People(firstName: people.firstName ?? "", avatar: people.avatar ?? "", lastName: people.lastName ?? "", email: people.email ?? "", jobTitle: people.jobTitle ?? "", joinedDate: people.createdAt ?? "")
        
    }
}

