// The Swift Programming Language
// https://docs.swift.org/swift-book

/// This macro adds a public async stream of a given type and a private continuation
///  to a class
///
///     `@CreateAsyncStream(of: Int.self, named: "numbers")`
///
/// adds the following members to the class:
/// `public var numbers: AsyncStream<Int> { _numbers }
/// `private let (_numbers, numbersContinuation)`
/// `   = AsyncStream.makeStream(of: Int.self)`
/// 
@attached(member, names: arbitrary)
public macro CreateAsyncStream<T>(of: T.Type, named: String)
       -> (AsyncStream<T>, AsyncStream<T>.Continuation)
= #externalMacro(module: "CreateAsyncStreamMacros",
                 type: "CreateAsyncStreamMacro")
