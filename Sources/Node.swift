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
    
    internal final var internalPointer: UnsafeMutableRawPointer
    
    public final private(set) var children = [Node]()
    
    public final private(set) weak var parent: Node?
    
    // MARK: - Initialization
    
    /// For internal subclasses to directly initialize the internal pointer.
    @inline(__always)
    internal init(_ pointer: UnsafeMutableRawPointer) {
        
        self.internalPointer = pointer
    }
    
    /// Designated and overridable initializer for `Node`. 
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
    
    public final var isRunning: Bool {
        
        return __CCNodeGetRunning(internalPointer)
    }
    
    public final var boundingBox: Vector4 {
        
        return __CCNodeGetBoundingBox(internalPointer)
    }
    
    /// Get parent scene
    public final var scene: Scene? {
        
        // recusively get parent node
        var parent: Node = self
        var stop = false
        repeat {
            
            if let newParent = parent.parent {
                
                parent = newParent
                
            } else {
                
                stop = true
            }
            
        } while stop == false
        
        return parent as? Scene
    }
    
    // MARK: - Methods
    
    public final func add(child: Node) {
        
        // cannot add self recursively
        assert(child !== self, "Cannot add self as child node")
        
        // cannot add same child twice
        guard children.contains(where: { $0 === child }) == false else { return }
        
        __CCNodeAddChild(internalPointer, child.internalPointer)
        
        children.append(child)
        child.parent = self
    }
    
    public final func remove(child: Node, cleanup: Bool = true) {
        
        guard let childIndex = children.index(where: { $0 === child })
            else { return }
        
        __CCNodeRemoveChild(internalPointer, child.internalPointer, cleanup)
        
        self.children.remove(at: childIndex)
        child.parent = nil
    }
    
    @inline(__always)
    public final func removeFromParent(cleanup: Bool = true) {
        
        self.parent?.remove(child: self, cleanup: cleanup)
    }
    
    // MARK: - Subscripting
    
    /// Get child by tag.
    public final subscript(tag tag: Int) -> Node? {
        
        // TODO: Optimize to use C API and get child instance by comparing `internalPointer`
        return children.first(where: { $0.tag == tag })
    }
    
    /// Get child by tag.
    public final subscript(name name: String) -> Node? {
        
        // TODO: Optimize to use C API and get child instance by comparing `internalPointer`
        return children.first(where: { $0.name == name })
    }
}
