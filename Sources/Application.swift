//
//  Application.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/16/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import CCocos2D

public final class Application {
    
    // MARK: - Initialization
    
    public static let shared = Application()
    
    private init() {
        
        // initialize singleton
        __CCApplicationInit()
        
        // set application callbacks
        __CCApplicationSetInitGLContextAttributesCallback(InitGLContextAttributesCallback)
        __CCApplicationSetDidFinishLaunchingCallback(DidFinishLaunchingCallback)
        __CCApplicationSetDidEnterBackgroundCallback(DidEnterBackgroundCallback)
        __CCApplicationSetWillEnterForegroundCallback(WillEnterForegroundCallback)
    }
    
    // MARK: - Properties
    
    public weak var delegate: ApplicationDelegate?
    
    // MARK: - Methods
    
    public func run() {
        
        __CCApplicationRun()
    }
}

// MARK: - Supporting Types

public protocol ApplicationDelegate: class {
    
    func setupGLContextAttributes()
    
    func didFinishLaunching() -> Bool
    
    func didEnterBackground()
    
    func willEnterForeground()
}

// MARK: - Private Functions

private func InitGLContextAttributesCallback() {
    
    Application.shared.delegate?.setupGLContextAttributes()
}

private func DidFinishLaunchingCallback() -> Bool {
    
    return Application.shared.delegate?.didFinishLaunching() ?? true
}

private func DidEnterBackgroundCallback() {
    
    Application.shared.delegate?.didEnterBackground()
}

private func WillEnterForegroundCallback() {
    
    Application.shared.delegate?.willEnterForeground()
}


