import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem: NSStatusItem = ClockStatusItem()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {}
    
    func applicationWillTerminate(_ aNotification: Notification) {}
}
