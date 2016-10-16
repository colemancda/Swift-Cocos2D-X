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
    
    public final var children = [Node]()
    
    // MARK: - Initialization
    
    public init() {
        
        self.internalPointer = __CCNodeCreate()
    }
    
    // MARK: - Accessors
    
    public var description: String {
        
        return String(cString: __CCNodeGetDescription(internalPointer))
    }
    
    public final var localZOrder: Int {
        
        @inline(__always)
        get { return Int(__CCNodeGetLocalZOrder(internalPointer)) }
        
        @inline(__always)
        set { __CCNodeSetLocalZOrder(internalPointer, Int32(newValue)) }
    }
    
    public final var globalZOrder: Int {
        
        @inline(__always)
        get { return Int(__CCNodeGetGlobalZOrder(internalPointer)) }
        
        @inline(__always)
        set { __CCNodeSetGlobalZOrder(internalPointer, Int32(newValue)) }
    }
    
    public final var scaleX: Float {
        
        @inline(__always)
        get { return __CCNodeGetScaleX(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetScaleX(internalPointer, newValue) }
    }
    
    public final var scaleY: Float {
        
        @inline(__always)
        get { return __CCNodeGetScaleY(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetScaleY(internalPointer, newValue) }
    }
    
    public final var scaleZ: Float {
        
        @inline(__always)
        get { return __CCNodeGetScaleZ(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetScaleZ(internalPointer, newValue) }
    }
    
    public final var scale: Float {
        
        @inline(__always)
        get { return __CCNodeGetScale(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetScale(internalPointer, newValue) }
    }
    
    public final var position: Vector2 {
        
        @inline(__always)
        get { return __CCNodeGetPosition(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetPosition(internalPointer, newValue) }
    }
    
    public final var normalizedPosition: Vector2 {
        
        @inline(__always)
        get { return __CCNodeGetNormalizedPosition(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetNormalizedPosition(internalPointer, newValue) }
    }
    
    public final var position3D: Vector3 {
        
        @inline(__always)
        get { return __CCNodeGetPosition3D(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetPosition3D(internalPointer, newValue) }
    }
    
    public final var skewX: Float {
        
        @inline(__always)
        get { return __CCNodeGetSkewX(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetSkewX(internalPointer, newValue) }
    }
    
    public final var skewY: Float {
        
        @inline(__always)
        get { return __CCNodeGetSkewY(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetSkewY(internalPointer, newValue) }
    }
    
    public final var anchorPoint: Vector2 {
        
        @inline(__always)
        get { return __CCNodeGetAnchorPoint(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetAnchorPoint(internalPointer, newValue) }
    }
    
    public final var anchorPointInPoints: Vector2 {
        
        return __CCNodeGetAnchorPointInPoints(internalPointer)
    }
    
    public final var contentSize: Vector2 {
        
        @inline(__always)
        get { return __CCNodeGetContentSize(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetContentSize(internalPointer, newValue) }
    }
    
    public final var visible: Bool {
        
        @inline(__always)
        get { return __CCNodeGetVisible(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetVisible(internalPointer, newValue) }
    }
    
    public final var rotation: Float {
        
        @inline(__always)
        get { return __CCNodeGetRotation(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetRotation(internalPointer, newValue) }
    }
    
    public final var rotation3D: Vector3 {
        
        @inline(__always)
        get { return __CCNodeGetRotation3D(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetRotation3D(internalPointer, newValue) }
    }
    
    public final var rotationByQuaternion: Vector4 {
        
        @inline(__always)
        get { return __CCNodeGetRotationByQuaternion(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetRotationByQuaternion(internalPointer, newValue) }
    }
    
    public final var rotationSkewX: Float {
        
        @inline(__always)
        get { return __CCNodeGetRotationSkewX(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetRotationSkewX(internalPointer, newValue) }
    }
    
    public final var rotationSkewY: Float {
        
        @inline(__always)
        get { return __CCNodeGetRotationSkewY(internalPointer) }
        
        @inline(__always)
        set { __CCNodeSetRotationSkewY(internalPointer, newValue) }
    }
    
    public final var name: String {
        
        @inline(__always)
        get { return String(cString: __CCNodeGetName(internalPointer)) }
        
        @inline(__always)
        set { __CCNodeSetName(internalPointer, newValue) }
    }
    
    public final var tag: Int {
        
        @inline(__always)
        get { return Int(__CCNodeGetTag(internalPointer)) }
        
        @inline(__always)
        set { __CCNodeSetTag(internalPointer, Int32(newValue)) }
    }
    
    // MARK: - Methods
    
    @inline(__always)
    public final func add(child: Node) {
        
        __CCNodeAddChild(internalPointer, child.internalPointer)
        
        children.append(child) // for ARC and keeping type information
    }
    
    @inline(__always)
    public final func add(child: Node, localZOrder: Int) {
        
        __CCNodeAddChildWithLocalZOrder(internalPointer, child.internalPointer, Int32(localZOrder))
        
        children.append(child) // for ARC and keeping type information
    }
    
    @inline(__always)
    public final func add(child: Node, localZOrder: Int, tag: Int) {
        
        __CCNodeAddChildWithLocalZOrderAndTag(internalPointer, child.internalPointer, Int32(localZOrder), Int32(tag))
        
        children.append(child) // for ARC and keeping type information
    }
    
    @inline(__always)
    public final func add(child: Node, localZOrder: Int, name: String) {
        
        __CCNodeAddChildWithLocalZOrderAndName(internalPointer, child.internalPointer, Int32(localZOrder), name)
        
        children.append(child) // for ARC and keeping type information
    }
}
