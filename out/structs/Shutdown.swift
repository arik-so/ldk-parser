
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Shutdown = Bindings.Shutdown

			extension Bindings {
		

				/// A shutdown message to be sent or received from a peer
				public class Shutdown: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKShutdown?

					public init(cType: LDKShutdown) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKShutdown, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Shutdown, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Shutdown_free(self.cType!)

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
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_set_channel_id(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The destination of this peer's funds on closing.
					/// Must be in one of these forms: p2pkh, p2sh, p2wpkh, p2wsh.
					public func getScriptpubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_get_scriptpubkey(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult)

						return returnValue
					}
		
					/// The destination of this peer's funds on closing.
					/// Must be in one of these forms: p2pkh, p2sh, p2wpkh, p2wsh.
					public func setScriptpubkey(val: [UInt8]) {
						// native call variable prep
						
						let valVector = Vec_u8Z(array: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_set_scriptpubkey(thisPtrPointer, valVector.cType!)
						}
			

						// cleanup
						
						valVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new Shutdown given each field
					public init(channelIdArg: [UInt8], scriptpubkeyArg: [UInt8]) {
						// native call variable prep
						
						let scriptpubkeyArgVector = Vec_u8Z(array: scriptpubkeyArg)
				

						// native method call
						let nativeCallResult = Shutdown_new(channelIdArg.cType!, scriptpubkeyArgVector.cType!)

						// cleanup
						
						scriptpubkeyArgVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Shutdown(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the Shutdown
					internal func clone() -> Shutdown {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Shutdown(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two Shutdowns contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKShutdown>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the Shutdown object into a byte array which can be read by Shutdown_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKShutdown>) in
			Shutdown_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a Shutdown from a byte array, created by Shutdown_write
					public class func read(ser: [UInt8]) -> Result_ShutdownDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Shutdown_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ShutdownDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> Shutdown {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Shutdown {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Shutdown \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Shutdown \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		