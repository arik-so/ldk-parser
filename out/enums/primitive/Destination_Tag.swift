
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The destination of an onion message.
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

						
						// LDKDestination_Node
						if value.rawValue == 0 {
							self = .LDKDestination_Node
						}
			
						// LDKDestination_BlindedRoute
						if value.rawValue == 1 {
							self = .LDKDestination_BlindedRoute
						}
			
					}

					internal func getCValue() -> LDKDestination_Tag {
						switch self {
							
							case .LDKDestination_Node:
								// return LDKDestination_Node
								return LDKDestination_Tag(0)
			
							case .LDKDestination_BlindedRoute:
								// return LDKDestination_BlindedRoute
								return LDKDestination_Tag(1)
			
						}
					}

				}

			}
		