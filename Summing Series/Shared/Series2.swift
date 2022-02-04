//
//  Series2.swift
//  Summing Series (iOS)
//
//  Created by Daksh Patel on 1/31/22.
//

import Foundation
import SwiftUI

class Series2: NSObject, ObservableObject {

    @Published var numberOfIterative = 0
    @Published var sumUpMethod = 0.0
    @Published var sumDownMethod = 0.0
    
    func initWithIteratives(numberOfIterative: Int) async{
        self.numberOfIterative = numberOfIterative
        
        let _ = await withTaskGroup(of: Void.self) {
            TaskGroup in
            
            TaskGroup.addTask {let _ = await self.sumMethodUp(numberOfIterative: self.numberOfIterative)}
            TaskGroup.addTask {let _ = await self.sumMethodDown(numberOfIterative: self.numberOfIterative)}
            
        }
    }
    
//Calculate the function below
//  N
//  __        1
//  \       -----
//  /__       n
//   n=1
    
    func sumMethodUp(numberOfIterative: Int) async-> Double{
        var n = 1.0
        var sum = 0.0
       
        for _ in 1...numberOfIterative{
            sum += 1/n
            n += 1.0
        }
        await newSumMethodUp(sumMethodUp: sum)
        return sum
    }


//Calculate the function below
//   1
//  __       1
//  \      -----
//  /__      n
//   n=N
        
        func sumMethodDown(numberOfIterative: Int) async-> Double{
            var n = numberOfIterative + 1
            var sum = 0.0
           
            for _ in 1...numberOfIterative{
                sum += 1/Double(n)
                n -= 1
                print(n)
            }
            await newSumMethodDown(sumMethodDown: sum)
            return sum
        }
    
// fucntions that update the class variables "sums" from different methods
    @MainActor func newSumMethodUp(sumMethodUp: Double){
        self.sumUpMethod = sumMethodUp
    }
    
    @MainActor func newSumMethodDown(sumMethodDown: Double){
        self.sumDownMethod = sumMethodDown
    }
    
}
