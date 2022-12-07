
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias P2PGossipSync = Bindings.P2PGossipSync

			extension Bindings {
		

				/// Receives and validates network updates from peers,
				/// stores authentic and relevant data as a network graph.
				/// This network graph is then used for routing payments.
				/// Provides interface to help with initial routing sync by
				/// serving historical announcements.
				/// 
				/// Serves as an [`EventHandler`] for applying updates from [`Event::PaymentPathFailed`] to the
				/// [`NetworkGraph`].
				public class P2PGossipSync: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKP2PGossipSync?

					public init(cType: LDKP2PGossipSync) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKP2PGossipSync, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the P2PGossipSync, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = P2PGossipSync_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new tracker of the actual state of the network of channels and nodes,
					/// assuming an existing Network Graph.
					/// Chain monitor is used to make sure announced channels exist on-chain,
					/// channel data is correct, and that the announcement is signed with
					/// channel owners' keys.
					public init(networkGraph: NetworkGraph, chainAccess: Access?, logger: Logger) {
						// native call variable prep
						
						let chainAccessOption = Option_AccessZ(some: chainAccess)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
			P2PGossipSync_new(networkGraphPointer, chainAccessOption.cType!, logger.activate().cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = P2PGossipSync(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Adds a provider used to check new announcements. Does not affect
					/// existing announcements unless they are updated.
					/// Add, update or remove the provider would replace the current one.
					public func addChainAccess(chainAccess: Access?) {
						// native call variable prep
						
						let chainAccessOption = Option_AccessZ(some: chainAccess)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKP2PGossipSync>) in
			P2PGossipSync_add_chain_access(thisArgPointer, chainAccessOption.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new RoutingMessageHandler which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned RoutingMessageHandler must be freed before this_arg is
					public func asRoutingMessageHandler() -> RoutingMessageHandler {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKP2PGossipSync>) in
			P2PGossipSync_as_RoutingMessageHandler(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedRoutingMessageHandler(cType: nativeCallResult, anchor: self)

						return returnValue
					}
		
					/// Constructs a new MessageSendEventsProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned MessageSendEventsProvider must be freed before this_arg is
					public func asMessageSendEventsProvider() -> MessageSendEventsProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKP2PGossipSync>) in
			P2PGossipSync_as_MessageSendEventsProvider(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedMessageSendEventsProvider(cType: nativeCallResult, anchor: self)

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
		

					internal func dangle() -> P2PGossipSync {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing P2PGossipSync \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing P2PGossipSync \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		