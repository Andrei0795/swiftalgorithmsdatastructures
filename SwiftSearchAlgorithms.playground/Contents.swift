//: Playground - noun: a place where people can play

import UIKit
import Foundation

//LINEAR SEARCH --------------------------------------------------------------------------
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

let array = [18, 11, 42, 33, 29, 32, 5, 22, 19, 4, 0]
linearSearch(array, 33)


//INDEX(OF:) does also Linear Search --------------------------------------------------------------------------
let numbers = [18, 11, 42, 33, 29, 32, 5, 22, 19, 4, 0]

numbers.index(of: 33)


//BINARY SEARCH --------------------------------------------------------------------------
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        // If we get here, then the search key is not present in the array.
        return nil
        
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            
        } else {
            return midIndex
        }
    }
}

//!!! The binary search array must be sorted
let numbers2 = [0, 4, 5, 11, 18, 19, 22, 29, 32, 33, 42]

binarySearch(numbers2, key: 22, range: 0 ..< numbers.count)
