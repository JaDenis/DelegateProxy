//
//  DelegateTester.swift
//  DelegateProxy
//
//  Created by Ryo Aoyama on 8/13/16.
//  Copyright © 2016 Ryo Aoyama. All rights reserved.
//

import DelegateProxy

@objc protocol TestDelegate {
    optional func intEvent(value: Int)
}

@objc protocol TestInheritedDelegate: TestDelegate {
    optional func boolEvent(value: Bool)
}

final class DelegateTester: NSObject {
    weak var delegate: TestDelegate?
    
    func sendIntEvent(value: Int) {
        delegate?.intEvent!(value)
    }
}

final class InheritedDelegateTester: NSObject {
    weak var delegate: TestInheritedDelegate?
    
    func sendIntEvent(value: Int) {
        delegate?.intEvent!(value)
    }
    
    func sendBoolEvent(value: Bool) {
        delegate?.boolEvent!(value)
    }
}

final class TestDelegateProxy: DelegateProxy, TestDelegate, DelegateProxyType {
    func resetDelegateProxy(owner: DelegateTester) {
        owner.delegate = self
    }
}
final class TestInheritedDelegateProxy: DelegateProxy, TestInheritedDelegate, DelegateProxyType {
    func resetDelegateProxy(owner: InheritedDelegateTester) {
        owner.delegate = self
    }
}
final class DelegateImplementedProxy: DelegateProxy, TestDelegate {
    private(set) var receivedValues = [Int]()
    
    func intEvent(value: Int) {
        receivedValues.append(value)
    }
}

extension DelegateTester {
    var delegateProxy: TestDelegateProxy {
        return .proxyFor(self)
    }
}