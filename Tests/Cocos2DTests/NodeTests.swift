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

    func testProperties() {
        
        let node = Node()
        
        // description
        XCTAssert(node.description.isEmpty == false)
        XCTAssert(node.description == "<Node | Tag = -1", "\(node)")
        
        // localZOrder
        var localZOrder = node.localZOrder
        localZOrder += 1
        node.localZOrder = localZOrder
        XCTAssert(node.localZOrder == localZOrder)
        
        // position
        var position = node.position
        XCTAssert(position.x == 0)
        XCTAssert(position.y == 0)
        position.x += 10
        position.y += 20
        node.position = position
        XCTAssert(node.position.x == position.x)
        XCTAssert(node.position.y == position.y)
        
        // name
        XCTAssert(node.name.isEmpty)
        let name = "My Node"
        node.name = name
        XCTAssert(node.name == name)
    }
    
    func testChildren() {
        
        let node = Node()
        node.name = "parent"
        
        let childNode = Node()
        childNode.name = "child"
        
        node.add(child: node)
        
        XCTAssert(node.children.count == 1)
    }
}
