
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Fallback address in case no LN payment is possible
			public typealias Fallback_Tag = Bindings.Fallback_Tag

			extension Bindings {

				/// Fallback address in case no LN payment is possible
				public enum Fallback_Tag {

					
					/// 
					case LDKFallback_SegWitProgram
			
					/// 
					case LDKFallback_PubKeyHash
			
					/// 
					case LDKFallback_ScriptHash
			

					internal init (value: LDKFallback_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKFallback_ScriptHash

						
						// LDKFallback_SegWitProgram
						if value.rawValue == 0 {
							self = .LDKFallback_SegWitProgram
						}
			
						// LDKFallback_PubKeyHash
						if value.rawValue == 1 {
							self = .LDKFallback_PubKeyHash
						}
			
						// LDKFallback_ScriptHash
						if value.rawValue == 2 {
							self = .LDKFallback_ScriptHash
						}
			
					}

					internal func getCValue() -> LDKFallback_Tag {
						switch self {
							
							case .LDKFallback_SegWitProgram:
								// return LDKFallback_SegWitProgram
								return LDKFallback_Tag(0)
			
							case .LDKFallback_PubKeyHash:
								// return LDKFallback_PubKeyHash
								return LDKFallback_Tag(1)
			
							case .LDKFallback_ScriptHash:
								// return LDKFallback_ScriptHash
								return LDKFallback_Tag(2)
			
						}
					}

				}

			}
		