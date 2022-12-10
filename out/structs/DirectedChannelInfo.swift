
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A wrapper around [`ChannelInfo`] representing information about the channel as directed from a
			/// source node to a target node.
			public typealias DirectedChannelInfo = Bindings.DirectedChannelInfo

			extension Bindings {
		

				/// A wrapper around [`ChannelInfo`] representing information about the channel as directed from a
				/// source node to a target node.
				public class DirectedChannelInfo: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDirectedChannelInfo?

					public init(cType: LDKDirectedChannelInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKDirectedChannelInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the DirectedChannelInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = DirectedChannelInfo_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the DirectedChannelInfo
					internal func clone() -> DirectedChannelInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDirectedChannelInfo>) in
				DirectedChannelInfo_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = DirectedChannelInfo(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns information for the channel.
					public func channel() -> ChannelInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
				DirectedChannelInfo_channel(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelInfo(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns information for the direction.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func direction() -> ChannelUpdateInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
				DirectedChannelInfo_direction(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelUpdateInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = ChannelUpdateInfo(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns the maximum HTLC amount allowed over the channel in the direction.
					public func htlcMaximumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
				DirectedChannelInfo_htlc_maximum_msat(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the [`EffectiveCapacity`] of the channel in the direction.
					/// 
					/// This is either the total capacity from the funding transaction, if known, or the
					/// `htlc_maximum_msat` for the direction as advertised by the gossip network, if known,
					/// otherwise.
					public func effectiveCapacity() -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
				DirectedChannelInfo_effective_capacity(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

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
		

					internal func dangle() -> DirectedChannelInfo {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> DirectedChannelInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					internal func setCFreeability(freeable: Bool) {
						self.cType!.is_owned = freeable
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing DirectedChannelInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DirectedChannelInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		