//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by AT5HK on 1/8/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }
    
    
    func makeUIViewController(context: Context) -> ScannerVC {
        return ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        func didFind(barcode: String) {
            print(barcode)
            self.scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
            super.init() //you technically don't have to call super.init on NSOBject subclasses because NSObject doesn't initialize anything it just returns self
        }
    }
    
}

//struct ScannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScannerView(scannedCode: .constant("12356"), alertItem: .constant(nil))
//    }
//}
