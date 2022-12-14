
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Onion messages can be sent and received to blinded paths, which serve to hide the identity of
			/// the recipient.
			public typealias BlindedPath = Bindings.BlindedPath

			extension Bindings {
		

				/// Onion messages can be sent and received to blinded paths, which serve to hide the identity of
				/// the recipient.
				public class BlindedPath: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBlindedPath?

					internal init(cType: LDKBlindedPath) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKBlindedPath, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BlindedPath, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BlindedPath_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the BlindedPath
					internal func clone() -> BlindedPath {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedPath>) in
				BlindedPath_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BlindedPath(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Create a blinded path to be forwarded along `node_pks`. The last node pubkey in `node_pks`
					/// will be the destination node.
					/// 
					/// Errors if less than two hops are provided or if `node_pk`(s) are invalid.
					public class func new(nodePks: [[UInt8]], keysManager: KeysInterface) -> Result_BlindedPathNoneZ {
						// native call variable prep
						
						let nodePksVector = Vec_PublicKeyZ(array: nodePks).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: keysManager.activate().cType!) { (keysManagerPointer: UnsafePointer<LDKKeysInterface>) in
				BlindedPath_new(nodePksVector.cType!, keysManagerPointer)
						}
				

						// cleanup
						
						// nodePksVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the BlindedPath object into a byte array which can be read by BlindedPath_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedPath>) in
				BlindedPath_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a BlindedPath from a byte array, created by BlindedPath_write
					public class func read(ser: [UInt8]) -> Result_BlindedPathDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = BlindedPath_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> BlindedPath {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> BlindedPath {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> BlindedPath {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> BlindedPath {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> BlindedPath {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BlindedPath \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing BlindedPath \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		