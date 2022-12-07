
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias AnnouncementSignatures = Bindings.AnnouncementSignatures

			extension Bindings {
		

				/// An announcement_signatures message to be sent or received from a peer
				public class AnnouncementSignatures: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAnnouncementSignatures?

					public init(cType: LDKAnnouncementSignatures) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKAnnouncementSignatures, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the AnnouncementSignatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = AnnouncementSignatures_free(self.cType!)

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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The short channel ID
					public func getShortChannelId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_get_short_channel_id(thisPtrPointer)
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
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_set_short_channel_id(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A signature by the node key
					public func getNodeSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_get_node_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// A signature by the node key
					public func setNodeSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_set_node_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// A signature by the funding key
					public func getBitcoinSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_get_bitcoin_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// A signature by the funding key
					public func setBitcoinSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_set_bitcoin_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new AnnouncementSignatures given each field
					public init(channelIdArg: [UInt8], shortChannelIdArg: UInt64, nodeSignatureArg: [UInt8], bitcoinSignatureArg: [UInt8]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let nodeSignatureArgPrimitiveWrapper = Signature(value: nodeSignatureArg)
				
						let bitcoinSignatureArgPrimitiveWrapper = Signature(value: bitcoinSignatureArg)
				

						// native method call
						let nativeCallResult = AnnouncementSignatures_new(channelIdArgPrimitiveWrapper.cType!, shortChannelIdArg, nodeSignatureArgPrimitiveWrapper.cType!, bitcoinSignatureArgPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = AnnouncementSignatures(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the AnnouncementSignatures
					internal func clone() -> AnnouncementSignatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = AnnouncementSignatures(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two AnnouncementSignaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the AnnouncementSignatures object into a byte array which can be read by AnnouncementSignatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAnnouncementSignatures>) in
			AnnouncementSignatures_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a AnnouncementSignatures from a byte array, created by AnnouncementSignatures_write
					public class func read(ser: [UInt8]) -> Result_AnnouncementSignaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = AnnouncementSignatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_AnnouncementSignaturesDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> AnnouncementSignatures {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> AnnouncementSignatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing AnnouncementSignatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing AnnouncementSignatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		