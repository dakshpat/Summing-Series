//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Daksh Patel on 1/29/22.
//

import XCTest

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testSumMethod1 () async{
        let n = 10
        
        let series = Series()
        
        let methodSum1 = await series.sumMethod1(numberOfIterative: n)
        
        XCTAssertEqual(methodSum1, (66022193/23279250), accuracy: 1.0E-7, "was not equal to this resolution")
        
    }
    
    func testSumMethod2 () async{
        let n = 10
        
        let series = Series()
        
        let methodSum2 = await series.sumMethod2(numberOfIterative: n)
        
        XCTAssertEqual(methodSum2, (66022193/23279250), accuracy: 1.0E-7, "was not equal to this resolution")
        
    }
    
    func testSumMethod3 () async{
        let n = 10
        
        let series = Series()
        
        let methodSum3 = await series.sumMethod3(numberOfIterative: n)
        
        XCTAssertEqual(methodSum3, (66022193/23279250), accuracy: 1.0E-7, "was not equal to this resolution")
        
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
