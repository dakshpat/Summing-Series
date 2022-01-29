//
//  Series.swift
//  Summing Series
//
//  Created by Daksh Patel on 1/29/22.
//

import Foundation
import SwiftUI


class Series: NSObject, ObservableObject {

    @Published var numberOfIterative = 0
    
    override init (){
        numberOfIterative = 1
    }
    
//  2N
//  __           n     n
//  \     ( - 1 )    -----
//  /__              n + 1
//   n=1
    
    func sumMethod1(numberOfIterative: Int)-> Double{
        var n = 1.0
        var sum = 0.0
       
        for _ in 1...numberOfIterative{
            sum += (pow(-1,n)*n)/(n+1)
            n += 1.0
        }
        return sum
    }

//   N                N
//   __   2n+1        __     2n
// - \   ------   +   \     -----
//   /__   2n         /__    2n+1
//   n=1                n=1
        
    func sumMethod2(numberOfIterative: Int)-> Double{
        var n = 1.0
        var sum1 = 0.0
        var sum2 = 0.0
           
        for _ in 1...numberOfIterative{
            sum1 += -(2*n-1)/(2*n)
            sum2 += (2*n)/(2*n+1)
            n += 1
           
        }
            return sum1 + sum2
        }
    
//  N
//  __       1
//  \      -----
//  /__  2n(2n + 1)
//   n=1
        
        func sumMethod3(numberOfIterative: Int)-> Double{
            var n = 1.0
            var sum = 0.0
           
            for _ in 1...numberOfIterative{
                sum += (1)/(2*n*(2*n+1))
                n += 1
            }
            return sum
        }

    
}

