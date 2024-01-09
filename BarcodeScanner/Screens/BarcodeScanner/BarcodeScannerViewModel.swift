//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by AT5HK on 1/8/24.
//

import Foundation
import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        get {
            return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
        }
    }
    
    var statusTextColor: Color {
        get {
            return scannedCode.isEmpty ? .red : .green
        }
    }
}
