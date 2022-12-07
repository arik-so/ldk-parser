
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Currency = Bindings.Currency

			extension Bindings {

				/// Enum representing the crypto currencies (or networks) supported by this library
				public enum Currency {

					
					/// Bitcoin mainnet
					case Bitcoin
			
					/// Bitcoin testnet
					case BitcoinTestnet
			
					/// Bitcoin regtest
					case Regtest
			
					/// Bitcoin simnet
					case Simnet
			
					/// Bitcoin signet
					case Signet
			

					internal init (value: LDKCurrency) {

						// TODO: remove this initial assumption somehow
						self = .Signet

						
						if value == LDKCurrency_Bitcoin {
							self = .Bitcoin
						}
			
						if value == LDKCurrency_BitcoinTestnet {
							self = .BitcoinTestnet
						}
			
						if value == LDKCurrency_Regtest {
							self = .Regtest
						}
			
						if value == LDKCurrency_Simnet {
							self = .Simnet
						}
			
						if value == LDKCurrency_Signet {
							self = .Signet
						}
			
					}

					internal func getCValue() -> LDKCurrency {
						switch self {
							
							case .Bitcoin:
								return LDKCurrency_Bitcoin
			
							case .BitcoinTestnet:
								return LDKCurrency_BitcoinTestnet
			
							case .Regtest:
								return LDKCurrency_Regtest
			
							case .Simnet:
								return LDKCurrency_Simnet
			
							case .Signet:
								return LDKCurrency_Signet
			
						}
					}

				}

			}
		