//
//  ContentView.swift
//  RadarBluetoothTracker
//
//  Created by Rashad Milton on 4/18/25.
//

import SwiftUI

struct RadarView: View {
    @ObservedObject var viewModel: BluetoothRadarViewModel

    var body: some View {
        ZStack {
            // Radar Circles
            ForEach(1..<4) { i in
                Circle()
                    .stroke(Color.green.opacity(0.5), lineWidth: 1)
                    .frame(width: CGFloat(i) * 100, height: CGFloat(i) * 100)
            }

            // Devices (blips)
            ForEach(viewModel.devices) { device in
                BlipView(device: device)
            }
        }
        .frame(width: 300, height: 300)
        .background(Color.black)
        .clipShape(Circle())
        .padding()
    }
}

#Preview {
    RadarView(viewModel: BluetoothRadarViewModel())
}
