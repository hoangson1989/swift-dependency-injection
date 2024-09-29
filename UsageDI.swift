//
//  UsageDI.swift
//  DependencyInjection
//
//  Created by Sonny Truong on 9/16/24.
//

import Foundation

protocol SomeProtocol {
    func doSomething()
}

struct SomeProtocolImp1 : SomeProtocol {
    func doSomething() {
        print("SomeProtocolImp1")
    }
}

struct SomeProtocolImp2 : SomeProtocol {
    func doSomething() {
        print("SomeProtocolImp2")
    }
}

///
private struct SomeProtocolKey : InjectionKey {
    static var currentValue: SomeProtocol = SomeProtocolImp1()
}
///
extension InjectedValues {
    var someProtocol : SomeProtocol {
        get { Self[SomeProtocolKey.self]}
        set { Self[SomeProtocolKey.self] = newValue }
    }
}
///
struct UsageDI {
    @Injected(\.someProtocol) var someProtocol : SomeProtocol
    
    func doSomething() {
        someProtocol.doSomething()
        
        InjectedValues[\.someProtocol] = SomeProtocolImp2()
        
        someProtocol.doSomething()
    }
}
