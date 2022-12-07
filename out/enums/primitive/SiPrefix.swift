
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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
						self = .Pico

						
						if value == LDKSiPrefix_Milli {
							self = .Milli
						}
			
						if value == LDKSiPrefix_Micro {
							self = .Micro
						}
			
						if value == LDKSiPrefix_Nano {
							self = .Nano
						}
			
						if value == LDKSiPrefix_Pico {
							self = .Pico
						}
			
					}

					internal func getCValue() -> LDKSiPrefix {
						switch self {
							
							case .Milli:
								return LDKSiPrefix_Milli
			
							case .Micro:
								return LDKSiPrefix_Micro
			
							case .Nano:
								return LDKSiPrefix_Nano
			
							case .Pico:
								return LDKSiPrefix_Pico
			
						}
					}

				}

			}
		