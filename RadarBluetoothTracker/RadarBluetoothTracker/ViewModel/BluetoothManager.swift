//
//  BluetoothManager.swift
//  RadarBluetoothTracker
//
//  Created by Rashad Milton on 4/18/25.
//

import Foundation
import CoreBluetooth
import SwiftUI

class BluetoothRadarViewModel: NSObject, ObservableObject, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!
    
    @Published var devices: [ScannedDevice] = []
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        } else {
            print("Bluetooth not available")
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                       didDiscover peripheral: CBPeripheral,
                       advertisementData: [String : Any],
                       rssi RSSI: NSNumber) {
        guard let name = peripheral.name else { return }
        
        DispatchQueue.main.async {
            if let device = self.devices.first(where: { $0.name == name }) {
                device.addRSSI(RSSI.intValue)
            } else {
                let newDevice = ScannedDevice(name: name, initialRSSI: RSSI.intValue)
                self.devices.append(newDevice)
            }
        }
    }
}

