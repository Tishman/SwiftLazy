//
//  LazyTests.swift
//  SwiftLazy-iOS
//
//  Created by Роман Тищенко on 04/09/2019.
//  Copyright © 2019 Alexander Ivlev. All rights reserved.
//

import XCTest
@testable import SwiftLazy

class LazyTests: XCTestCase {
  
  func testGetChangedValue() {
    var testResult: Int = 0
    var counter: Int = 0
    let lazyInt = Lazy<Int> {
      counter += 1
      return counter
    }
    
    testResult = lazyInt.value
    testResult = lazyInt.value
    testResult = lazyInt.value
    
    XCTAssertEqual(testResult, 1, "Lazy variable has to return chached value")
  }
  
  func testClearNotEmptyLazy() {
    var testResult: Int = 0
    var counter: Int = 0
    let lazyInt = Lazy<Int> {
      counter += 1
      return counter
    }
    
    testResult = lazyInt.value
    lazyInt.clear()
    testResult = lazyInt.value
    
    XCTAssertEqual(testResult, 2, "Incorrect clearing not empty lazy variable")
  }
  
  func testClearEmptyLazy() {
    var testResult: Int = 0
    var counter: Int = 0
    let lazyInt = Lazy<Int> {
      counter += 1
      return counter
    }
    
    lazyInt.clear()
    testResult = lazyInt.value
    
    XCTAssertEqual(testResult, 1, "Incorrect clearing empty lazy variable")
  }
  
  func testLazyWasMade() {
    let lazyInt = Lazy(1)
    let _ = lazyInt.value
    
    XCTAssertTrue(lazyInt.wasMade, "Lazy variable was not made")
  }
  
  func testLazyWasNotMade() {
    let lazyInt = Lazy(1)
    
    XCTAssertFalse(lazyInt.wasMade, "Lazy variable was made")
  }
}

