
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Retry_Tag = Bindings.Retry_Tag

			extension Bindings {

				/// Strategies available to retry payment path failures for an [`Invoice`].
				public enum Retry_Tag {

					
					/// Max number of attempts to retry payment.
					/// 
					/// Note that this is the number of *path* failures, not full payment retries. For multi-path
					/// payments, if this is less than the total number of paths, we will never even retry all of the
					/// payment's paths.
					case LDKRetry_Attempts
			
					/// Time elapsed before abandoning retries for a payment.
					case LDKRetry_Timeout
			

					internal init (value: LDKRetry_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKRetry_Timeout

						
						if value == LDKRetry_Attempts {
							self = .LDKRetry_Attempts
						}
			
						if value == LDKRetry_Timeout {
							self = .LDKRetry_Timeout
						}
			
					}

					internal func getCValue() -> LDKRetry_Tag {
						switch self {
							
							case .LDKRetry_Attempts:
								return LDKRetry_Attempts
			
							case .LDKRetry_Timeout:
								return LDKRetry_Timeout
			
						}
					}

				}

			}
		