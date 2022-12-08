
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Errors that may occur when constructing a new `RawInvoice` or `Invoice`
			public typealias CreationError = Bindings.CreationError

			extension Bindings {

				/// Errors that may occur when constructing a new `RawInvoice` or `Invoice`
				public enum CreationError {

					
					/// The supplied description string was longer than 639 __bytes__ (see [`Description::new(…)`](./struct.Description.html#method.new))
					case DescriptionTooLong
			
					/// The specified route has too many hops and can't be encoded
					case RouteTooLong
			
					/// The Unix timestamp of the supplied date is less than zero or greater than 35-bits
					case TimestampOutOfBounds
			
					/// The supplied millisatoshi amount was greater than the total bitcoin supply.
					case InvalidAmount
			
					/// Route hints were required for this invoice and were missing. Applies to
					/// [phantom invoices].
					/// 
					/// [phantom invoices]: crate::utils::create_phantom_invoice
					case MissingRouteHints
			

					internal init (value: LDKCreationError) {

						// TODO: remove this initial assumption somehow
						self = .MissingRouteHints

						
						// LDKCreationError_DescriptionTooLong
						if value.rawValue == 0 {
							self = .DescriptionTooLong
						}
			
						// LDKCreationError_RouteTooLong
						if value.rawValue == 1 {
							self = .RouteTooLong
						}
			
						// LDKCreationError_TimestampOutOfBounds
						if value.rawValue == 2 {
							self = .TimestampOutOfBounds
						}
			
						// LDKCreationError_InvalidAmount
						if value.rawValue == 3 {
							self = .InvalidAmount
						}
			
						// LDKCreationError_MissingRouteHints
						if value.rawValue == 4 {
							self = .MissingRouteHints
						}
			
					}

					internal func getCValue() -> LDKCreationError {
						switch self {
							
							case .DescriptionTooLong:
								// return LDKCreationError_DescriptionTooLong
								return LDKCreationError(0)
			
							case .RouteTooLong:
								// return LDKCreationError_RouteTooLong
								return LDKCreationError(1)
			
							case .TimestampOutOfBounds:
								// return LDKCreationError_TimestampOutOfBounds
								return LDKCreationError(2)
			
							case .InvalidAmount:
								// return LDKCreationError_InvalidAmount
								return LDKCreationError(3)
			
							case .MissingRouteHints:
								// return LDKCreationError_MissingRouteHints
								return LDKCreationError(4)
			
						}
					}

				}

			}
		