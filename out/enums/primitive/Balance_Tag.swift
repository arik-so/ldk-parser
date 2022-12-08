
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Details about the balance(s) available for spending once the channel appears on chain.
			/// 
			/// See [`ChannelMonitor::get_claimable_balances`] for more details on when these will or will not
			/// be provided.
			public typealias Balance_Tag = Bindings.Balance_Tag

			extension Bindings {

				/// Details about the balance(s) available for spending once the channel appears on chain.
				/// 
				/// See [`ChannelMonitor::get_claimable_balances`] for more details on when these will or will not
				/// be provided.
				public enum Balance_Tag {

					
					/// The channel is not yet closed (or the commitment or closing transaction has not yet
					/// appeared in a block). The given balance is claimable (less on-chain fees) if the channel is
					/// force-closed now.
					case LDKBalance_ClaimableOnChannelClose
			
					/// The channel has been closed, and the given balance is ours but awaiting confirmations until
					/// we consider it spendable.
					case LDKBalance_ClaimableAwaitingConfirmations
			
					/// The channel has been closed, and the given balance should be ours but awaiting spending
					/// transaction confirmation. If the spending transaction does not confirm in time, it is
					/// possible our counterparty can take the funds by broadcasting an HTLC timeout on-chain.
					/// 
					/// Once the spending transaction confirms, before it has reached enough confirmations to be
					/// considered safe from chain reorganizations, the balance will instead be provided via
					/// [`Balance::ClaimableAwaitingConfirmations`].
					case LDKBalance_ContentiousClaimable
			
					/// HTLCs which we sent to our counterparty which are claimable after a timeout (less on-chain
					/// fees) if the counterparty does not know the preimage for the HTLCs. These are somewhat
					/// likely to be claimed by our counterparty before we do.
					case LDKBalance_MaybeTimeoutClaimableHTLC
			
					/// HTLCs which we received from our counterparty which are claimable with a preimage which we
					/// do not currently have. This will only be claimable if we receive the preimage from the node
					/// to which we forwarded this HTLC before the timeout.
					case LDKBalance_MaybePreimageClaimableHTLC
			
					/// The channel has been closed, and our counterparty broadcasted a revoked commitment
					/// transaction.
					/// 
					/// Thus, we're able to claim all outputs in the commitment transaction, one of which has the
					/// following amount.
					case LDKBalance_CounterpartyRevokedOutputClaimable
			

					internal init (value: LDKBalance_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKBalance_CounterpartyRevokedOutputClaimable

						
						// LDKBalance_ClaimableOnChannelClose
						if value.rawValue == 0 {
							self = .LDKBalance_ClaimableOnChannelClose
						}
			
						// LDKBalance_ClaimableAwaitingConfirmations
						if value.rawValue == 1 {
							self = .LDKBalance_ClaimableAwaitingConfirmations
						}
			
						// LDKBalance_ContentiousClaimable
						if value.rawValue == 2 {
							self = .LDKBalance_ContentiousClaimable
						}
			
						// LDKBalance_MaybeTimeoutClaimableHTLC
						if value.rawValue == 3 {
							self = .LDKBalance_MaybeTimeoutClaimableHTLC
						}
			
						// LDKBalance_MaybePreimageClaimableHTLC
						if value.rawValue == 4 {
							self = .LDKBalance_MaybePreimageClaimableHTLC
						}
			
						// LDKBalance_CounterpartyRevokedOutputClaimable
						if value.rawValue == 5 {
							self = .LDKBalance_CounterpartyRevokedOutputClaimable
						}
			
					}

					internal func getCValue() -> LDKBalance_Tag {
						switch self {
							
							case .LDKBalance_ClaimableOnChannelClose:
								// return LDKBalance_ClaimableOnChannelClose
								return LDKBalance_Tag(0)
			
							case .LDKBalance_ClaimableAwaitingConfirmations:
								// return LDKBalance_ClaimableAwaitingConfirmations
								return LDKBalance_Tag(1)
			
							case .LDKBalance_ContentiousClaimable:
								// return LDKBalance_ContentiousClaimable
								return LDKBalance_Tag(2)
			
							case .LDKBalance_MaybeTimeoutClaimableHTLC:
								// return LDKBalance_MaybeTimeoutClaimableHTLC
								return LDKBalance_Tag(3)
			
							case .LDKBalance_MaybePreimageClaimableHTLC:
								// return LDKBalance_MaybePreimageClaimableHTLC
								return LDKBalance_Tag(4)
			
							case .LDKBalance_CounterpartyRevokedOutputClaimable:
								// return LDKBalance_CounterpartyRevokedOutputClaimable
								return LDKBalance_Tag(5)
			
						}
					}

				}

			}
		