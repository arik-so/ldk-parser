
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Destination = Bindings.Destination

			extension Bindings {

				/// The destination of an onion message.
				public class Destination: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDestination?

					public init(cType: LDKDestination) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKDestination, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum DestinationType {
						
						/// We're sending this onion message to a node.
						case Node
			
						/// We're sending this onion message to a blinded route.
						case BlindedRoute
			
					}

					public func getValueType() -> DestinationType? {
						switch self.cType!.tag {
							case LDKDestination_Node:
								return .Node
			
							case LDKDestination_BlindedRoute:
								return .BlindedRoute
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the Destination
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Destination_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Utility method to constructs a new Node-variant Destination
					public init(a: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Destination_node(a.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Destination(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new BlindedRoute-variant Destination
					public init(a: BlindedRoute) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Destination_blinded_route(a.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Destination(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		

					
					public func getValueAsNode() -> [UInt8]? {
						if self.cType?.tag != LDKDestination_Node {
							return nil
						}

						return PublicKey(cType: self.cType!.node)
					}
			
					public func getValueAsBlindedRoute() -> BlindedRoute? {
						if self.cType?.tag != LDKDestination_BlindedRoute {
							return nil
						}

						return BlindedRoute(cType: self.cType!.blinded_route)
					}
			

					internal func dangle() -> Destination {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Destination \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Destination \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		