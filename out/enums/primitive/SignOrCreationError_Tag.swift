
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias SignOrCreationError_Tag = Bindings.SignOrCreationError_Tag

			extension Bindings {

				/// When signing using a fallible method either an user-supplied `SignError` or a `CreationError`
				/// may occur.
				public enum SignOrCreationError_Tag {

					
					/// An error occurred during signing
					case LDKSignOrCreationError_SignError
			
					/// An error occurred while building the transaction
					case LDKSignOrCreationError_CreationError
			

					internal init (value: LDKSignOrCreationError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKSignOrCreationError_CreationError

						
						// LDKSignOrCreationError_SignError
						if value.rawValue == 0 {
							self = .LDKSignOrCreationError_SignError
						}
			
						// LDKSignOrCreationError_CreationError
						if value.rawValue == 1 {
							self = .LDKSignOrCreationError_CreationError
						}
			
					}

					internal func getCValue() -> LDKSignOrCreationError_Tag {
						switch self {
							
							case .LDKSignOrCreationError_SignError:
								// return LDKSignOrCreationError_SignError
								return LDKSignOrCreationError_Tag(0)
			
							case .LDKSignOrCreationError_CreationError:
								// return LDKSignOrCreationError_CreationError
								return LDKSignOrCreationError_Tag(1)
			
						}
					}

				}

			}
		