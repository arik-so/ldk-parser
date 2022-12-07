
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias NodeInfo = Bindings.NodeInfo

			extension Bindings {
		

				/// Details about a node in the network, known from the network announcement.
				public class NodeInfo: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeInfo?

					public init(cType: LDKNodeInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKNodeInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the NodeInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeInfo_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// All valid channels a node has announced
					/// 
					/// Returns a copy of the field.
					public func getChannels() -> [UInt64] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_get_channels(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u64Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// All valid channels a node has announced
					public func setChannels(val: [UInt64]) {
						// native call variable prep
						
						let valVector = Vec_u64Z(array: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_set_channels(thisPtrPointer, valVector.cType!)
						}
			

						// cleanup
						
						valVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lowest fees enabling routing via any of the enabled, known channels to a node.
					/// The two fields (flat and proportional fee) are independent,
					/// meaning they don't have to refer to the same channel.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getLowestInboundChannelFees() -> RoutingFees? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_get_lowest_inbound_channel_fees(thisPtrPointer)
						}
			

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKRoutingFees
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = RoutingFees(cType: nativeCallResult)

						return returnValue
					}
		
					/// Lowest fees enabling routing via any of the enabled, known channels to a node.
					/// The two fields (flat and proportional fee) are independent,
					/// meaning they don't have to refer to the same channel.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setLowestInboundChannelFees(val: RoutingFees) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_set_lowest_inbound_channel_fees(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// More information about a node from node_announcement.
					/// Optional because we store a Node entry after learning about it from
					/// a channel announcement, but before receiving a node announcement.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getAnnouncementInfo() -> NodeAnnouncementInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_get_announcement_info(thisPtrPointer)
						}
			

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKNodeAnnouncementInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						// return value (do some wrapping)
						let returnValue = NodeAnnouncementInfo(cType: nativeCallResult)

						return returnValue
					}
		
					/// More information about a node from node_announcement.
					/// Optional because we store a Node entry after learning about it from
					/// a channel announcement, but before receiving a node announcement.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setAnnouncementInfo(val: NodeAnnouncementInfo) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_set_announcement_info(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new NodeInfo given each field
					public init(channelsArg: [UInt64], lowestInboundChannelFeesArg: RoutingFees, announcementInfoArg: NodeAnnouncementInfo) {
						// native call variable prep
						
						let channelsArgVector = Vec_u64Z(array: channelsArg)
				

						// native method call
						let nativeCallResult = NodeInfo_new(channelsArgVector.cType!, lowestInboundChannelFeesArg.cType!, announcementInfoArg.cType!)

						// cleanup
						
						channelsArgVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = NodeInfo(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the NodeInfo
					internal func clone() -> NodeInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeInfo(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two NodeInfos contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKNodeInfo>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the NodeInfo object into a byte array which can be read by NodeInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeInfo>) in
			NodeInfo_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a NodeInfo from a byte array, created by NodeInfo_write
					public class func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeInfo_read(ser.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NodeInfoDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> NodeInfo {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> NodeInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		