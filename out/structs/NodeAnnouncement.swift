
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias NodeAnnouncement = Bindings.NodeAnnouncement

			extension Bindings {
		

				/// A node_announcement message to be sent or received from a peer
				public class NodeAnnouncement: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeAnnouncement?

					public init(cType: LDKNodeAnnouncement) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKNodeAnnouncement, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the NodeAnnouncement, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeAnnouncement_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The signature by the node key
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_get_signature(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult)

						return returnValue
					}
		
					/// The signature by the node key
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// The actual content of the announcement
					public func getContents() -> UnsignedNodeAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_get_contents(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = UnsignedNodeAnnouncement(cType: nativeCallResult)

						return returnValue
					}
		
					/// The actual content of the announcement
					public func setContents(val: UnsignedNodeAnnouncement) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_set_contents(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new NodeAnnouncement given each field
					public init(signatureArg: [UInt8], contentsArg: UnsignedNodeAnnouncement) {
						// native call variable prep
						
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				

						// native method call
						let nativeCallResult = NodeAnnouncement_new(signatureArgPrimitiveWrapper.cType!, contentsArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeAnnouncement(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the NodeAnnouncement
					internal func clone() -> NodeAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeAnnouncement(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two NodeAnnouncements contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKNodeAnnouncement>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the NodeAnnouncement object into a byte array which can be read by NodeAnnouncement_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeAnnouncement>) in
			NodeAnnouncement_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a NodeAnnouncement from a byte array, created by NodeAnnouncement_write
					public class func read(ser: [UInt8]) -> Result_NodeAnnouncementDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NodeAnnouncement_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NodeAnnouncementDecodeErrorZ(cType: nativeCallResult)

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
		

					internal func dangle() -> NodeAnnouncement {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> NodeAnnouncement {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeAnnouncement \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		