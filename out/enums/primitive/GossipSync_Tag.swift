
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias GossipSync_Tag = Bindings.GossipSync_Tag

			extension Bindings {

				/// Either [`P2PGossipSync`] or [`RapidGossipSync`].
				public enum GossipSync_Tag {

					
					/// Gossip sync via the lightning peer-to-peer network as defined by BOLT 7.
					case LDKGossipSync_P2P
			
					/// Rapid gossip sync from a trusted server.
					case LDKGossipSync_Rapid
			
					/// No gossip sync.
					case LDKGossipSync_None
			

					internal init (value: LDKGossipSync_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKGossipSync_None

						
						if value == LDKGossipSync_P2P {
							self = .LDKGossipSync_P2P
						}
			
						if value == LDKGossipSync_Rapid {
							self = .LDKGossipSync_Rapid
						}
			
						if value == LDKGossipSync_None {
							self = .LDKGossipSync_None
						}
			
					}

					internal func getCValue() -> LDKGossipSync_Tag {
						switch self {
							
							case .LDKGossipSync_P2P:
								return LDKGossipSync_P2P
			
							case .LDKGossipSync_Rapid:
								return LDKGossipSync_Rapid
			
							case .LDKGossipSync_None:
								return LDKGossipSync_None
			
						}
					}

				}

			}
		