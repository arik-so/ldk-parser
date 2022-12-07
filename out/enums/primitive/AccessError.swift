
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias AccessError = Bindings.AccessError

			extension Bindings {

				/// An error when accessing the chain via [`Access`].
				public enum AccessError {

					
					/// The requested chain is unknown.
					case UnknownChain
			
					/// The requested transaction doesn't exist or hasn't confirmed.
					case UnknownTx
			

					internal init (value: LDKAccessError) {

						// TODO: remove this initial assumption somehow
						self = .UnknownTx

						
						if value == LDKAccessError_UnknownChain {
							self = .UnknownChain
						}
			
						if value == LDKAccessError_UnknownTx {
							self = .UnknownTx
						}
			
					}

					internal func getCValue() -> LDKAccessError {
						switch self {
							
							case .UnknownChain:
								return LDKAccessError_UnknownChain
			
							case .UnknownTx:
								return LDKAccessError_UnknownTx
			
						}
					}

				}

			}
		