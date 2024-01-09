//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by AT5HK on 1/7/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)

                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
//                Spacer()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
