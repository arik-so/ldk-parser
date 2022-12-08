
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias SemanticError = Bindings.SemanticError

			extension Bindings {

				/// Errors that may occur when converting a `RawInvoice` to an `Invoice`. They relate to the
				/// requirements sections in BOLT #11
				public enum SemanticError {

					
					/// The invoice is missing the mandatory payment hash
					case NoPaymentHash
			
					/// The invoice has multiple payment hashes which isn't allowed
					case MultiplePaymentHashes
			
					/// No description or description hash are part of the invoice
					case NoDescription
			
					/// The invoice contains multiple descriptions and/or description hashes which isn't allowed
					case MultipleDescriptions
			
					/// The invoice is missing the mandatory payment secret, which all modern lightning nodes
					/// should provide.
					case NoPaymentSecret
			
					/// The invoice contains multiple payment secrets
					case MultiplePaymentSecrets
			
					/// The invoice's features are invalid
					case InvalidFeatures
			
					/// The recovery id doesn't fit the signature/pub key
					case InvalidRecoveryId
			
					/// The invoice's signature is invalid
					case InvalidSignature
			
					/// The invoice's amount was not a whole number of millisatoshis
					case ImpreciseAmount
			

					internal init (value: LDKSemanticError) {

						// TODO: remove this initial assumption somehow
						self = .ImpreciseAmount

						
						// LDKSemanticError_NoPaymentHash
						if value.rawValue == 0 {
							self = .NoPaymentHash
						}
			
						// LDKSemanticError_MultiplePaymentHashes
						if value.rawValue == 1 {
							self = .MultiplePaymentHashes
						}
			
						// LDKSemanticError_NoDescription
						if value.rawValue == 2 {
							self = .NoDescription
						}
			
						// LDKSemanticError_MultipleDescriptions
						if value.rawValue == 3 {
							self = .MultipleDescriptions
						}
			
						// LDKSemanticError_NoPaymentSecret
						if value.rawValue == 4 {
							self = .NoPaymentSecret
						}
			
						// LDKSemanticError_MultiplePaymentSecrets
						if value.rawValue == 5 {
							self = .MultiplePaymentSecrets
						}
			
						// LDKSemanticError_InvalidFeatures
						if value.rawValue == 6 {
							self = .InvalidFeatures
						}
			
						// LDKSemanticError_InvalidRecoveryId
						if value.rawValue == 7 {
							self = .InvalidRecoveryId
						}
			
						// LDKSemanticError_InvalidSignature
						if value.rawValue == 8 {
							self = .InvalidSignature
						}
			
						// LDKSemanticError_ImpreciseAmount
						if value.rawValue == 9 {
							self = .ImpreciseAmount
						}
			
					}

					internal func getCValue() -> LDKSemanticError {
						switch self {
							
							case .NoPaymentHash:
								// return LDKSemanticError_NoPaymentHash
								return LDKSemanticError(0)
			
							case .MultiplePaymentHashes:
								// return LDKSemanticError_MultiplePaymentHashes
								return LDKSemanticError(1)
			
							case .NoDescription:
								// return LDKSemanticError_NoDescription
								return LDKSemanticError(2)
			
							case .MultipleDescriptions:
								// return LDKSemanticError_MultipleDescriptions
								return LDKSemanticError(3)
			
							case .NoPaymentSecret:
								// return LDKSemanticError_NoPaymentSecret
								return LDKSemanticError(4)
			
							case .MultiplePaymentSecrets:
								// return LDKSemanticError_MultiplePaymentSecrets
								return LDKSemanticError(5)
			
							case .InvalidFeatures:
								// return LDKSemanticError_InvalidFeatures
								return LDKSemanticError(6)
			
							case .InvalidRecoveryId:
								// return LDKSemanticError_InvalidRecoveryId
								return LDKSemanticError(7)
			
							case .InvalidSignature:
								// return LDKSemanticError_InvalidSignature
								return LDKSemanticError(8)
			
							case .ImpreciseAmount:
								// return LDKSemanticError_ImpreciseAmount
								return LDKSemanticError(9)
			
						}
					}

				}

			}
		