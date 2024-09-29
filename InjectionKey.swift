//
//  InjectionKey.swift
//  DependencyInjection
//
//  Created by Sonny Truong on 9/16/24.
//

import Foundation

public protocol InjectionKey {
    associatedtype Value
    
    /// The default value for the dependency injection key.
    static var currentValue : Self.Value { get set }
}
