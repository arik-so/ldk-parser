
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An enum which can either contain a  or not
			public typealias Option_NoneZ = Bindings.Option_NoneZ

			extension Bindings {

				/// An enum which can either contain a  or not
				public enum Option_NoneZ {

					
					/// When we're in this state, this COption_NoneZ contains a
					case Some
			
					/// When we're in this state, this COption_NoneZ contains nothing
					case None
			

					internal init (value: LDKCOption_NoneZ) {

						// TODO: remove this initial assumption somehow
						// self = .None

						switch value {
							
							// LDKCOption_NoneZ_Some
							// if value.rawValue == 0 {
							case LDKCOption_NoneZ_Some: // {
								self = .Some
							// }
			
							// LDKCOption_NoneZ_None
							// if value.rawValue == 1 {
							default: // {
								self = .None
							// }
			
						}
					}

					internal func getCValue() -> LDKCOption_NoneZ {
						switch self {
							
							case .Some:
								return LDKCOption_NoneZ_Some
								// return LDKCOption_NoneZ(0)
			
							case .None:
								return LDKCOption_NoneZ_None
								// return LDKCOption_NoneZ(1)
			
						}
					}

				}

			}
		