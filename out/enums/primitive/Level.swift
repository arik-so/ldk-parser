
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An enum representing the available verbosity levels of the logger.
			public typealias Level = Bindings.Level

			extension Bindings {

				/// An enum representing the available verbosity levels of the logger.
				public enum Level {

					
					/// Designates extremely verbose information, including gossip-induced messages
					case Gossip
			
					/// Designates very low priority, often extremely verbose, information
					case Trace
			
					/// Designates lower priority information
					case Debug
			
					/// Designates useful information
					case Info
			
					/// Designates hazardous situations
					case Warn
			
					/// Designates very serious errors
					case Error
			

					internal init (value: LDKLevel) {

						// TODO: remove this initial assumption somehow
						// self = .Error

						switch value {
							
							// LDKLevel_Gossip
							// if value.rawValue == 0 {
							case LDKLevel_Gossip: // {
								self = .Gossip
							// }
			
							// LDKLevel_Trace
							// if value.rawValue == 1 {
							case LDKLevel_Trace: // {
								self = .Trace
							// }
			
							// LDKLevel_Debug
							// if value.rawValue == 2 {
							case LDKLevel_Debug: // {
								self = .Debug
							// }
			
							// LDKLevel_Info
							// if value.rawValue == 3 {
							case LDKLevel_Info: // {
								self = .Info
							// }
			
							// LDKLevel_Warn
							// if value.rawValue == 4 {
							case LDKLevel_Warn: // {
								self = .Warn
							// }
			
							// LDKLevel_Error
							// if value.rawValue == 5 {
							default: // {
								self = .Error
							// }
			
						}
					}

					internal func getCValue() -> LDKLevel {
						switch self {
							
							case .Gossip:
								return LDKLevel_Gossip
								// return LDKLevel(0)
			
							case .Trace:
								return LDKLevel_Trace
								// return LDKLevel(1)
			
							case .Debug:
								return LDKLevel_Debug
								// return LDKLevel(2)
			
							case .Info:
								return LDKLevel_Info
								// return LDKLevel(3)
			
							case .Warn:
								return LDKLevel_Warn
								// return LDKLevel(4)
			
							case .Error:
								return LDKLevel_Error
								// return LDKLevel(5)
			
						}
					}

				}

			}
		