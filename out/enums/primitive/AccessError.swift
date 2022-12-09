
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An error when accessing the chain via [`Access`].
			public typealias AccessError = Bindings.AccessError

			extension Bindings {

				/// An error when accessing the chain via [`Access`].
				public enum AccessError {

					
					/// The requested chain is unknown.
					case UnknownChain
			
					/// The requested transaction doesn't exist or hasn't confirmed.
					case UnknownTx
			

					internal init (value: LDKAccessError) {
						switch value {
							
							case LDKAccessError_UnknownChain:
								self = .UnknownChain
			
							default:
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
		