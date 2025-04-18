//
//  BlipView.swift
//  RadarBluetoothTracker
//
//  Created by Rashad Milton on 4/18/25.
//

import SwiftUI


struct BlipView: View {
    var device: ScannedDevice

    var body: some View {
        let radius = mapRSSIToRadius(rssi: device.smoothedRSSI)
        let angle = Double(device.id.uuidString.hash % 360)
        let x = cos(angle * .pi / 180) * radius
        let y = sin(angle * .pi / 180) * radius

        return Circle()
            .fill(Color.blue)
            .frame(width: 10, height: 10)
            .offset(x: x, y: y)
            .animation(.easeOut(duration: 0.5), value: x)
            .overlay(
                Text(device.name.prefix(6))
                    .font(.caption2)
                    .foregroundColor(.white)
                    .offset(x: x + 8, y: y + 8)
            )
    }

    func mapRSSIToRadius(rssi: Int) -> CGFloat {
        // RSSI typically ranges from -30 (near) to -90 (far)
        let normalized = CGFloat(max(min(rssi, -30), -90) + 90) / 60.0
        return normalized * 140 // max radius
    }
}
