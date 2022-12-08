
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Update to the [`NetworkGraph`] based on payment failure information conveyed via the Onion
			/// return packet by a node along the route. See [BOLT #4] for details.
			/// 
			/// [BOLT #4]: https://github.com/lightning/bolts/blob/master/04-onion-routing.md
			public typealias NetworkUpdate_Tag = Bindings.NetworkUpdate_Tag

			extension Bindings {

				/// Update to the [`NetworkGraph`] based on payment failure information conveyed via the Onion
				/// return packet by a node along the route. See [BOLT #4] for details.
				/// 
				/// [BOLT #4]: https://github.com/lightning/bolts/blob/master/04-onion-routing.md
				public enum NetworkUpdate_Tag {

					
					/// An error indicating a `channel_update` messages should be applied via
					/// [`NetworkGraph::update_channel`].
					case LDKNetworkUpdate_ChannelUpdateMessage
			
					/// An error indicating that a channel failed to route a payment, which should be applied via
					/// [`NetworkGraph::channel_failed`].
					case LDKNetworkUpdate_ChannelFailure
			
					/// An error indicating that a node failed to route a payment, which should be applied via
					/// [`NetworkGraph::node_failed_permanent`] if permanent.
					case LDKNetworkUpdate_NodeFailure
			

					internal init (value: LDKNetworkUpdate_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKNetworkUpdate_NodeFailure

						
						// LDKNetworkUpdate_ChannelUpdateMessage
						if value.rawValue == 0 {
							self = .LDKNetworkUpdate_ChannelUpdateMessage
						}
			
						// LDKNetworkUpdate_ChannelFailure
						if value.rawValue == 1 {
							self = .LDKNetworkUpdate_ChannelFailure
						}
			
						// LDKNetworkUpdate_NodeFailure
						if value.rawValue == 2 {
							self = .LDKNetworkUpdate_NodeFailure
						}
			
					}

					internal func getCValue() -> LDKNetworkUpdate_Tag {
						switch self {
							
							case .LDKNetworkUpdate_ChannelUpdateMessage:
								// return LDKNetworkUpdate_ChannelUpdateMessage
								return LDKNetworkUpdate_Tag(0)
			
							case .LDKNetworkUpdate_ChannelFailure:
								// return LDKNetworkUpdate_ChannelFailure
								return LDKNetworkUpdate_Tag(1)
			
							case .LDKNetworkUpdate_NodeFailure:
								// return LDKNetworkUpdate_NodeFailure
								return LDKNetworkUpdate_Tag(2)
			
						}
					}

				}

			}
		