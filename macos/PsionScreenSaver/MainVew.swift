// Copyright (c) 2025 Jason Morley
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
