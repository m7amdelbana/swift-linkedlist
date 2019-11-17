//
//  exp1-linkedlist.swift
//  iOS
//
//  Created by Mohamed Elbana on 2019.
//  Copyright © 2019 m7amdelbana. All rights reserved.
//

// Like arrays, Linked List is a linear data structure.
// Unlike arrays, linked list elements are not stored at a contiguous location;
// the elements are linked using pointers in C and C++.
// This is a simple to how create a LinkedList in Swift.

import UIKit

// MARK:-  --------------- 1 ---------------

/// LinkedList Node
///
public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next)) "
    }
    
}

print("Example of creating and linking nodes")

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1)

// MARK:-  --------------- 2 ---------------

/// LinkedList
///
public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// 1. push
    /// Adds a value at the front of the list.
    ///
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// 2. append
    /// Adds a value at the end of the list
    ///
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    /// 3. seach
    /// Finding a particular node in the list
    ///
    public mutating func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    /// 4. insert
    /// Adds a value after a particular node of the list
    ///
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

print("Example of inserting at a particular index")

var list = LinkedList<Int>()

list.push(3)
list.push(2)
list.push(1)

print("Before inserting: \(list)")

var middleNode = list.node(at: 1)!

for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
}

print("After inserting: \(list)")
