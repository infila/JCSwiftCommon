import XCTest
import JCSwiftCommon
import Foundation

class Tests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    testArrayExt()
    super.tearDown()
  }

  func testArrayExt() {
    // This is an example of a functional test case.
    var arr = ["1", "2", "3", "2", "4", "2"]
    arr.remove("2", onlyFirst: true)

    XCTAssert(arr == ["1", "3", "2", "4", "2"], "Pass")

    XCTAssert(arr == ["1", "3", "4"], "Pass")
  }
    
    func testDateExt() {
        Date().timeMills
    }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
}
