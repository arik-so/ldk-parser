
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias BigEndianScalar = Bindings.BigEndianScalar

			extension Bindings {

				/// Represents a scalar value between zero and the secp256k1 curve order, in big endian.
				internal class BigEndianScalar: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBigEndianScalar?

					public init(cType: LDKBigEndianScalar) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKBigEndianScalar, anchor: NativeTypeWrapper) {
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

						self.cType = LDKBigEndianScalar(big_endian_bytes: Bindings.arrayToUInt8Tuple32(value))

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Convenience function for constructing a new BigEndianScalar
					public init(bigEndianBytes: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BigEndianScalar_new(bigEndianBytes.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = BigEndianScalar(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(self.cType!)
					}

					internal func dangle() -> BigEndianScalar {
        				self.dangling = true
						return self
					}

										

				}

			}
		