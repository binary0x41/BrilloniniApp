

import SwiftUI

@main
struct Brillonini: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var popover: NSPopover!

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusBarItem.button {
            button.image = NSImage(systemSymbolName: "sun.max", accessibilityDescription: "Brillo")
            button.action = #selector(statusBarButtonClicked(_:))
        }

        popover = NSPopover()
        popover.contentViewController = NSHostingController(rootView: ContentView())
        popover.behavior = .transient
    }

    @objc func statusBarButtonClicked(_ sender: NSStatusBarButton?) {
        if let button = statusBarItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
        }
    }
}
