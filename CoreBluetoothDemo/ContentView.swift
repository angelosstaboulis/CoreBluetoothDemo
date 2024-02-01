//
//  ContentView.swift
//  CoreBluetoothDemo
//
//  Created by Angelos Staboulis on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bluetooth = BluetoothViewModel()
    var body: some View {
            VStack{
                
                Text("CoreBluetoothDemo")
                Spacer()
                List(bluetooth.deviceNames,id:\.self){item in
                    Text(item)
                }
            }
        
    }
}

#Preview {
    ContentView()
}
