
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias RevokeAndACK = Bindings.RevokeAndACK

			extension Bindings {
		

				/// A revoke_and_ack message to be sent or received from a peer
				public class RevokeAndACK: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRevokeAndACK?

					public init(cType: LDKRevokeAndACK) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRevokeAndACK, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RevokeAndACK, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RevokeAndACK_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The channel ID
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
			RevokeAndACK_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The secret corresponding to the per-commitment point
					public func setPerCommitmentSecret(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
			RevokeAndACK_set_per_commitment_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The next sender-broadcast commitment transaction's per-commitment point
					public func getNextPerCommitmentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRevokeAndACK>) in
			RevokeAndACK_get_next_per_commitment_point(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// The next sender-broadcast commitment transaction's per-commitment point
					public func setNextPerCommitmentPoint(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
			RevokeAndACK_set_next_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new RevokeAndACK given each field
					public init(channelIdArg: [UInt8], perCommitmentSecretArg: [UInt8], nextPerCommitmentPointArg: [UInt8]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let perCommitmentSecretArgPrimitiveWrapper = ThirtyTwoBytes(value: perCommitmentSecretArg)
				
						let nextPerCommitmentPointArgPrimitiveWrapper = PublicKey(value: nextPerCommitmentPointArg)
				

						// native method call
						let nativeCallResult = RevokeAndACK_new(channelIdArgPrimitiveWrapper.cType!, perCommitmentSecretArgPrimitiveWrapper.cType!, nextPerCommitmentPointArgPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RevokeAndACK(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the RevokeAndACK
					internal func clone() -> RevokeAndACK {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRevokeAndACK>) in
			RevokeAndACK_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RevokeAndACK(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two RevokeAndACKs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKRevokeAndACK>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKRevokeAndACK>) in
			RevokeAndACK_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the RevokeAndACK object into a byte array which can be read by RevokeAndACK_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRevokeAndACK>) in
			RevokeAndACK_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a RevokeAndACK from a byte array, created by RevokeAndACK_write
					public class func read(ser: [UInt8]) -> Result_RevokeAndACKDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = RevokeAndACK_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_RevokeAndACKDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> RevokeAndACK {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> RevokeAndACK {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RevokeAndACK \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RevokeAndACK \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		