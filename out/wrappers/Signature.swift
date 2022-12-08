
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Signature = Bindings.Signature

			extension Bindings {

				/// Represents a secp256k1 signature serialized as two 32-byte numbers
				internal class Signature: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSignature?

					public init(cType: LDKSignature) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKSignature, anchor: NativeTypeWrapper) {
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

						self.cType = LDKSignature(compact_form: Bindings.arrayToUInt8Tuple64(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple64ToArray(self.cType!)
					}

					internal func dangle() -> Signature {
        				self.dangling = true
						return self
					}

										

				}

			}
		