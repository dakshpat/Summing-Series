//
//  bessel.swift
//  test
//
//  Created by Daksh Patel on 2/2/22.
//


import Foundation
import SwiftUI

class Bessel: NSObject, ObservableObject{
    
    @Published var upwardRecursion = 0.0
    @Published var downwardRecursion = 0.0
    
func initWithBessel(xValue: Double, order: Int, start: Int) async{
    
    let _ = await withTaskGroup(of: Void.self) {
        TaskGroup in
            
        TaskGroup.addTask {let _ = await self.calculateDownwardRecursion(xValue: xValue, order: order, start: start)}
        TaskGroup.addTask {let _ = await self.calculateUpwardRecursion(xValue: xValue, order: order)}
        }
    }
    
    
    
/* Calculate Bessel functions using downward recursion */
/// calculateDownwardRecursion
/// - Parameters:
///   - xValue: x
///   - order: Order of Bessel Function
///   - start: Starting Order
///               2l
///     J       (x)  =   ------ J  (x)   -  J        (x)
///      l - 1              x       l             l + 1
///
///
    
func calculateDownwardRecursion(xValue: Double, order: Int, start: Int) async-> Double
{
    var scale = await calculateFirstBessel(xValue: xValue) /* jSub0 which we know. Used for scaling the downward recursion */
    
    var jSubl = Array(repeating: 0.0, count: start + 2) /* jSubl is an array that holds the various orders of the Bessel Function */
    
    
    jSubl[start+1] = 1.0                   // start with "guess"
    jSubl[start] = 1.0                      // start with "guess"
    
    for index in (1...start).reversed(){
        
        jSubl[index-1] = ((2.0*(Double(index)))/xValue)*jSubl[index] - jSubl[index+1]
    }
    
    scale = (scale)/jSubl[0];      /* scale the result */
    downwardRecursion = jSubl[order]*(scale)
    return(jSubl[order]*(scale))
}
    
    
/* Calculate Bessel functions using upward recursion */
/// calculateUpwardRecursion
/// - Parameters:
///   - xValue: x
///   - order: Order of Bessel Function
///                2l
///     J          (x)  =   ------  J  (x)  -  J       (x)
///       l + 1              x        l            l - 1
///
///

func calculateUpwardRecursion(xValue: Double, order: Int) async-> Double
{
    var firstBessel = 0.0  /* temporary placeholders through the upward recursion */
    var secondBessel = 0.0 /* temporary placeholders through the upward recursion */
    var thirdBessel = 0.0; /* holds final Bessel Function result */
    
    
    firstBessel = await calculateFirstBessel(xValue: xValue)                    /* start with lowest order */
    if (order == 0) {
        thirdBessel = firstBessel
    }
    else {
        
        secondBessel = await calculateSecondBessel(xValue: xValue)
        for index in (1..<order)             /* loop for order of function */
        {
            thirdBessel = ((2.0*(Double(index)))/xValue)*secondBessel - firstBessel       // recursion relation
            firstBessel = secondBessel
            secondBessel = thirdBessel
        }
    }
    upwardRecursion = thirdBessel
    return(thirdBessel)
}

    /// calculateFirstBessel
    /// - Parameter xValue: x
    /// - Returns: first Bessel Functio

    //        sin(x)
    //      --------
    //          x
    //
func calculateFirstBessel(xValue: Double) async-> Double{
        
    let sum = sin(xValue)/xValue
    
    return sum
}
    
    /// calculateSecondBessel
    /// - Parameter xValue: x
    /// - Returns: second Bessel Function
    //       sin(x)     cos(x)
    //      -------- - --------
    //        x^2        x
    //
    
func calculateSecondBessel(xValue: Double) async-> Double{
    
    let sum = (sin(xValue)/pow(xValue,2)) - (cos(xValue)/xValue)
    return sum
    
}
    
}

