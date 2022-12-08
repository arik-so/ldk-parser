
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

						
						// LDKGossipSync_P2P
						if value.rawValue == 0 {
							self = .LDKGossipSync_P2P
						}
			
						// LDKGossipSync_Rapid
						if value.rawValue == 1 {
							self = .LDKGossipSync_Rapid
						}
			
						// LDKGossipSync_None
						if value.rawValue == 2 {
							self = .LDKGossipSync_None
						}
			
					}

					internal func getCValue() -> LDKGossipSync_Tag {
						switch self {
							
							case .LDKGossipSync_P2P:
								// return LDKGossipSync_P2P
								return LDKGossipSync_Tag(0)
			
							case .LDKGossipSync_Rapid:
								// return LDKGossipSync_Rapid
								return LDKGossipSync_Tag(1)
			
							case .LDKGossipSync_None:
								// return LDKGossipSync_None
								return LDKGossipSync_Tag(2)
			
						}
					}

				}

			}
		