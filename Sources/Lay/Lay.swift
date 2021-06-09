//
//  Lay.swift
//  Lay
//
//  Created by ericliuhusky on 2021/6/9.
//

/// A protocol used to provide syntactic sugar of initializer
public protocol Lay {
    init()
}


// typealiases
extension Lay {
    /// A closure callback the type's instance who extends the Lay protocol
    public typealias Block = (Self) -> Void
    
    /// A closure callback the type's instance who extends the Lay protocol,
    /// and provide the ability of change this instance even when it' a value type
    public typealias InoutBlock = (inout Self) -> Void
}



// When the type who extends the Lay protocol is a value type
extension Lay where Self: Any {
    /// Init a type with a block
    /// - Parameter block: A closure that set properties' value inside it
    /// - Returns: The type of self
    @inlinable
    static func lay(_ block: InoutBlock) -> Self {
        var instance = self.init()
        block(&instance)
        return instance
    }
    
    /// Change the properties' value
    /// - Parameter block: A closure that change properties' value inside it
    @inlinable
    mutating func move(_ block: InoutBlock) {
        block(&self)
    }
}


// When the type who extends the Lay protocol is a reference type
extension Lay where Self: AnyObject {
    /// Init a type with a block
    /// - Parameter block: A closure that set properties' value inside it
    /// - Returns: The type of self
    @inlinable
    static func lay(_ block: Block) -> Self {
        let instance = self.init()
        block(instance)
        return instance
    }
    
    /// Change the properties' value
    /// - Parameter block: A closure that change properties' value inside it
    @inlinable
    func move(_ block: Block) {
        block(self)
    }
}
