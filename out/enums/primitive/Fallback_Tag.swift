
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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

						
						if value == LDKFallback_SegWitProgram {
							self = .LDKFallback_SegWitProgram
						}
			
						if value == LDKFallback_PubKeyHash {
							self = .LDKFallback_PubKeyHash
						}
			
						if value == LDKFallback_ScriptHash {
							self = .LDKFallback_ScriptHash
						}
			
					}

					internal func getCValue() -> LDKFallback_Tag {
						switch self {
							
							case .LDKFallback_SegWitProgram:
								return LDKFallback_SegWitProgram
			
							case .LDKFallback_PubKeyHash:
								return LDKFallback_PubKeyHash
			
							case .LDKFallback_ScriptHash:
								return LDKFallback_ScriptHash
			
						}
					}

				}

			}
		