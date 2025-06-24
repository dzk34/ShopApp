//
//  ServiceInjection.swift
//  ShopApp
//
//  Created by Khaled on 23/06/2025.
//

import Foundation

@propertyWrapper
struct Inject<T> {
    private let keyPath: WritableKeyPath<InjectedServiceValues, T>
    var wrappedValue: T {
        get { InjectedServiceValues[keyPath] }
        set { InjectedServiceValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedServiceValues, T>) {
        self.keyPath = keyPath
    }
}

public protocol InjectedServiceKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

struct InjectedServiceValues {
    private static var current = InjectedServiceValues()

    static subscript<K>(key: K.Type) -> K.Value where K : InjectedServiceKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    static subscript<T>(_ keyPath: WritableKeyPath<InjectedServiceValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
