
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

						
						// LDKAccessError_UnknownChain
						if value.rawValue == 0 {
							self = .UnknownChain
						}
			
						// LDKAccessError_UnknownTx
						if value.rawValue == 1 {
							self = .UnknownTx
						}
			
					}

					internal func getCValue() -> LDKAccessError {
						switch self {
							
							case .UnknownChain:
								// return LDKAccessError_UnknownChain
								return LDKAccessError(0)
			
							case .UnknownTx:
								// return LDKAccessError_UnknownTx
								return LDKAccessError(1)
			
						}
					}

				}

			}
		