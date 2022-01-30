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
    @Published var method1Sum = 0.0
    @Published var method2Sum = 0.0
    @Published var method3Sum = 0.0
    
    func initWithIteratives(numberOfIterative: Int) async{
        self.numberOfIterative = numberOfIterative
        
        let _ = await withTaskGroup(of: Void.self) {
            TaskGroup in
            
            TaskGroup.addTask {let _ = await self.sumMethod1(numberOfIterative: self.numberOfIterative)}
            TaskGroup.addTask {let _ = await self.sumMethod2(numberOfIterative: self.numberOfIterative)}
            TaskGroup.addTask {let _ = await self.sumMethod3(numberOfIterative: self.numberOfIterative)}
        }
    }
    
//Calculate the function below
//  2N
//  __           n     n
//  \     ( - 1 )    -----
//  /__              n + 1
//   n=1
    
    func sumMethod1(numberOfIterative: Int) async-> Double{
        var n = 1.0
        var sum = 0.0
       
        for _ in 1...2*numberOfIterative{
            sum += (pow(-1,n)*n)/(n+1)
            n += 1.0
        }
        await newMethod1Sum(method1Sum: sum)
        return sum
    }

//Calculate the function below
//   N                N
//   __   2n+1        __     2n
// - \   ------   +   \     -----
//   /__   2n         /__    2n+1
//   n=1                n=1
        
    func sumMethod2(numberOfIterative: Int) async-> Double{
        var n = 1.0
        var sum1 = 0.0
        var sum2 = 0.0
           
        for _ in 1...numberOfIterative{
            sum1 += -(2*n-1)/(2*n)
            sum2 += (2*n)/(2*n+1)
            n += 1
           
        }
            await newMethod2Sum(method2Sum: sum1 + sum2)
            return sum1 + sum2
        }

//Calculate the function below
//  N
//  __       1
//  \      -----
//  /__  2n(2n + 1)
//   n=1
        
        func sumMethod3(numberOfIterative: Int) async-> Double{
            var n = 1.0
            var sum = 0.0
           
            for _ in 1...numberOfIterative{
                sum += (1)/(2*n*(2*n+1))
                n += 1
            }
            await newMethod3Sum(method3Sum: sum)
            return sum
        }
    
    @MainActor func newMethod1Sum(method1Sum: Double){
        self.method1Sum = method1Sum
    }
    
    @MainActor func newMethod2Sum(method2Sum: Double){
        self.method2Sum = method2Sum
    }
    
    @MainActor func newMethod3Sum(method3Sum: Double){
        self.method3Sum = method3Sum
    }
    
    

    
}

