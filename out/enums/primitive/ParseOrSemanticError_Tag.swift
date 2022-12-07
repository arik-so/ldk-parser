
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ParseOrSemanticError_Tag = Bindings.ParseOrSemanticError_Tag

			extension Bindings {

				/// Indicates that something went wrong while parsing or validating the invoice. Parsing errors
				/// should be mostly seen as opaque and are only there for debugging reasons. Semantic errors
				/// like wrong signatures, missing fields etc. could mean that someone tampered with the invoice.
				public enum ParseOrSemanticError_Tag {

					
					/// The invoice couldn't be decoded
					case LDKParseOrSemanticError_ParseError
			
					/// The invoice could be decoded but violates the BOLT11 standard
					case LDKParseOrSemanticError_SemanticError
			

					internal init (value: LDKParseOrSemanticError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKParseOrSemanticError_SemanticError

						
						if value == LDKParseOrSemanticError_ParseError {
							self = .LDKParseOrSemanticError_ParseError
						}
			
						if value == LDKParseOrSemanticError_SemanticError {
							self = .LDKParseOrSemanticError_SemanticError
						}
			
					}

					internal func getCValue() -> LDKParseOrSemanticError_Tag {
						switch self {
							
							case .LDKParseOrSemanticError_ParseError:
								return LDKParseOrSemanticError_ParseError
			
							case .LDKParseOrSemanticError_SemanticError:
								return LDKParseOrSemanticError_SemanticError
			
						}
					}

				}

			}
		