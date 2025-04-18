//
//  ScannedDevice.swift
//  RadarBluetoothTracker
//
//  Created by Rashad Milton on 4/18/25.
//

import Foundation

class ScannedDevice: Identifiable {
    let id = UUID()
    let name: String
    private var rssiValues: [Int] = []

    init(name: String, initialRSSI: Int) {
        self.name = name
        addRSSI(initialRSSI)
    }

    func addRSSI(_ value: Int) {
        rssiValues.append(value)
        if rssiValues.count > 10 {
            rssiValues.removeFirst() // keep last 10 values
        }
    }

    var smoothedRSSI: Int {
        guard !rssiValues.isEmpty else { return -100 }
        return rssiValues.reduce(0, +) / rssiValues.count
    }
}
