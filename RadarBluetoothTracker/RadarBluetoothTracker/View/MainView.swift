//
//  ContentView.swift
//  RadarBluetoothTracker
//
//  Created by Rashad Milton on 4/18/25.
//
import SwiftUI


struct MainView: View {
    @StateObject var viewModel = BluetoothRadarViewModel()

    var body: some View {
        VStack {
            Text("Bluetooth Radar")
                .font(.title)
                .foregroundColor(.white)
            RadarView(viewModel: viewModel)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
