
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents the compressed public key of a node
			public typealias NodeId = Bindings.NodeId

			extension Bindings {
		

				/// Represents the compressed public key of a node
				public class NodeId: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeId?

					public init(cType: LDKNodeId) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKNodeId, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the NodeId, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeId_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the NodeId
					internal func clone() -> NodeId {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeId>) in
				NodeId_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeId(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Create a new NodeId from a public key
					public class func initWithPubkey(pubkey: [UInt8]) -> NodeId {
						// native call variable prep
						
						let pubkeyPrimitiveWrapper = PublicKey(value: pubkey)
				

						// native method call
						let nativeCallResult = NodeId_from_pubkey(pubkeyPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeId(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Get the public key slice from this NodeId
					public func asSlice() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeId>) in
				NodeId_as_slice(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Checks if two NodeIds contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKNodeId>) in
				NodeId_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the NodeId object into a byte array which can be read by NodeId_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeId>) in
				NodeId_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a NodeId from a byte array, created by NodeId_write
					public class func read(ser: [UInt8]) -> Result_NodeIdDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NodeId_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeIdDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle() -> NodeId {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> NodeId {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeId \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeId \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		