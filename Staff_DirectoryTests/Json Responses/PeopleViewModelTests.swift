//
//  PeopleViewModelTests.swift
//  Staff_DirectoryTests
//
//  Created by Sandhya on 02/05/22.
//

import XCTest
@testable import Staff_Directory

class PeopleViewModelTests: XCTestCase {
    
    var peopleViewModel: PeoplesViewModel!
    override func setUpWithError() throws {
        let peoplesViewController = PeoplesViewController()
        let mockNetworkMaanger = MockNetworkManager()
        peopleViewModel = PeoplesViewModel( serviceManager: mockNetworkMaanger, delegate: peoplesViewController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchStaff_success() {
            
        peopleViewModel.fetchPeoples(baseUrl: "", path: "people_success_response")
         
        XCTAssertEqual(peopleViewModel.peoplesCount , 65)
    }
    
    func testFetchStaff_failure() {
        peopleViewModel.fetchPeoples(baseUrl: "", path: "failure_response")

        XCTAssertEqual(peopleViewModel.peoplesCount , 0)
    }

    func testGetStaff() {
        
        var staff = peopleViewModel.getPeopleDetailFor(index: 2)
        
        XCTAssertNil(nil)
        
         staff = peopleViewModel.getPeopleDetailFor(index: -1)
        
        XCTAssertNil(nil)
        
        peopleViewModel.fetchPeoples(baseUrl: "", path: "people_success_response")

        staff = peopleViewModel.getPeopleDetailFor(index: 0)
       
        XCTAssertNotNil(staff)
        
        XCTAssertEqual(staff!.firstName, "Maggie")
    }
}
