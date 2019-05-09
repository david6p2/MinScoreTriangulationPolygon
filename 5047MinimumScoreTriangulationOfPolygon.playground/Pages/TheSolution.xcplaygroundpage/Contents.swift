//: [Previous](@previous)
import UIKit
import XCTest

class Solution {
  static func minScoreTriangulation(_ A: [Int]) -> Int {
    var answer = 0
    let a = A
    // Sort Array
    var aSorted = a.sorted(by: >)
    print(aSorted)
    // use a pivot index
    guard let a0 = aSorted.popLast(), let a1 = aSorted.popLast() else {
      print(aSorted)
      return answer
    }
    
    print(aSorted)
    // add the first 2 elements with the moving pivot
    while aSorted.count > 0 {
      answer += a0*a1*aSorted.popLast()!
    }
    return answer
  }
}




// MARK: Test

class MyTests : XCTestCase {
  
  func testSigleMinScoreTriangulation() {
    // Given
    let array = [1,2,3]
    // When
    let answer = Solution.minScoreTriangulation(array)
    
    // Then
    XCTAssertEqual(6, answer, "\(array) was the answer and should have been 6")
  }
  
  func testSquareMinScoreTriangulation() {
    // Given
    let array = [3,7,4,5]
    // When
    let answer = Solution.minScoreTriangulation(array)
    
    // Then
    XCTAssertEqual(144, answer, "\(array) was the answer and should have been 144")
  }
  
  func testHexagonMinScoreTriangulation() {
    // Given
    let array = [1,3,1,4,1,5]
    // When
    let answer = Solution.minScoreTriangulation(array)
    
    // Then
    XCTAssertEqual(13, answer, "\(array) was the answer and should have been 13")
  }
  
  func testSquare2MinScoreTriangulation() {
    // Given
    let array = [2,1,4,4]
    // When
    let answer = Solution.minScoreTriangulation(array)
    
    // Then
    XCTAssertEqual(24, answer, "\(array) was the answer and should have been 24")
  }
}


class PlaygroundTestObserver : NSObject, XCTestObservation {
  func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
    print("Test failed on line \(lineNumber): \(testCase.name ), \(description)")
  }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)

struct TestRunner {
  
  func runTests(testClass:AnyClass) {
    print("Running test suite \(testClass)")
    
    let tests = testClass as! XCTestCase.Type
    let testSuite = tests.defaultTestSuite
    testSuite.run()
    let run = testSuite.testRun as! XCTestSuiteRun
    
    print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
  }
}

TestRunner().runTests(testClass:MyTests.self)


//: [Next](@next)
