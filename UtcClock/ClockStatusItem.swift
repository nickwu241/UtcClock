import Cocoa

class ClockStatusItem: NSStatusItem {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let showSecondsMenuItem = NSMenuItem(title: "Show Seconds",
                                         action:  #selector(toggleShowSeconds),
                                         keyEquivalent: "")
    let dateFormatter = DateFormatter()

    var shouldShowSeconds = false;

    override init() {
        super.init()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "HH:mm"

        showSecondsMenuItem.target = self

        statusItem.menu = NSMenu()
        statusItem.menu!.addItem(showSecondsMenuItem)
        statusItem.menu!.addItem(withTitle: "Quit",
                                 action: #selector(NSApplication.terminate),
                                 keyEquivalent: "q")

        Timer.scheduledTimer(timeInterval: 1,
                             target: self,
                             selector: #selector(updateTime),
                             userInfo: nil,
                             repeats: true)
    }

    @objc func toggleShowSeconds() {
        shouldShowSeconds = !shouldShowSeconds
        if (shouldShowSeconds) {
            dateFormatter.dateFormat =  "HH:mm:ss"
            showSecondsMenuItem.state = .on
        } else {
            dateFormatter.dateFormat =  "HH:mm"
            showSecondsMenuItem.state = .off
        }
    }

    @objc func updateTime() {
        statusItem.button?.title = dateFormatter.string(from: Date()) + " UTC"
    }
}
