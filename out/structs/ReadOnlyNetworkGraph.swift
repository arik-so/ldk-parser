
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A read-only view of [`NetworkGraph`].
			public typealias ReadOnlyNetworkGraph = Bindings.ReadOnlyNetworkGraph

			extension Bindings {
		

				/// A read-only view of [`NetworkGraph`].
				public class ReadOnlyNetworkGraph: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKReadOnlyNetworkGraph?

					internal init(cType: LDKReadOnlyNetworkGraph) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKReadOnlyNetworkGraph, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ReadOnlyNetworkGraph, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ReadOnlyNetworkGraph_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns information on a channel with the given id.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func channel(shortChannelId: UInt64) -> ChannelInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
				ReadOnlyNetworkGraph_channel(thisArgPointer, shortChannelId)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = ChannelInfo(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Returns the list of channels in the graph
					public func listChannels() -> [UInt64] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
				ReadOnlyNetworkGraph_list_channels(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u64Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Returns information on a node with the given id.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func node(nodeId: NodeId) -> NodeInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
				
						withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
				ReadOnlyNetworkGraph_node(thisArgPointer, nodeIdPointer)
						}
				
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKNodeInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = NodeInfo(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Returns the list of nodes in the graph
					public func listNodes() -> [NodeId] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
				ReadOnlyNetworkGraph_list_nodes(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_NodeIdZ(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Get network addresses by node id.
					/// Returns None if the requested node is completely unknown,
					/// or if node announcement for the node was never received.
					public func getAddresses(pubkey: [UInt8]) -> [NetAddress]? {
						// native call variable prep
						
						let pubkeyPrimitiveWrapper = PublicKey(value: pubkey)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
				ReadOnlyNetworkGraph_get_addresses(thisArgPointer, pubkeyPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						pubkeyPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_NetAddressZZ(cType: nativeCallResult, anchor: self).getValue()
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ReadOnlyNetworkGraph {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ReadOnlyNetworkGraph {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ReadOnlyNetworkGraph {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ReadOnlyNetworkGraph \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ReadOnlyNetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		