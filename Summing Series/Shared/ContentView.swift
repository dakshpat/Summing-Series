//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfIterative = 1
    @ObservedObject var series = Series()

    var body: some View {
        VStack{
            
            Text("Consider a finite sum")
                .padding(.top)
                .padding(.bottom, 0)
                    
            HStack{
                Text("Enter N value here")
                TextField("Enter N", value: $numberOfIterative, format: .number)
                    .frame(width: 100)
            }
                    
            Group {
                Text("Sum using Series 1: \(series.method1Sum, specifier: "%.12f")")
                    .padding()

                Text("Sum using Series 2: \(series.method2Sum, specifier: "%.12f")")
                    .padding()

                Text("Sum using Series 3: \(series.method3Sum, specifier: "%.12f")")
                    .padding()
                        
            }
                    

                    
            Button("Calculate"){
                Task.init{
                  await series.initWithIteratives(numberOfIterative: numberOfIterative)
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
