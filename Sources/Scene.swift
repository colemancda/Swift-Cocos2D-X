//
//  Scene.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/16/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import CCocos2D

open class Scene: Node {
    
    // MARK: - Initialization
    
    public override init() {
        
        // TODO: Set to initialize with Scene pointer
        // super.init(__CCSceneCreate())
        super.init(__CCNodeCreate())
    }
}
