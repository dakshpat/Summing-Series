//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var sumMethod1 = 0.0
    @State var sumMethod2 = 0.0
    @State var sumMethod3 = 0.0
    @ObservedObject var series = Series()

    var body: some View {
        VStack{
            
            Text("Enter the number of Iterations N")
                .padding(.top)
                .padding(.bottom, 0)
                    
            HStack{
                Text("Enter N value here")
                TextField("Enter N", value: $series.numberOfIterative, format: .number)
            }
                    
            Group {
                Text("Sum using Series 1: \(sumMethod1, specifier: "%.12f")")
                    .padding()

                Text("Sum using Series 2: \(sumMethod2, specifier: "%.12f")")
                    .padding()

                Text("Sum using Series 3: \(sumMethod3, specifier: "%.12f")")
                    .padding()
                        
            }
                    

                    
            Button("Calculate"){
                self.sumMethod1 = series.sumMethod1(numberOfIterative: series.numberOfIterative)
                        
                self.sumMethod2 = series.sumMethod2(numberOfIterative: series.numberOfIterative)
                
                self.sumMethod3 = series.sumMethod3(numberOfIterative: series.numberOfIterative)
                
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
