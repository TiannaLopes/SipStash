//
//  CameraView.swift
//  SipStash
//
//  Created by Tianna Alina Lopes on 5/24/24.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    var handlePickedImage: (UIImage) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self, handlePickedImage: handlePickedImage)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: CameraView
        var handlePickedImage: (UIImage) -> Void

       init(_ parent: CameraView, handlePickedImage: @escaping (UIImage) -> Void) {
            self.parent = parent
            self.handlePickedImage = handlePickedImage
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)
            if let image = info[.originalImage] as? UIImage {
                handlePickedImage(image)
            }
        }
    }
}

