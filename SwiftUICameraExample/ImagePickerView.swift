//
//  ImagePickerView.swift
//  SwiftUICameraExample
//
//  Created by Dylan Grunig on 3/20/23.
//

import Foundation
import UIKit
import SwiftUI


struct ImagePickerView:UIViewControllerRepresentable{

    @Binding var selectedImage:UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator{
        return Coordinator(picker: self)
    }
}


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var picker: ImagePickerView

    init(picker: ImagePickerView) {
        self.picker = picker
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
        info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage{
            self.picker.selectedImage = selectImage
            self.picker.isPresented.wrappedValue.dismiss()
        }
    }
    
}
