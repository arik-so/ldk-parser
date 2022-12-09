
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// SI prefixes for the human readable part
			public typealias SiPrefix = Bindings.SiPrefix

			extension Bindings {

				/// SI prefixes for the human readable part
				public enum SiPrefix {

					
					/// 10^-3
					case Milli
			
					/// 10^-6
					case Micro
			
					/// 10^-9
					case Nano
			
					/// 10^-12
					case Pico
			

					internal init (value: LDKSiPrefix) {

						// TODO: remove this initial assumption somehow
						// self = .Pico

						switch value {
							
							// LDKSiPrefix_Milli
							// if value.rawValue == 0 {
							case LDKSiPrefix_Milli: // {
								self = .Milli
							// }
			
							// LDKSiPrefix_Micro
							// if value.rawValue == 1 {
							case LDKSiPrefix_Micro: // {
								self = .Micro
							// }
			
							// LDKSiPrefix_Nano
							// if value.rawValue == 2 {
							case LDKSiPrefix_Nano: // {
								self = .Nano
							// }
			
							// LDKSiPrefix_Pico
							// if value.rawValue == 3 {
							default: // {
								self = .Pico
							// }
			
						}
					}

					internal func getCValue() -> LDKSiPrefix {
						switch self {
							
							case .Milli:
								return LDKSiPrefix_Milli
								// return LDKSiPrefix(0)
			
							case .Micro:
								return LDKSiPrefix_Micro
								// return LDKSiPrefix(1)
			
							case .Nano:
								return LDKSiPrefix_Nano
								// return LDKSiPrefix(2)
			
							case .Pico:
								return LDKSiPrefix_Pico
								// return LDKSiPrefix(3)
			
						}
					}

				}

			}
		