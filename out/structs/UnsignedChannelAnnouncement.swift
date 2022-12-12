
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The unsigned part of a channel_announcement
			public typealias UnsignedChannelAnnouncement = Bindings.UnsignedChannelAnnouncement

			extension Bindings {
		

				/// The unsigned part of a channel_announcement
				public class UnsignedChannelAnnouncement: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUnsignedChannelAnnouncement?

					public init(cType: LDKUnsignedChannelAnnouncement) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKUnsignedChannelAnnouncement, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UnsignedChannelAnnouncement, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedChannelAnnouncement_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The advertised channel features
					public func getFeatures() -> ChannelFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelFeatures(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// The advertised channel features
					public func setFeatures(val: ChannelFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func getChainHash() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_chain_hash(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func getShortChannelId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_short_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func setShortChannelId(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_short_channel_id(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// One of the two node_ids which are endpoints of this channel
					public func getNodeId_1() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_node_id_1(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// One of the two node_ids which are endpoints of this channel
					public func setNodeId_1(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_node_id_1(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The other of the two node_ids which are endpoints of this channel
					public func getNodeId_2() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_node_id_2(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// The other of the two node_ids which are endpoints of this channel
					public func setNodeId_2(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_node_id_2(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The funding key for the first node
					public func getBitcoinKey_1() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_bitcoin_key_1(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// The funding key for the first node
					public func setBitcoinKey_1(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_bitcoin_key_1(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The funding key for the second node
					public func getBitcoinKey_2() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_get_bitcoin_key_2(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).dangle().getValue()
						

						return returnValue
					}
		
					/// The funding key for the second node
					public func setBitcoinKey_2(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_set_bitcoin_key_2(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the UnsignedChannelAnnouncement
					internal func clone() -> UnsignedChannelAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedChannelAnnouncement(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two UnsignedChannelAnnouncements contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the UnsignedChannelAnnouncement object into a byte array which can be read by UnsignedChannelAnnouncement_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				UnsignedChannelAnnouncement_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a UnsignedChannelAnnouncement from a byte array, created by UnsignedChannelAnnouncement_write
					public class func read(ser: [UInt8]) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = UnsignedChannelAnnouncement_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelAnnouncementDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> UnsignedChannelAnnouncement {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> UnsignedChannelAnnouncement {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UnsignedChannelAnnouncement {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							// dangledClone.dangling = dangledClone.cType!.is_owned
							// return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UnsignedChannelAnnouncement {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UnsignedChannelAnnouncement {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UnsignedChannelAnnouncement \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedChannelAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		