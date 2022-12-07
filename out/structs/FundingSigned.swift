
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias FundingSigned = Bindings.FundingSigned

			extension Bindings {
		

				/// A funding_signed message to be sent or received from a peer
				public class FundingSigned: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFundingSigned?

					public init(cType: LDKFundingSigned) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKFundingSigned, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FundingSigned, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FundingSigned_free(self.cType!)

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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
			FundingSigned_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The signature of the channel acceptor (fundee) on the initial commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingSigned>) in
			FundingSigned_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The signature of the channel acceptor (fundee) on the initial commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
			FundingSigned_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new FundingSigned given each field
					public init(channelIdArg: [UInt8], signatureArg: [UInt8]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				

						// native method call
						let nativeCallResult = FundingSigned_new(channelIdArgPrimitiveWrapper.cType!, signatureArgPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = FundingSigned(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the FundingSigned
					internal func clone() -> FundingSigned {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFundingSigned>) in
			FundingSigned_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = FundingSigned(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two FundingSigneds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKFundingSigned>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKFundingSigned>) in
			FundingSigned_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the FundingSigned object into a byte array which can be read by FundingSigned_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFundingSigned>) in
			FundingSigned_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a FundingSigned from a byte array, created by FundingSigned_write
					public class func read(ser: [UInt8]) -> Result_FundingSignedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = FundingSigned_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_FundingSignedDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> FundingSigned {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> FundingSigned {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing FundingSigned \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FundingSigned \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		