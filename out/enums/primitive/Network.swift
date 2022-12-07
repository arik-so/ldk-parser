
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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
						self = .Signet

						
						if value == LDKNetwork_Bitcoin {
							self = .Bitcoin
						}
			
						if value == LDKNetwork_Testnet {
							self = .Testnet
						}
			
						if value == LDKNetwork_Regtest {
							self = .Regtest
						}
			
						if value == LDKNetwork_Signet {
							self = .Signet
						}
			
					}

					internal func getCValue() -> LDKNetwork {
						switch self {
							
							case .Bitcoin:
								return LDKNetwork_Bitcoin
			
							case .Testnet:
								return LDKNetwork_Testnet
			
							case .Regtest:
								return LDKNetwork_Regtest
			
							case .Signet:
								return LDKNetwork_Signet
			
						}
					}

				}

			}
		