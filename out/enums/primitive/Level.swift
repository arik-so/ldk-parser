
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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
						self = .Error

						
						if value == LDKLevel_Gossip {
							self = .Gossip
						}
			
						if value == LDKLevel_Trace {
							self = .Trace
						}
			
						if value == LDKLevel_Debug {
							self = .Debug
						}
			
						if value == LDKLevel_Info {
							self = .Info
						}
			
						if value == LDKLevel_Warn {
							self = .Warn
						}
			
						if value == LDKLevel_Error {
							self = .Error
						}
			
					}

					internal func getCValue() -> LDKLevel {
						switch self {
							
							case .Gossip:
								return LDKLevel_Gossip
			
							case .Trace:
								return LDKLevel_Trace
			
							case .Debug:
								return LDKLevel_Debug
			
							case .Info:
								return LDKLevel_Info
			
							case .Warn:
								return LDKLevel_Warn
			
							case .Error:
								return LDKLevel_Error
			
						}
					}

				}

			}
		