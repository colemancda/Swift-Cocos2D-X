//
//  Sprite.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/15/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import CCocos2D

open class Sprite: Node {
    
    // MARK: - Initialization
    
    public override init() {
        
        super.init(__CCSpriteCreate())
    }
}
