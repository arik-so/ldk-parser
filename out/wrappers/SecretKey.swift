
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias SecretKey = Bindings.SecretKey

			extension Bindings {

				/// Represents a valid secp256k1 secret key serialized as a 32 byte array.
				internal class SecretKey: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSecretKey?

					public init(pointer: LDKSecretKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKSecretKey, anchor: NativeTypeWrapper) {
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

						self.cType = LDKSecretKey(bytes: Bindings.arrayToUInt8Tuple32(value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(self.cType!)
					}

					internal func dangle() -> SecretKey {
        				self.dangling = true
						return self
					}

										

				}

			}
		