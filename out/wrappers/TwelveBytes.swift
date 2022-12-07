
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias TwelveBytes = Bindings.TwelveBytes

			extension Bindings {

				/// A 12-byte byte array.
				internal class TwelveBytes: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTwelveBytes?

					public init(pointer: LDKTwelveBytes) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKTwelveBytes, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKTwelveBytes(data: Bindings.arrayToUInt8Tuple12(value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple12ToArray(self.cType!)
					}

					internal func dangle() -> TwelveBytes {
        				self.dangling = true
						return self
					}

										

				}

			}
		