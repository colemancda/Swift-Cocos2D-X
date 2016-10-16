//
//  Node.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import CCocos2D

/// A Cocos2D node.
open class Node: CustomStringConvertible {
    
    // MARK: - Properties
    
    internal var internalPointer: UnsafeMutableRawPointer
    
    // MARK: - Initialization
    
    public init() {
        
        self.internalPointer = __CCNodeCreate()
    }
    
    // MARK: - Accessors
    
    public var description: String {
        
        return String(cString: __CCNodeGetDescription(internalPointer))
    }
    
    public final var localZOrder: Int {
        
        get { return Int(__CCNodeGetLocalZOrder(internalPointer)) }
        
        set { __CCNodeSetLocalZOrder(internalPointer, Int32(newValue)) }
    }
    
    public final var globalZOrder: Int {
        
        get { return Int(__CCNodeGetGlobalZOrder(internalPointer)) }
        
        set { __CCNodeSetGlobalZOrder(internalPointer, Int32(newValue)) }
    }
    
    public final var scaleX: Float {
        
        get { return __CCNodeGetScaleX(internalPointer) }
        
        set { __CCNodeSetScaleX(internalPointer, newValue) }
    }
    
    public final var scaleY: Float {
        
        get { return __CCNodeGetScaleY(internalPointer) }
        
        set { __CCNodeSetScaleY(internalPointer, newValue) }
    }
    
    public final var scaleZ: Float {
        
        get { return __CCNodeGetScaleZ(internalPointer) }
        
        set { __CCNodeSetScaleZ(internalPointer, newValue) }
    }
    
    public final var scale: Float {
        
        get { return __CCNodeGetScale(internalPointer) }
        
        set { __CCNodeSetScale(internalPointer, newValue) }
    }
    
    public final var position: Vector2 {
        
        get { return __CCNodeGetPosition(internalPointer) }
        
        set { __CCNodeSetPosition(internalPointer, newValue) }
    }
    
    public final var normalizedPosition: Vector2 {
        
        get { return __CCNodeGetNormalizedPosition(internalPointer) }
        
        set { __CCNodeSetNormalizedPosition(internalPointer, newValue) }
    }
    
    public final var position3D: Vector3 {
        
        get { return __CCNodeGetPosition3D(internalPointer) }
        
        set { __CCNodeSetPosition3D(internalPointer, newValue) }
    }
}
