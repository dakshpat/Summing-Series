//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 2/2/22.
//

import SwiftUI

struct ContentView: View {
    
    //resulting values
    @State var order = 0
    @State var xValue = 0.0
    @State var upwardBessel = 0.0
    @State var downwardBessel = 0.0
    @State var relDiff = 0.0
    //initation an object of the class
    @ObservedObject var bessel = Bessel()
    
    
    var body: some View {
        VStack{
            Text("Bessel function calculator")
                .padding(.top)
                .padding(.bottom, 0)
            
            HStack{
                Text("Enter the Bessel Fucntion order: ")
                TextField("Enter Radius", value: $order, format: .number)
                    .frame(width: 100)
            }
            
            HStack{
                Text("Enter the x-value: ")
                TextField("Enter Radius", value: $xValue, format: .number)
                    .frame(width: 100)
            }
            
            Text("Calcualted using upward recursion: \(bessel.upwardRecursion, specifier: "%.12f")")
                    .padding()
                 

            Text("Calcualted using downward recursion: \(bessel.downwardRecursion, specifier: "%.12f")")
                    .padding()
            
            Text("Relative Differance:  \(relDiff, specifier: "%.12f")")
                    .padding()
                    

            
            Button("Calculate"){
                let start = order + 25
                
                Task.init {
                await bessel.initWithBessel(xValue: xValue, order: order, start: start)
                }
                
                relDiff = compare()
            }
                .padding()
            
        }
}
    
    func compare()-> Double{
        upwardBessel = bessel.upwardRecursion
        downwardBessel = bessel.downwardRecursion
        let relDiff = (abs(upwardBessel - downwardBessel)/abs(upwardBessel)) + abs(downwardBessel)
        return relDiff
    }
        
        
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

