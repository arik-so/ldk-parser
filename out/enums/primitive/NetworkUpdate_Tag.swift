
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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

						
						if value == LDKNetworkUpdate_ChannelUpdateMessage {
							self = .LDKNetworkUpdate_ChannelUpdateMessage
						}
			
						if value == LDKNetworkUpdate_ChannelFailure {
							self = .LDKNetworkUpdate_ChannelFailure
						}
			
						if value == LDKNetworkUpdate_NodeFailure {
							self = .LDKNetworkUpdate_NodeFailure
						}
			
					}

					internal func getCValue() -> LDKNetworkUpdate_Tag {
						switch self {
							
							case .LDKNetworkUpdate_ChannelUpdateMessage:
								return LDKNetworkUpdate_ChannelUpdateMessage
			
							case .LDKNetworkUpdate_ChannelFailure:
								return LDKNetworkUpdate_ChannelFailure
			
							case .LDKNetworkUpdate_NodeFailure:
								return LDKNetworkUpdate_NodeFailure
			
						}
					}

				}

			}
		