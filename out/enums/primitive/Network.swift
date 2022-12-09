
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An enum representing the possible Bitcoin or test networks which we can run on
			public typealias Network = Bindings.Network

			extension Bindings {

				/// An enum representing the possible Bitcoin or test networks which we can run on
				public enum Network {

					
					/// The main Bitcoin blockchain.
					case Bitcoin
			
					/// The testnet3 blockchain.
					case Testnet
			
					/// A local test blockchain.
					case Regtest
			
					/// A blockchain on which blocks are signed instead of mined.
					case Signet
			

					internal init (value: LDKNetwork) {

						// TODO: remove this initial assumption somehow
						// self = .Signet

						switch value {
							
							// LDKNetwork_Bitcoin
							// if value.rawValue == 0 {
							case LDKNetwork_Bitcoin: // {
								self = .Bitcoin
							// }
			
							// LDKNetwork_Testnet
							// if value.rawValue == 1 {
							case LDKNetwork_Testnet: // {
								self = .Testnet
							// }
			
							// LDKNetwork_Regtest
							// if value.rawValue == 2 {
							case LDKNetwork_Regtest: // {
								self = .Regtest
							// }
			
							// LDKNetwork_Signet
							// if value.rawValue == 3 {
							default: // {
								self = .Signet
							// }
			
						}
					}

					internal func getCValue() -> LDKNetwork {
						switch self {
							
							case .Bitcoin:
								return LDKNetwork_Bitcoin
								// return LDKNetwork(0)
			
							case .Testnet:
								return LDKNetwork_Testnet
								// return LDKNetwork(1)
			
							case .Regtest:
								return LDKNetwork_Regtest
								// return LDKNetwork(2)
			
							case .Signet:
								return LDKNetwork_Signet
								// return LDKNetwork(3)
			
						}
					}

				}

			}
		