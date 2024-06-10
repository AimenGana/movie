//
//  ExoTests.swift
//  ExoTests
//
//  Created by Aimen on 09/06/2024.
//

import XCTest
@testable import Exo

final class ExoTests: XCTestCase {
    var useCase = MovieUseCase(service: ServiceMock())
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPaginationCall() async throws {
        var modelList =  await useCase.getNextPage()
        XCTAssertEqual(modelList?.count, 10)
        
        modelList = await useCase.getNextPage()
        XCTAssertEqual(modelList?.count, 0)
        
        modelList = await useCase.getNextPage()
        XCTAssertEqual(modelList, nil)
        
        modelList = await useCase.getNextPage()
        XCTAssertEqual(modelList, nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
