//
//  ContentView.swift
//  KeyboardExample
//
//  Created by Ralf Ebert on 02.09.21.
//

import SwiftUI
import KeyboardAware

struct ContentView: View {
    @ObservedObject var keyboardInfo = KeyboardInfo.shared
    @State var text = "example"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Keyboard height: \(keyboardInfo.height)")
                    ForEach(0 ..< 20) { i in
                        Text("Text \(i):")
                        TextField("Text", text: self.$text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 10)
                    }
                }
                .padding()
            }
            .keyboardAware()  // <--- the view modifier
            .navigationBarTitle("Keyboard Example")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
