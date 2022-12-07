
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias GossipTimestampFilter = Bindings.GossipTimestampFilter

			extension Bindings {
		

				/// A gossip_timestamp_filter message is used by a node to request
				/// gossip relay for messages in the requested time range when the
				/// gossip_queries feature has been negotiated.
				public class GossipTimestampFilter: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKGossipTimestampFilter?

					public init(cType: LDKGossipTimestampFilter) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKGossipTimestampFilter, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the GossipTimestampFilter, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipTimestampFilter_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The genesis hash of the blockchain for channel and node information
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The starting unix timestamp
					public func getFirstTimestamp() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_get_first_timestamp(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The starting unix timestamp
					public func setFirstTimestamp(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_set_first_timestamp(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The range of information in seconds
					public func getTimestampRange() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_get_timestamp_range(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The range of information in seconds
					public func setTimestampRange(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_set_timestamp_range(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new GossipTimestampFilter given each field
					public init(chainHashArg: [UInt8], firstTimestampArg: UInt32, timestampRangeArg: UInt32) {
						// native call variable prep
						
						let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(value: chainHashArg)
				

						// native method call
						let nativeCallResult = GossipTimestampFilter_new(chainHashArgPrimitiveWrapper.cType!, firstTimestampArg, timestampRangeArg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = GossipTimestampFilter(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the GossipTimestampFilter
					internal func clone() -> GossipTimestampFilter {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = GossipTimestampFilter(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two GossipTimestampFilters contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the GossipTimestampFilter object into a byte array which can be read by GossipTimestampFilter_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKGossipTimestampFilter>) in
			GossipTimestampFilter_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a GossipTimestampFilter from a byte array, created by GossipTimestampFilter_write
					public class func read(ser: [UInt8]) -> Result_GossipTimestampFilterDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = GossipTimestampFilter_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_GossipTimestampFilterDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> GossipTimestampFilter {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> GossipTimestampFilter {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing GossipTimestampFilter \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing GossipTimestampFilter \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		