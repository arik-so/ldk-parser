
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ChannelReady = Bindings.ChannelReady

			extension Bindings {
		

				/// A channel_ready message to be sent or received from a peer
				public class ChannelReady: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelReady?

					public init(cType: LDKChannelReady) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChannelReady, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelReady, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelReady_free(self.cType!)

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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
				ChannelReady_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The per-commitment point of the second commitment transaction
					public func getNextPerCommitmentPoint() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelReady>) in
				ChannelReady_get_next_per_commitment_point(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The per-commitment point of the second commitment transaction
					public func setNextPerCommitmentPoint(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
				ChannelReady_set_next_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// If set, provides a short_channel_id alias for this channel. The sender will accept payments
					/// to be forwarded over this SCID and forward them to this messages' recipient.
					public func getShortChannelIdAlias() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelReady>) in
				ChannelReady_get_short_channel_id_alias(thisPtrPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// If set, provides a short_channel_id alias for this channel. The sender will accept payments
					/// to be forwarded over this SCID and forward them to this messages' recipient.
					public func setShortChannelIdAlias(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelReady>) in
				ChannelReady_set_short_channel_id_alias(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new ChannelReady given each field
					public init(channelIdArg: [UInt8], nextPerCommitmentPointArg: [UInt8], shortChannelIdAliasArg: UInt64?) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let nextPerCommitmentPointArgPrimitiveWrapper = PublicKey(value: nextPerCommitmentPointArg)
				
						let shortChannelIdAliasArgOption = Option_u64Z(some: shortChannelIdAliasArg)
				

						// native method call
						let nativeCallResult = ChannelReady_new(channelIdArgPrimitiveWrapper.cType!, nextPerCommitmentPointArgPrimitiveWrapper.cType!, shortChannelIdAliasArgOption.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelReady(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the ChannelReady
					internal func clone() -> ChannelReady {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelReady>) in
				ChannelReady_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelReady(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two ChannelReadys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKChannelReady>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKChannelReady>) in
				ChannelReady_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the ChannelReady object into a byte array which can be read by ChannelReady_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelReady>) in
				ChannelReady_write(objPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a ChannelReady from a byte array, created by ChannelReady_write
					public class func read(ser: [UInt8]) -> Result_ChannelReadyDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelReady_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ChannelReadyDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> ChannelReady {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ChannelReady {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelReady \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelReady \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		