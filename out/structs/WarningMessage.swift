
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A warning message to be sent or received from a peer
			public typealias WarningMessage = Bindings.WarningMessage

			extension Bindings {
		

				/// A warning message to be sent or received from a peer
				public class WarningMessage: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWarningMessage?

					public init(cType: LDKWarningMessage) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKWarningMessage, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the WarningMessage, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = WarningMessage_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel ID involved in the warning.
					/// 
					/// All-0s indicates a warning unrelated to a specific channel.
					public func getChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKWarningMessage>) in
				WarningMessage_get_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The channel ID involved in the warning.
					/// 
					/// All-0s indicates a warning unrelated to a specific channel.
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKWarningMessage>) in
				WarningMessage_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A possibly human-readable warning description.
					/// The string should be sanitized before it is used (e.g. emitted to logs or printed to
					/// stdout). Otherwise, a well crafted error message may trigger a security vulnerability in
					/// the terminal emulator or the logging subsystem.
					public func getData() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKWarningMessage>) in
				WarningMessage_get_data(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// A possibly human-readable warning description.
					/// The string should be sanitized before it is used (e.g. emitted to logs or printed to
					/// stdout). Otherwise, a well crafted error message may trigger a security vulnerability in
					/// the terminal emulator or the logging subsystem.
					public func setData(val: String) {
						// native call variable prep
						
						let valPrimitiveWrapper = Str(value: val).setCFreeability(freeable: false)
				
						valPrimitiveWrapper.cType!.chars_is_owned = false
					

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKWarningMessage>) in
				WarningMessage_set_data(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new WarningMessage given each field
					public init(channelIdArg: [UInt8], dataArg: String) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let dataArgPrimitiveWrapper = Str(value: dataArg).setCFreeability(freeable: false)
				
						dataArgPrimitiveWrapper.cType!.chars_is_owned = false
					

						// native method call
						let nativeCallResult = WarningMessage_new(channelIdArgPrimitiveWrapper.cType!, dataArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						dataArgPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = WarningMessage(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the WarningMessage
					internal func clone() -> WarningMessage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKWarningMessage>) in
				WarningMessage_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = WarningMessage(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two WarningMessages contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKWarningMessage>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKWarningMessage>) in
				WarningMessage_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the WarningMessage object into a byte array which can be read by WarningMessage_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKWarningMessage>) in
				WarningMessage_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a WarningMessage from a byte array, created by WarningMessage_write
					public class func read(ser: [UInt8]) -> Result_WarningMessageDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = WarningMessage_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_WarningMessageDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> WarningMessage {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> WarningMessage {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> WarningMessage {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> WarningMessage {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> WarningMessage {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing WarningMessage \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing WarningMessage \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		