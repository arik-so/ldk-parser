
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The unsigned part of a node_announcement
			public typealias UnsignedNodeAnnouncement = Bindings.UnsignedNodeAnnouncement

			extension Bindings {
		

				/// The unsigned part of a node_announcement
				public class UnsignedNodeAnnouncement: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUnsignedNodeAnnouncement?

					internal init(cType: LDKUnsignedNodeAnnouncement) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKUnsignedNodeAnnouncement, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UnsignedNodeAnnouncement, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedNodeAnnouncement_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The advertised features
					public func getFeatures() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The advertised features
					public func setFeatures(val: NodeFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed
					public func getTimestamp() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_timestamp(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed
					public func setTimestamp(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_timestamp(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The node_id this announcement originated from (don't rebroadcast the node_announcement back
					/// to this node).
					public func getNodeId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_node_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The node_id this announcement originated from (don't rebroadcast the node_announcement back
					/// to this node).
					public func setNodeId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_node_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An RGB color for UI purposes
					public func getRgb() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_rgb(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple3ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// An RGB color for UI purposes
					public func setRgb(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThreeBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_rgb(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An alias, for UI purposes.  This should be sanitized before use.  There is no guarantee
					/// of uniqueness.
					public func getAlias() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_alias(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// An alias, for UI purposes.  This should be sanitized before use.  There is no guarantee
					/// of uniqueness.
					public func setAlias(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_alias(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// List of addresses on which this node is reachable
					/// 
					/// Returns a copy of the field.
					public func getAddresses() -> [NetAddress] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_get_addresses(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_NetAddressZ(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// List of addresses on which this node is reachable
					public func setAddresses(val: [NetAddress]) {
						// native call variable prep
						
						let valVector = Vec_NetAddressZ(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_set_addresses(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the UnsignedNodeAnnouncement
					internal func clone() -> UnsignedNodeAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedNodeAnnouncement(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two UnsignedNodeAnnouncements contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: UnsignedNodeAnnouncement, b: UnsignedNodeAnnouncement) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the UnsignedNodeAnnouncement object into a byte array which can be read by UnsignedNodeAnnouncement_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
				UnsignedNodeAnnouncement_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a UnsignedNodeAnnouncement from a byte array, created by UnsignedNodeAnnouncement_write
					public class func read(ser: [UInt8]) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = UnsignedNodeAnnouncement_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedNodeAnnouncementDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> UnsignedNodeAnnouncement {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UnsignedNodeAnnouncement {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UnsignedNodeAnnouncement {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UnsignedNodeAnnouncement {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UnsignedNodeAnnouncement {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UnsignedNodeAnnouncement \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedNodeAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		