
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ReplyShortChannelIdsEnd = Bindings.ReplyShortChannelIdsEnd

			extension Bindings {
		

				/// A reply_short_channel_ids_end message is sent as a reply to a
				/// query_short_channel_ids message. The query recipient makes a best
				/// effort to respond based on their local network view which may not be
				/// a perfect view of the network.
				public class ReplyShortChannelIdsEnd: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKReplyShortChannelIdsEnd?

					public init(cType: LDKReplyShortChannelIdsEnd) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKReplyShortChannelIdsEnd, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ReplyShortChannelIdsEnd, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ReplyShortChannelIdsEnd_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The genesis hash of the blockchain that was queried
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_set_chain_hash(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Indicates if the query recipient maintains up-to-date channel
					/// information for the chain_hash
					public func getFullInformation() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_get_full_information(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Indicates if the query recipient maintains up-to-date channel
					/// information for the chain_hash
					public func setFullInformation(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_set_full_information(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new ReplyShortChannelIdsEnd given each field
					public init(chainHashArg: [UInt8], fullInformationArg: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ReplyShortChannelIdsEnd_new(chainHashArg.cType!, fullInformationArg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ReplyShortChannelIdsEnd(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the ReplyShortChannelIdsEnd
					internal func clone() -> ReplyShortChannelIdsEnd {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ReplyShortChannelIdsEnd(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two ReplyShortChannelIdsEnds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the ReplyShortChannelIdsEnd object into a byte array which can be read by ReplyShortChannelIdsEnd_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
			ReplyShortChannelIdsEnd_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a ReplyShortChannelIdsEnd from a byte array, created by ReplyShortChannelIdsEnd_write
					public class func read(ser: [UInt8]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ReplyShortChannelIdsEnd_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ReplyShortChannelIdsEndDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> ReplyShortChannelIdsEnd {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ReplyShortChannelIdsEnd {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ReplyShortChannelIdsEnd \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ReplyShortChannelIdsEnd \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		