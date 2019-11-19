///
/// BeaconID
///
/// Uniquely identifies an Eddystone compliant beacon.
///
@objc(BeaconID)
public class BeaconID : NSObject {

  enum BeaconType {
    case Eddystone              // 10 bytes namespace + 6 bytes instance = 16 byte ID
    case EddystoneEID           // 8 byte ID
  }

  let beaconType: BeaconType

  ///
  /// The raw beaconID data. This is typically printed out in hex format.
  ///
  let beaconID: [UInt8]

  init(beaconType: BeaconType!, beaconID: [UInt8]) {
    self.beaconID = beaconID
    self.beaconType = beaconType
  }

  @objc(getHexString)
  public func getHexString() -> String {
    hexBeaconID(beaconID: self.beaconID)
  }

  override public var description: String {
    if self.beaconType == BeaconType.Eddystone || self.beaconType == BeaconType.EddystoneEID {
      let hexid = hexBeaconID(beaconID: self.beaconID)
      return "BeaconID beacon: \(hexid)"
    } else {
      return "BeaconID with invalid type (\(beaconType))"
    }
  }

  private func hexBeaconID(beaconID: [UInt8]) -> String {
    var retval = ""
    for byte in beaconID {
      var s = String(byte, radix:16, uppercase: false)
      if s.count == 1 {
        s = "0" + s
      }
      retval += s
    }
    return retval
  }

}

func ==(lhs: BeaconID, rhs: BeaconID) -> Bool {
  if lhs == rhs {
    return true;
  } else if lhs.beaconType == rhs.beaconType
    && rhs.beaconID == rhs.beaconID {
      return true;
  }

  return false;
}
