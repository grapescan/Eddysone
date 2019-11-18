import Foundation

///
/// EddystoneScannerDelegate
///
/// Implement this to receive notifications about beacons.
@objc(EddystoneScannerDelegate)
public protocol EddystoneScannerDelegate {
    @objc
  func didFindBeacon(beaconScanner: EddystoneScanner, beaconInfo: BeaconInfo)
    @objc
  func didLoseBeacon(beaconScanner: EddystoneScanner, beaconInfo: BeaconInfo)
    @objc
  func didUpdateBeacon(beaconScanner: EddystoneScanner, beaconInfo: BeaconInfo)
    @objc
  func didObserveURLBeacon(beaconScanner: EddystoneScanner, URL: NSURL, RSSI: Int)
}
