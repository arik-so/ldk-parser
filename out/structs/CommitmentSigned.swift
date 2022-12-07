
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias CommitmentSigned = Bindings.CommitmentSigned

			extension Bindings {
		

				/// A commitment_signed message to be sent or received from a peer
				public class CommitmentSigned: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCommitmentSigned?

					public init(cType: LDKCommitmentSigned) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCommitmentSigned, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CommitmentSigned, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CommitmentSigned_free(self.cType!)

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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
			CommitmentSigned_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A signature on the commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentSigned>) in
			CommitmentSigned_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// A signature on the commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
			CommitmentSigned_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Signatures on the HTLC transactions
					/// 
					/// Returns a copy of the field.
					public func getHtlcSignatures() -> [[UInt8]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentSigned>) in
			CommitmentSigned_get_htlc_signatures(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_SignatureZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Signatures on the HTLC transactions
					public func setHtlcSignatures(val: [[UInt8]]) {
						// native call variable prep
						
						let valVector = Vec_SignatureZ(array: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
			CommitmentSigned_set_htlc_signatures(thisPtrPointer, valVector.cType!)
						}
			

						// cleanup
						
						valVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new CommitmentSigned given each field
					public init(channelIdArg: [UInt8], signatureArg: [UInt8], htlcSignaturesArg: [[UInt8]]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				
						let htlcSignaturesArgVector = Vec_SignatureZ(array: htlcSignaturesArg)
				

						// native method call
						let nativeCallResult = CommitmentSigned_new(channelIdArgPrimitiveWrapper.cType!, signatureArgPrimitiveWrapper.cType!, htlcSignaturesArgVector.cType!)

						// cleanup
						
						htlcSignaturesArgVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = CommitmentSigned(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the CommitmentSigned
					internal func clone() -> CommitmentSigned {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommitmentSigned>) in
			CommitmentSigned_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = CommitmentSigned(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two CommitmentSigneds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKCommitmentSigned>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKCommitmentSigned>) in
			CommitmentSigned_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the CommitmentSigned object into a byte array which can be read by CommitmentSigned_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCommitmentSigned>) in
			CommitmentSigned_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a CommitmentSigned from a byte array, created by CommitmentSigned_write
					public class func read(ser: [UInt8]) -> Result_CommitmentSignedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = CommitmentSigned_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CommitmentSignedDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> CommitmentSigned {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> CommitmentSigned {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing CommitmentSigned \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CommitmentSigned \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		