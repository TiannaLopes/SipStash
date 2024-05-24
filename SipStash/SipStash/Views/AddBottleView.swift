//
//  AddBottleView.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import SwiftUI

struct AddBottleView: View {
    @ObservedObject var firebaseService = FirebaseService()
    @State private var showingScanner = false
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var volume: String = ""
    @State private var price: String = ""

    var body: some View {
        NavigationView {
            Form {
                Button("Scan Bottle Label") {
                    showingScanner = true
                }
                TextField("Name", text: $name)
                TextField("Type", text: $type)
                TextField("Volume (ml)", text: $volume)
                TextField("Price ($)", text: $price)
                Button("Add Bottle") {
                    let newBottle = Bottle(name: name, type: type, volume: Int(volume) ?? 0, price: Double(price))
                    firebaseService.addBottle(newBottle)
                }
            }
            .sheet(isPresented: $showingScanner) {
                CameraView() { image in
                    // Process image for OCR
                }
            }
            .navigationTitle("Add New Bottle")
        }
    }
}

