//
//  CameraView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 28/11/2023.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    var body: some View {
        Text("hello")
    }
}


struct CameraPickerView: UIViewControllerRepresentable {
    
    private var sourceType: UIImagePickerController.SourceType = .camera
    private let onImagePicked: (UIImage) -> Void
    
    @Environment(\.presentationMode) private var presentationMode
    
    public init(onImagePicked: @escaping (UIImage) -> Void) {
        self.onImagePicked = onImagePicked
    }
    
    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = self.sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { self.presentationMode.wrappedValue.dismiss() },
            onImagePicked: self.onImagePicked
        )
    }
    
    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        private let onDismiss: () -> Void
        private let onImagePicked: (UIImage) -> Void
        
        init(onDismiss: @escaping () -> Void, onImagePicked: @escaping (UIImage) -> Void) {
            self.onDismiss = onDismiss
            self.onImagePicked = onImagePicked
        }
        
        public func imagePickerController(_ picker: UIImagePickerController,
                                          didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.onImagePicked(image)
            }
            self.onDismiss()
        }
        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            self.onDismiss()
        }
    }
}



//struct Camera: UIViewControllerRepresentable {
//    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
//        // You can implement camera capture logic here
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let viewController = UIViewController()
//        let captureSession = AVCaptureSession()
//
//        if let device = AVCaptureDevice.default(for: .video) {
//            do {
//                let input = try AVCaptureDeviceInput(device: device)
//                captureSession.addInput(input)
//            } catch {
//                print("Error setting up camera input: \(error.localizedDescription)")
//            }
//        } else {
//            print("Video device not available")
//        }
//
//        // Add AVCaptureVideoPreviewLayer to display the camera feed
//        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        previewLayer.videoGravity = .resizeAspectFill
//        previewLayer.frame = viewController.view.layer.bounds
//        viewController.view.layer.addSublayer(previewLayer)
//
//        // Start the capture session
//        captureSession.startRunning()
//
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        // Update UI if needed
//    }
//}

#Preview {
    CameraView()
}
