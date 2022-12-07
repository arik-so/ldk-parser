
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ClosingSigned = Bindings.ClosingSigned

			extension Bindings {
		

				/// A closing_signed message to be sent or received from a peer
				public class ClosingSigned: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKClosingSigned?

					public init(pointer: LDKClosingSigned) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKClosingSigned, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ClosingSigned, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingSigned_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The channel ID
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_set_channel_id(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The proposed total fee for the closing transaction
					public func getFeeSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_get_fee_satoshis(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The proposed total fee for the closing transaction
					public func setFeeSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_set_fee_satoshis(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A signature on the closing transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(pointer: nativeCallResult)

						return returnValue
					}
		
					/// A signature on the closing transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_set_signature(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The minimum and maximum fees which the sender is willing to accept, provided only by new
					/// nodes.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getFeeRange() -> ClosingSignedFeeRange? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_get_fee_range(thisPtrPointer)
						}
			

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKClosingSignedFeeRange
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = ClosingSignedFeeRange(pointer: nativeCallResult)

						return returnValue
					}
		
					/// The minimum and maximum fees which the sender is willing to accept, provided only by new
					/// nodes.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setFeeRange(val: ClosingSignedFeeRange) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_set_fee_range(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new ClosingSigned given each field
					public init(channelIdArg: [UInt8], feeSatoshisArg: UInt64, signatureArg: [UInt8], feeRangeArg: ClosingSignedFeeRange) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingSigned_new(channelIdArg.cType!, feeSatoshisArg, signatureArg.cType!, feeRangeArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ClosingSigned(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the ClosingSigned
					internal func clone() -> ClosingSigned {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ClosingSigned(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two ClosingSigneds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKClosingSigned>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the ClosingSigned object into a byte array which can be read by ClosingSigned_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClosingSigned>) in
			ClosingSigned_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a ClosingSigned from a byte array, created by ClosingSigned_write
					public class func read(ser: [UInt8]) -> Result_ClosingSignedDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingSigned_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ClosingSignedDecodeErrorZ(pointer: nativeCallResult)

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
		

					internal func dangle() -> ClosingSigned {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ClosingSigned {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ClosingSigned \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ClosingSigned \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		