
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias TwentyBytes = Bindings.TwentyBytes

			extension Bindings {

				/// A 20-byte byte array.
				internal class TwentyBytes: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTwentyBytes?

					public init(cType: LDKTwentyBytes) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKTwentyBytes, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKTwentyBytes(data: Bindings.arrayToUInt8Tuple20(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple20ToArray(self.cType!)
					}

					internal func dangle() -> TwentyBytes {
        				self.dangling = true
						return self
					}

										

				}

			}
		