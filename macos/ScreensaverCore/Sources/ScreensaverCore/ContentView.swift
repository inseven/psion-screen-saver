//
//  ContentView.swift
//  Screensaver Preview
//
//  Created by Jason Barrie Morley on 26/08/2025.
//

import SwiftUI

import AVKit

public struct ContentView: View {

    let player = AVPlayer(url: Bundle.module.url(forResource: "psion", withExtension: "mp4")!)

    public init() {
        
    }

    public var body: some View {
        VStack {
            AVPlayerControllerRepresented(player: player)
                .onAppear {
                    player.play()
                    addObserver()
                }
                .onDisappear {
                    removeObserver()
                }
                .frame(width: 380.0, height: 184.0)
        }
        .frame(width: 1024, height: 768)
        .background(.black)
    }

    func addObserver() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { _ in
            player.seek(to: .zero)
            player.play()
        }
    }

    func removeObserver() {
        NotificationCenter.default.removeObserver(self,
                                              name: .AVPlayerItemDidPlayToEndTime,
                                              object: nil)
    }

}

struct AVPlayerControllerRepresented : NSViewRepresentable {
    var player : AVPlayer

    func makeNSView(context: Context) -> AVPlayerView {
        let view = AVPlayerView()
        view.controlsStyle = .none
        view.player = player
        return view
    }

    func updateNSView(_ nsView: AVPlayerView, context: Context) {

    }
}

#Preview {
    ContentView()
}
