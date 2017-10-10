//: Playground - noun: a place where people can play

import UIKit

enum MathErrors: Error {
    case NotPossible
}

//TODO: Make generic
struct Scalar {
    
    var value: Int = 0
    
    init(_ value: Int) {
        self.value = value
    }
    
    // MARK: - Operators
    
    static func + (lhs: Scalar, rhs: Scalar) -> Scalar {
        let newValue = lhs.value + rhs.value
        return Scalar(newValue)
    }
    
    static func + (lhs: Scalar, rhs: Matrix) throws {
        throw MathErrors.NotPossible
    }
    
    static func * (lhs: Scalar, rhs: Matrix) -> Matrix {
        return rhs * lhs
    }
    
}

struct Matrix: CustomStringConvertible {
    
    var rows: [[Int]]
    
    init(_ rows: [[Int]]) {
        // check length of rows
        self.rows = rows
    }
    
    var description: String {
        var string = ""
        for row in rows {
            string += "\n( "
            for element in row {
                string += "\(element) "
            }
            string += ")"
            
        }
        
        return string
    }
    
    static func * (lhs: Matrix, rhs: Scalar) -> Matrix {
        
        var newRows = [[Int]]()
        for row in lhs.rows {
            var newRow = [Int]()
            
            for element in row {
                newRow.append(element * rhs.value)
            }
            
            newRows.append(newRow)
        }
        
        return Matrix(newRows)
        
    }
}

var ten = Scalar(10)
var twenty = Scalar(20)

// print(ten + twenty)

let matrix = Matrix([
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
    ])

print(matrix)
