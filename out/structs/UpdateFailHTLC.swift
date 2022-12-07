
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias UpdateFailHTLC = Bindings.UpdateFailHTLC

			extension Bindings {
		

				/// An update_fail_htlc message to be sent or received from a peer
				public class UpdateFailHTLC: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUpdateFailHTLC?

					public init(pointer: LDKUpdateFailHTLC) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKUpdateFailHTLC, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UpdateFailHTLC, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UpdateFailHTLC_free(self.cType!)

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
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_set_channel_id(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The HTLC ID
					public func getHtlcId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_get_htlc_id(thisPtrPointer)
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
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_set_htlc_id(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the UpdateFailHTLC
					internal func clone() -> UpdateFailHTLC {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = UpdateFailHTLC(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two UpdateFailHTLCs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the UpdateFailHTLC object into a byte array which can be read by UpdateFailHTLC_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUpdateFailHTLC>) in
			UpdateFailHTLC_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a UpdateFailHTLC from a byte array, created by UpdateFailHTLC_write
					public class func read(ser: [UInt8]) -> Result_UpdateFailHTLCDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UpdateFailHTLC_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_UpdateFailHTLCDecodeErrorZ(pointer: nativeCallResult)

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
		

					internal func dangle() -> UpdateFailHTLC {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> UpdateFailHTLC {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing UpdateFailHTLC \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UpdateFailHTLC \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		