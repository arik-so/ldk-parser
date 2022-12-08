
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ClosureReason_Tag = Bindings.ClosureReason_Tag

			extension Bindings {

				/// The reason the channel was closed. See individual variants more details.
				public enum ClosureReason_Tag {

					
					/// Closure generated from receiving a peer error message.
					/// 
					/// Our counterparty may have broadcasted their latest commitment state, and we have
					/// as well.
					case LDKClosureReason_CounterpartyForceClosed
			
					/// Closure generated from [`ChannelManager::force_close_channel`], called by the user.
					/// 
					/// [`ChannelManager::force_close_channel`]: crate::ln::channelmanager::ChannelManager::force_close_channel.
					case LDKClosureReason_HolderForceClosed
			
					/// The channel was closed after negotiating a cooperative close and we've now broadcasted
					/// the cooperative close transaction. Note the shutdown may have been initiated by us.
					case LDKClosureReason_CooperativeClosure
			
					/// A commitment transaction was confirmed on chain, closing the channel. Most likely this
					/// commitment transaction came from our counterparty, but it may also have come from
					/// a copy of our own `ChannelMonitor`.
					case LDKClosureReason_CommitmentTxConfirmed
			
					/// The funding transaction failed to confirm in a timely manner on an inbound channel.
					case LDKClosureReason_FundingTimedOut
			
					/// Closure generated from processing an event, likely a HTLC forward/relay/reception.
					case LDKClosureReason_ProcessingError
			
					/// The peer disconnected prior to funding completing. In this case the spec mandates that we
					/// forget the channel entirely - we can attempt again if the peer reconnects.
					/// 
					/// This includes cases where we restarted prior to funding completion, including prior to the
					/// initial [`ChannelMonitor`] persistence completing.
					/// 
					/// In LDK versions prior to 0.0.107 this could also occur if we were unable to connect to the
					/// peer because of mutual incompatibility between us and our channel counterparty.
					/// 
					/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
					case LDKClosureReason_DisconnectedPeer
			
					/// Closure generated from `ChannelManager::read` if the [`ChannelMonitor`] is newer than
					/// the [`ChannelManager`] deserialized.
					/// 
					/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					case LDKClosureReason_OutdatedChannelManager
			

					internal init (value: LDKClosureReason_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKClosureReason_OutdatedChannelManager

						
						// LDKClosureReason_CounterpartyForceClosed
						if value.rawValue == 0 {
							self = .LDKClosureReason_CounterpartyForceClosed
						}
			
						// LDKClosureReason_HolderForceClosed
						if value.rawValue == 1 {
							self = .LDKClosureReason_HolderForceClosed
						}
			
						// LDKClosureReason_CooperativeClosure
						if value.rawValue == 2 {
							self = .LDKClosureReason_CooperativeClosure
						}
			
						// LDKClosureReason_CommitmentTxConfirmed
						if value.rawValue == 3 {
							self = .LDKClosureReason_CommitmentTxConfirmed
						}
			
						// LDKClosureReason_FundingTimedOut
						if value.rawValue == 4 {
							self = .LDKClosureReason_FundingTimedOut
						}
			
						// LDKClosureReason_ProcessingError
						if value.rawValue == 5 {
							self = .LDKClosureReason_ProcessingError
						}
			
						// LDKClosureReason_DisconnectedPeer
						if value.rawValue == 6 {
							self = .LDKClosureReason_DisconnectedPeer
						}
			
						// LDKClosureReason_OutdatedChannelManager
						if value.rawValue == 7 {
							self = .LDKClosureReason_OutdatedChannelManager
						}
			
					}

					internal func getCValue() -> LDKClosureReason_Tag {
						switch self {
							
							case .LDKClosureReason_CounterpartyForceClosed:
								// return LDKClosureReason_CounterpartyForceClosed
								return LDKClosureReason_Tag(0)
			
							case .LDKClosureReason_HolderForceClosed:
								// return LDKClosureReason_HolderForceClosed
								return LDKClosureReason_Tag(1)
			
							case .LDKClosureReason_CooperativeClosure:
								// return LDKClosureReason_CooperativeClosure
								return LDKClosureReason_Tag(2)
			
							case .LDKClosureReason_CommitmentTxConfirmed:
								// return LDKClosureReason_CommitmentTxConfirmed
								return LDKClosureReason_Tag(3)
			
							case .LDKClosureReason_FundingTimedOut:
								// return LDKClosureReason_FundingTimedOut
								return LDKClosureReason_Tag(4)
			
							case .LDKClosureReason_ProcessingError:
								// return LDKClosureReason_ProcessingError
								return LDKClosureReason_Tag(5)
			
							case .LDKClosureReason_DisconnectedPeer:
								// return LDKClosureReason_DisconnectedPeer
								return LDKClosureReason_Tag(6)
			
							case .LDKClosureReason_OutdatedChannelManager:
								// return LDKClosureReason_OutdatedChannelManager
								return LDKClosureReason_Tag(7)
			
						}
					}

				}

			}
		