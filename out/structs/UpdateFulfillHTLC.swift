
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An update_fulfill_htlc message to be sent or received from a peer
			public typealias UpdateFulfillHTLC = Bindings.UpdateFulfillHTLC

			extension Bindings {
		

				/// An update_fulfill_htlc message to be sent or received from a peer
				public class UpdateFulfillHTLC: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUpdateFulfillHTLC?

					public init(cType: LDKUpdateFulfillHTLC) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKUpdateFulfillHTLC, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UpdateFulfillHTLC, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UpdateFulfillHTLC_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel ID
					public func getChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_get_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The channel ID
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The HTLC ID
					public func getHtlcId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_get_htlc_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The HTLC ID
					public func setHtlcId(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_set_htlc_id(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The pre-image of the payment hash, allowing HTLC redemption
					public func getPaymentPreimage() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_get_payment_preimage(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The pre-image of the payment hash, allowing HTLC redemption
					public func setPaymentPreimage(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_set_payment_preimage(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new UpdateFulfillHTLC given each field
					public init(channelIdArg: [UInt8], htlcIdArg: UInt64, paymentPreimageArg: [UInt8]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let paymentPreimageArgPrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimageArg)
				

						// native method call
						let nativeCallResult = UpdateFulfillHTLC_new(channelIdArgPrimitiveWrapper.cType!, htlcIdArg, paymentPreimageArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentPreimageArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = UpdateFulfillHTLC(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the UpdateFulfillHTLC
					internal func clone() -> UpdateFulfillHTLC {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UpdateFulfillHTLC(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two UpdateFulfillHTLCs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: UpdateFulfillHTLC, b: UpdateFulfillHTLC) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the UpdateFulfillHTLC object into a byte array which can be read by UpdateFulfillHTLC_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				UpdateFulfillHTLC_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// Read a UpdateFulfillHTLC from a byte array, created by UpdateFulfillHTLC_write
					public class func read(ser: [UInt8]) -> Result_UpdateFulfillHTLCDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = UpdateFulfillHTLC_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_UpdateFulfillHTLCDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> UpdateFulfillHTLC {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> UpdateFulfillHTLC {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UpdateFulfillHTLC {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UpdateFulfillHTLC {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UpdateFulfillHTLC {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UpdateFulfillHTLC \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing UpdateFulfillHTLC \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		