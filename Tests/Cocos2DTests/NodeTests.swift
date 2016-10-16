//
//  NodeTests.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/15/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
@testable import Cocos2D

final class NodeTests: XCTestCase {

    func testNode() {
        
        // test initialization
        let node = Node()
        
        // test description
        XCTAssert(node.description.isEmpty == false)
        XCTAssert(node.description == "<Node | Tag = -1", "\(node)")
        
        // test property accessors
        
        var localZOrder = node.localZOrder
        localZOrder += 1
        node.localZOrder = localZOrder
        XCTAssert(node.localZOrder == localZOrder)
        
        var position = node.position
        XCTAssert(position.x == 0)
        XCTAssert(position.y == 0)
        position.x += 10
        position.y += 20
        
        node.position = position
        XCTAssert(node.position.x == position.x)
        XCTAssert(node.position.y == position.y)
    }

}
