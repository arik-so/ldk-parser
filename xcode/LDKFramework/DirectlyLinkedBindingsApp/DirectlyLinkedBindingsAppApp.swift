//
//  DirectlyLinkedBindingsAppApp.swift
//  DirectlyLinkedBindingsApp
//
//  Created by Arik Sosman on 7/11/22.
//

import SwiftUI

@main
struct DirectlyLinkedBindingsAppApp: App {
    
    init() {
        print("Directly linked bindings app is initialized")
        
        let compiledVersion = Bindings.getLDKSwiftBindingsSerializationHash()
        print("Compiled version: \(compiledVersion)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
