//
//  BottleListView.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import SwiftUI

struct BottleListView: View {
    @ObservedObject var firebaseService = FirebaseService()
    
    var body: some View {
        NavigationView {
            List(firebaseService.bottles) { bottle in
                VStack(alignment: .leading) {
                    Text(bottle.name).font(.headline)
                    Text("Type: \(bottle.type)").font(.subheadline)
                    Text("Volume: \(bottle.volume)ml").font(.subheadline)
                    if let price = bottle.price {
                        Text("Price: $\(price)").font(.subheadline)
                    }
                }
            }
            .navigationTitle("Bottles")
        }
    }
}

