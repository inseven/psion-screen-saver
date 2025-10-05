//
//  MainVew.swift
//  PsionScreenSaver
//
//  Created by Jason Barrie Morley on 26/08/2025.
//

import ScreenSaver
import SwiftUI

import ScreensaverCore

class MainView: ScreenSaverView {

    var timer: Timer? = nil

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        wantsLayer = true
        let contentView = ContentView()
        let hostingController = NSHostingController(rootView: contentView)
        hostingController.view.frame = bounds
        hostingController.view.autoresizingMask = [.width, .height]
        addSubview(hostingController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func startAnimation() {
        super.startAnimation()
    }

    override func stopAnimation() {
        super.stopAnimation()
    }

    override func draw(_ rect: NSRect) {
        NSColor.black.setFill()
        rect.fill()
    }

    override func animateOneFrame() {
    }

    override class func performGammaFade() -> Bool {
        return true
    }

    override var hasConfigureSheet: Bool {
        return true
    }

    private var sheet: NSWindow? = nil

    override var configureSheet: NSWindow? {
        let configurationView = ConfigurationView { [self] in
            guard let sheet else {
                return
            }
            window?.endSheet(sheet)
            self.sheet = nil
        }
        let controller = NSHostingController(rootView: configurationView)
        sheet = NSPanel(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 200),
            styleMask: [.titled, .closable],
            backing: .buffered,
            defer: false
        )
        sheet?.contentViewController = controller
        return sheet
    }

}

struct ConfigurationView: View {

    let dismiss: () -> Void

    var body: some View {
        Form {
            Text("Foo")
            Text("Bar")
            Text("Baz")
        }
        .formStyle(.grouped)
        .padding()
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("OK") {
                    dismiss()
                }
            }
        }
        .frame(width: 400, height: 300)
    }

}
