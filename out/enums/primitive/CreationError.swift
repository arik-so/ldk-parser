
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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

						
						if value == LDKCreationError_DescriptionTooLong {
							self = .DescriptionTooLong
						}
			
						if value == LDKCreationError_RouteTooLong {
							self = .RouteTooLong
						}
			
						if value == LDKCreationError_TimestampOutOfBounds {
							self = .TimestampOutOfBounds
						}
			
						if value == LDKCreationError_InvalidAmount {
							self = .InvalidAmount
						}
			
						if value == LDKCreationError_MissingRouteHints {
							self = .MissingRouteHints
						}
			
					}

					internal func getCValue() -> LDKCreationError {
						switch self {
							
							case .DescriptionTooLong:
								return LDKCreationError_DescriptionTooLong
			
							case .RouteTooLong:
								return LDKCreationError_RouteTooLong
			
							case .TimestampOutOfBounds:
								return LDKCreationError_TimestampOutOfBounds
			
							case .InvalidAmount:
								return LDKCreationError_InvalidAmount
			
							case .MissingRouteHints:
								return LDKCreationError_MissingRouteHints
			
						}
					}

				}

			}
		