
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

						
						if value == LDKSignOrCreationError_SignError {
							self = .LDKSignOrCreationError_SignError
						}
			
						if value == LDKSignOrCreationError_CreationError {
							self = .LDKSignOrCreationError_CreationError
						}
			
					}

					internal func getCValue() -> LDKSignOrCreationError_Tag {
						switch self {
							
							case .LDKSignOrCreationError_SignError:
								return LDKSignOrCreationError_SignError
			
							case .LDKSignOrCreationError_CreationError:
								return LDKSignOrCreationError_CreationError
			
						}
					}

				}

			}
		