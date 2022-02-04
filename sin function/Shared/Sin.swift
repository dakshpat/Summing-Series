//
//  Sin.swift
//  sin function
//
//  Created by Daksh Patel on 2/3/22.
//

import Foundation
import SwiftUI

class Sin: NSObject, ObservableObject {

    @Published var sinApprox = 0.0
    @Published var sinExact = 0.0
    @Published var xValue = 0.0

    
    func initWithSin(xValue: Double) async{
        self.xValue = xValue
        
        let _ = await withTaskGroup(of: Void.self) {
            TaskGroup in
            
            TaskGroup.addTask {let _ = await self.calculateSinApprox(xValue: xValue)}
            TaskGroup.addTask {let _ = await self.calculateSinExact(xValue: xValue)}

        }
    }
    
// a function that calculates the factorial of a number

    func factorial(number: Int)-> Int{
        if number == 0 {
            return 1
        }
        
        return number * factorial(number: number - 1)
    }
    
//Calculate the function below which is the taylor expansion of sin
//  N            n-1      2n-1
//  __     ( - 1 )      x               i * j
//  \       --------------------- = --------------
//  /__         (2n - 1)!                 k
//   n=1
    
    func calculateSinApprox(xValue: Double) async-> Double{
        var n = 1
        var sum = 0.0
        var nextTerm = 10.0
        
        while nextTerm >= (10E-7)*sum{
            let k = factorial(number: 2*n-1)
            let i = pow(-1.0, Double(n) - 1)
            let j = pow(xValue, 2*Double(n) - 1)
            nextTerm = (i*j)/Double(k)
            sum += nextTerm
            n += 1
        }
        await updateSinApprox(sinValue: sum)
        return sum
    }

//Gives the exact sin value for a given x value
//   sin(x)
        
    func calculateSinExact(xValue: Double) async-> Double{
        
        let sin = sin(xValue)
        
            await updateSinExact(sinValue: sin)
            return sin
        }

    
    @MainActor func updateSinApprox(sinValue: Double){
        self.sinApprox = sinValue
    }
    
    @MainActor func updateSinExact(sinValue: Double){
        self.sinExact = sinValue
    }
    
}
