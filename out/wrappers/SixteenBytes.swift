
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias SixteenBytes = Bindings.SixteenBytes

			extension Bindings {

				/// A 16-byte byte array.
				internal class SixteenBytes: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSixteenBytes?

					public init(cType: LDKSixteenBytes) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKSixteenBytes, anchor: NativeTypeWrapper) {
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

						self.cType = LDKSixteenBytes(data: Bindings.arrayToUInt8Tuple16(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple16ToArray(self.cType!)
					}

					internal func dangle() -> SixteenBytes {
        				self.dangling = true
						return self
					}

										

				}

			}
		