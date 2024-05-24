//
//  FirebaseService.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import Firebase
import FirebaseFirestore

class FirebaseService: ObservableObject {
    @Published var bottles: [Bottle] = []
    private var db = Firestore.firestore()

    func fetchBottles() {
        db.collection("bottles").addSnapshotListener { querySnapshot, error in
            if let querySnapshot = querySnapshot {
                self.bottles = querySnapshot.documents.compactMap { document in
                    try? document.data(as: Bottle.self)
                }
            }
        }
    }

    func addBottle(_ bottle: Bottle) {
        try? db.collection("bottles").addDocument(from: bottle)
    }
}
