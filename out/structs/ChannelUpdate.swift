
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ChannelUpdate = Bindings.ChannelUpdate

			extension Bindings {
		

				/// A channel_update message to be sent or received from a peer
				public class ChannelUpdate: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelUpdate?

					public init(cType: LDKChannelUpdate) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelUpdate, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelUpdate, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdate_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A signature of the channel update
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdate>) in
			ChannelUpdate_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// A signature of the channel update
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdate>) in
			ChannelUpdate_set_signature(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The actual channel update
					public func getContents() -> UnsignedChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdate>) in
			ChannelUpdate_get_contents(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult)

						return returnValue
					}
		
					/// The actual channel update
					public func setContents(val: UnsignedChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdate>) in
			ChannelUpdate_set_contents(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new ChannelUpdate given each field
					public init(signatureArg: [UInt8], contentsArg: UnsignedChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdate_new(signatureArg.cType!, contentsArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the ChannelUpdate
					internal func clone() -> ChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelUpdate>) in
			ChannelUpdate_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two ChannelUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKChannelUpdate>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKChannelUpdate>) in
			ChannelUpdate_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the ChannelUpdate object into a byte array which can be read by ChannelUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelUpdate>) in
			ChannelUpdate_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a ChannelUpdate from a byte array, created by ChannelUpdate_write
					public class func read(ser: [UInt8]) -> Result_ChannelUpdateDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdate_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ChannelUpdateDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> ChannelUpdate {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ChannelUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUpdate \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		