
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias PublicKey = Bindings.PublicKey

			extension Bindings {

				/// Represents a valid secp256k1 public key serialized in "compressed form" as a 33 byte array.
				internal class PublicKey: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPublicKey?

					public init(cType: LDKPublicKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPublicKey, anchor: NativeTypeWrapper) {
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

						self.cType = LDKPublicKey(compressed_form: Bindings.arrayToUInt8Tuple33(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple33ToArray(self.cType!)
					}

					internal func dangle() -> PublicKey {
        				self.dangling = true
						return self
					}

										

				}

			}
		