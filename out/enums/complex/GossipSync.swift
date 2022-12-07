
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias GossipSync = Bindings.GossipSync

			extension Bindings {

				/// Either [`P2PGossipSync`] or [`RapidGossipSync`].
				public class GossipSync: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKGossipSync?

					public init(pointer: LDKGossipSync) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKGossipSync, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum GossipSyncType {
						
						/// Gossip sync via the lightning peer-to-peer network as defined by BOLT 7.
						case P2P
			
						/// Rapid gossip sync from a trusted server.
						case Rapid
			
						/// No gossip sync.
						case None
			
					}

					public func getValueType() -> GossipSyncType? {
						switch self.cType!.tag {
							case LDKGossipSync_P2P:
								return .P2P
			
							case LDKGossipSync_Rapid:
								return .Rapid
			
							case LDKGossipSync_None:
								return .None
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the GossipSync
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipSync_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Utility method to constructs a new P2P-variant GossipSync
					public init(a: P2PGossipSync) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKP2PGossipSync>) in
			GossipSync_p2_p(aPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = GossipSync(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new Rapid-variant GossipSync
					public init(a: RapidGossipSync) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRapidGossipSync>) in
			GossipSync_rapid(aPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = GossipSync(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new None-variant GossipSync
					public class func none() -> GossipSync {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipSync_none()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = GossipSync(pointer: nativeCallResult)

						return returnValue
					}
		

					
					public func getValueAsP2p() -> P2PGossipSync? {
						if self.cType?.tag != LDKGossipSync_P2p {
							return nil
						}

						return P2PGossipSync(pointer: self.cType!.p2p)
					}
			
					public func getValueAsRapid() -> RapidGossipSync? {
						if self.cType?.tag != LDKGossipSync_Rapid {
							return nil
						}

						return RapidGossipSync(pointer: self.cType!.rapid)
					}
			

					internal func dangle() -> GossipSync {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing GossipSync \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing GossipSync \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		