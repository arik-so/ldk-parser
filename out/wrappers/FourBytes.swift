
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias FourBytes = Bindings.FourBytes

			extension Bindings {

				/// A 4-byte byte array.
				internal class FourBytes: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFourBytes?

					public init(cType: LDKFourBytes) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKFourBytes, anchor: NativeTypeWrapper) {
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

						self.cType = LDKFourBytes(data: Bindings.arrayToUInt8Tuple4(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple4ToArray(self.cType!)
					}

					internal func dangle() -> FourBytes {
        				self.dangling = true
						return self
					}

										

				}

			}
		