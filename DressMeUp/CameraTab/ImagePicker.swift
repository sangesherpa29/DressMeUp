//
//  ImagePicker.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 03/12/2023.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isVisible: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisible: $isVisible)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var isVisible: Bool
        
        init(isVisible: Binding<Bool>) {
            _isVisible = isVisible
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            isVisible = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisible = false
        }
    }
}
