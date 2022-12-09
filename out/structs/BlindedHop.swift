
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Used to construct the blinded hops portion of a blinded route. These hops cannot be identified
			/// by outside observers and thus can be used to hide the identity of the recipient.
			public typealias BlindedHop = Bindings.BlindedHop

			extension Bindings {
		

				/// Used to construct the blinded hops portion of a blinded route. These hops cannot be identified
				/// by outside observers and thus can be used to hide the identity of the recipient.
				public class BlindedHop: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBlindedHop?

					public init(cType: LDKBlindedHop) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKBlindedHop, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BlindedHop, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BlindedHop_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the BlindedHop object into a byte array which can be read by BlindedHop_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedHop>) in
				BlindedHop_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a BlindedHop from a byte array, created by BlindedHop_write
					public class func read(ser: [UInt8]) -> Result_BlindedHopDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = BlindedHop_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedHopDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> BlindedHop {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing BlindedHop \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BlindedHop \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		