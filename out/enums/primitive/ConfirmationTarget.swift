
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An enum that represents the speed at which we want a transaction to confirm used for feerate
			/// estimation.
			public typealias ConfirmationTarget = Bindings.ConfirmationTarget

			extension Bindings {

				/// An enum that represents the speed at which we want a transaction to confirm used for feerate
				/// estimation.
				public enum ConfirmationTarget {

					
					/// We are happy with this transaction confirming slowly when feerate drops some.
					case Background
			
					/// We'd like this transaction to confirm without major delay, but 12-18 blocks is fine.
					case Normal
			
					/// We'd like this transaction to confirm in the next few blocks.
					case HighPriority
			

					internal init (value: LDKConfirmationTarget) {

						// TODO: remove this initial assumption somehow
						self = .HighPriority

						
						// LDKConfirmationTarget_Background
						if value.rawValue == 0 {
							self = .Background
						}
			
						// LDKConfirmationTarget_Normal
						if value.rawValue == 1 {
							self = .Normal
						}
			
						// LDKConfirmationTarget_HighPriority
						if value.rawValue == 2 {
							self = .HighPriority
						}
			
					}

					internal func getCValue() -> LDKConfirmationTarget {
						switch self {
							
							case .Background:
								// return LDKConfirmationTarget_Background
								return LDKConfirmationTarget(0)
			
							case .Normal:
								// return LDKConfirmationTarget_Normal
								return LDKConfirmationTarget(1)
			
							case .HighPriority:
								// return LDKConfirmationTarget_HighPriority
								return LDKConfirmationTarget(2)
			
						}
					}

				}

			}
		