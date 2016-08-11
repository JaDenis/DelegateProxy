//
//  Receivable.swift
//  DelegateProxy
//
//  Created by Ryo Aoyama on 8/10/16.
//  Copyright © 2016 Ryo Aoyama. All rights reserved.
//

public protocol Receivable {
    func send(arguments: Arguments)
}

public extension Receivable {
    func registerTo(delegateProxy: DelegateProxy, selector: Selector...) -> Self {
        delegateProxy.receiveSelectors(selector, receiver: self)
        return self
    }
}