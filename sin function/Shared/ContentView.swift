//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var sin = Sin()
    
    var body: some View {
        VStack{
            
            Text("Sin calculator")
                .padding(.top)
                .padding(.bottom, 0)
                .frame(width: 100)
            HStack{
                Text("Enter x value here")
                TextField("Enter N", value: $sin.xValue, format: .number)
                    .frame(width: 100)
            }
                    
            Group {
                Text("Approximate Sin(x) = \(sin.sinApprox, specifier: "%.6f")")
                    .padding()

                Text("Exact Sin(x) =  \(sin.sinExact, specifier: "%.6f")")
                    .padding()
                        
            }
                    
            Button("Calculate"){
                Task.init{
                    await sin.initWithSin(xValue: sin.xValue)
                }
            }
                .padding()
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
