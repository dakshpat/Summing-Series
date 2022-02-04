//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfIterative = 1
    @State var numberOfIterative2 = 1
    @ObservedObject var series = Series()
    @ObservedObject var series2 = Series2()

    var body: some View {
        VStack{
            
            Text("Consider a finite sum")
                .padding(.top)
                .padding(.bottom, 0)
                    
            HStack{
                Text("Enter N value here")
                TextField("Enter N", value: $numberOfIterative2, format: .number)
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
                  await series.initWithIteratives(numberOfIterative: numberOfIterative2)
                }
            }
                .padding()
        }
        
        VStack{
            
            Text("Consider a different finite sum")
                .padding(.top)
                .padding(.bottom, 0)
                    
            HStack{
                Text("Enter N value here")
                TextField("Enter N", value: $numberOfIterative, format: .number)
                    .frame(width: 100)
            }
                    
            Group {
                Text("Sum using going up: \(series2.sumUpMethod, specifier: "%.12f")")
                    .padding()

                Text("Sum using going down: \(series2.sumDownMethod, specifier: "%.12f")")
                    .padding()
                        
            }
                    
            Button("Calculate"){
                Task.init{
                  await series2.initWithIteratives(numberOfIterative: numberOfIterative)
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
