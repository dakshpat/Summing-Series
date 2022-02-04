//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Daksh Patel on 2/2/22.
//

import XCTest

class Tests_macOS: XCTestCase {

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

    func testFirstBessel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let xValue = 3.14159
        var testValue = 0.0
        let exactValue = -0.304241422390334070012314231310288833541605096519723554605
        
        testValue = calculateFirstBessel(xValue: xValue)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-8, "Print it should have been closer.")
        
        
    
    }
    
    func testSecondBessel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let xValue = 3.14159
        var testValue = 0.0
        let exactValue = 0.2846163909175278108223286455901279738072008398586234609975
        
        testValue = calculateSecondBessel(xValue: xValue)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-8, "Print it should have been closer.")
        
        
    
    }
    
    func testBessel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let xValue = 3.14159
        var testValue = 0.0
        
        let order = 12                      /* order of Bessel function */
        let start = order+25                      /* used for downward algorithm */
        
        let exactValue = 3.8913453282141163022864104025060178271079663348975737E-7
        
        
        
        testValue = calculateDownwardRecursion(xValue: xValue, order: order, start: start)
        
        
        XCTAssertEqual(testValue, exactValue, accuracy: 1.0e-15, "Print it should have been closer.")

        
    
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
