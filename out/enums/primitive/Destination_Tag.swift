
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Destination_Tag = Bindings.Destination_Tag

			extension Bindings {

				/// The destination of an onion message.
				public enum Destination_Tag {

					
					/// We're sending this onion message to a node.
					case LDKDestination_Node
			
					/// We're sending this onion message to a blinded route.
					case LDKDestination_BlindedRoute
			

					internal init (value: LDKDestination_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKDestination_BlindedRoute

						
						if value == LDKDestination_Node {
							self = .LDKDestination_Node
						}
			
						if value == LDKDestination_BlindedRoute {
							self = .LDKDestination_BlindedRoute
						}
			
					}

					internal func getCValue() -> LDKDestination_Tag {
						switch self {
							
							case .LDKDestination_Node:
								return LDKDestination_Node
			
							case .LDKDestination_BlindedRoute:
								return LDKDestination_BlindedRoute
			
						}
					}

				}

			}
		