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
        VStack {

        }
        .onAppear {
            // some logic here too
        }
        .overlay(Camera())
    }
}


struct Camera: UIViewControllerRepresentable {
    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
        // You can implement camera capture logic here
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let captureSession = AVCaptureSession()

        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                captureSession.addInput(input)
            } catch {
                print("Error setting up camera input: \(error.localizedDescription)")
            }
        } else {
            print("Video device not available")
        }

        // Add AVCaptureVideoPreviewLayer to display the camera feed
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = viewController.view.layer.bounds
        viewController.view.layer.addSublayer(previewLayer)

        // Start the capture session
        captureSession.startRunning()

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update UI if needed
    }
}

#Preview {
    CameraView()
}
