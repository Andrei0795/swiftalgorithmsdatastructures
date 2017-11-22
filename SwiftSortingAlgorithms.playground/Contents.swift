//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//INSERTION SORT ---------------------------------------------------------------------
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for i in 1..<a.count {
        var j = i
        while j > 0 && a[j] < a[j - 1] {
            a.swapAt(j - 1, j)
            j -= 1
        }
    }
    return a
}
let list = [ 2, 5, 7, 3, 1, 8, 4 ]
insertionSort(list)

//IMPROVED INSERTION SORT (WITH NO SWAP) ---------------------------------------------------------------------
func insertionSortImproved(_ array: [Int]) -> [Int] {
    var a = array
    for i in 1..<a.count {
        var j = i
        let aux = a[j]
        while j > 0 && aux < a[j - 1] {
            a[j] = a[j - 1]
            j -= 1
        }
        a[j] = aux
    }
    return a
}
let list2 = [ 2, 5, 7, 3, 1, 8, 4 ]
insertionSortImproved(list2)

//SELECTION SORT ---------------------------------------------------------------------
func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }  // 1
    
    var a = array                    // 2
    
    for x in 0 ..< a.count - 1 {     // 3
        
        var lowest = x
        for y in x + 1 ..< a.count {   // 4
            if a[y] < a[lowest] {
                lowest = y
            }
        }
        
        if x != lowest {               // 5
            a.swapAt(x, lowest)
        }
    }
    return a
}
let list3 = [ 2, 5, 7, 3, 1, 8, 4 ]
selectionSort(list3)


//MERGE SORT ---------------------------------------------------------------------
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

let list4 = [ 2, 5, 7, 3, 1, 8, 4 ]
mergeSort(list4)

//QUICK SORT ---------------------------------------------------------------------
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

let list5 = [ 2, 5, 7, 3, 1, 8, 4 ]
quicksort(list5)


//RADIX SORT ---------------------------------------------------------------------
func radixSort(_ array: inout [Int] ) {
    let radix = 10  //Here we define our radix to be 10
    var done = false
    var index: Int
    var digit = 1  //Which digit are we on?
    
    
    while !done {  //While our  sorting is not completed
        done = true  //Assume it is done for now
        
        var buckets: [[Int]] = []  //Our sorting subroutine is bucket sort, so let us predefine our buckets
        
        for _ in 1...radix {
            buckets.append([])
        }
        
        
        for number in array {
            index = number / digit  //Which bucket will we access?
            buckets[index % radix].append(number)
            if done && index > 0 {  //If we arent done, continue to finish, otherwise we are done
                done = false
            }
        }
        
        var i = 0
        
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        
        digit *= radix  //Move to the next digit
    }
}

var list6 = [ 2, 5, 7, 3, 1, 8, 4 ]
radixSort(&list6)


