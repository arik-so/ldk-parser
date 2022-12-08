
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The effective capacity of a channel for routing purposes.
			/// 
			/// While this may be smaller than the actual channel capacity, amounts greater than
			/// [`Self::as_msat`] should not be routed through the channel.
			public typealias EffectiveCapacity_Tag = Bindings.EffectiveCapacity_Tag

			extension Bindings {

				/// The effective capacity of a channel for routing purposes.
				/// 
				/// While this may be smaller than the actual channel capacity, amounts greater than
				/// [`Self::as_msat`] should not be routed through the channel.
				public enum EffectiveCapacity_Tag {

					
					/// The available liquidity in the channel known from being a channel counterparty, and thus a
					/// direct hop.
					case LDKEffectiveCapacity_ExactLiquidity
			
					/// The maximum HTLC amount in one direction as advertised on the gossip network.
					case LDKEffectiveCapacity_MaximumHTLC
			
					/// The total capacity of the channel as determined by the funding transaction.
					case LDKEffectiveCapacity_Total
			
					/// A capacity sufficient to route any payment, typically used for private channels provided by
					/// an invoice.
					case LDKEffectiveCapacity_Infinite
			
					/// A capacity that is unknown possibly because either the chain state is unavailable to know
					/// the total capacity or the `htlc_maximum_msat` was not advertised on the gossip network.
					case LDKEffectiveCapacity_Unknown
			

					internal init (value: LDKEffectiveCapacity_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKEffectiveCapacity_Unknown

						
						// LDKEffectiveCapacity_ExactLiquidity
						if value.rawValue == 0 {
							self = .LDKEffectiveCapacity_ExactLiquidity
						}
			
						// LDKEffectiveCapacity_MaximumHTLC
						if value.rawValue == 1 {
							self = .LDKEffectiveCapacity_MaximumHTLC
						}
			
						// LDKEffectiveCapacity_Total
						if value.rawValue == 2 {
							self = .LDKEffectiveCapacity_Total
						}
			
						// LDKEffectiveCapacity_Infinite
						if value.rawValue == 3 {
							self = .LDKEffectiveCapacity_Infinite
						}
			
						// LDKEffectiveCapacity_Unknown
						if value.rawValue == 4 {
							self = .LDKEffectiveCapacity_Unknown
						}
			
					}

					internal func getCValue() -> LDKEffectiveCapacity_Tag {
						switch self {
							
							case .LDKEffectiveCapacity_ExactLiquidity:
								// return LDKEffectiveCapacity_ExactLiquidity
								return LDKEffectiveCapacity_Tag(0)
			
							case .LDKEffectiveCapacity_MaximumHTLC:
								// return LDKEffectiveCapacity_MaximumHTLC
								return LDKEffectiveCapacity_Tag(1)
			
							case .LDKEffectiveCapacity_Total:
								// return LDKEffectiveCapacity_Total
								return LDKEffectiveCapacity_Tag(2)
			
							case .LDKEffectiveCapacity_Infinite:
								// return LDKEffectiveCapacity_Infinite
								return LDKEffectiveCapacity_Tag(3)
			
							case .LDKEffectiveCapacity_Unknown:
								// return LDKEffectiveCapacity_Unknown
								return LDKEffectiveCapacity_Tag(4)
			
						}
					}

				}

			}
		