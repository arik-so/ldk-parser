
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ParseError_Tag = Bindings.ParseError_Tag

			extension Bindings {

				/// Errors that indicate what is wrong with the invoice. They have some granularity for debug
				/// reasons, but should generally result in an \"invalid BOLT11 invoice\" message for the user.
				public enum ParseError_Tag {

					
					/// 
					case LDKParseError_Bech32Error
			
					/// 
					case LDKParseError_ParseAmountError
			
					/// 
					case LDKParseError_MalformedSignature
			
					/// 
					case LDKParseError_BadPrefix
			
					/// 
					case LDKParseError_UnknownCurrency
			
					/// 
					case LDKParseError_UnknownSiPrefix
			
					/// 
					case LDKParseError_MalformedHRP
			
					/// 
					case LDKParseError_TooShortDataPart
			
					/// 
					case LDKParseError_UnexpectedEndOfTaggedFields
			
					/// 
					case LDKParseError_DescriptionDecodeError
			
					/// 
					case LDKParseError_PaddingError
			
					/// 
					case LDKParseError_IntegerOverflowError
			
					/// 
					case LDKParseError_InvalidSegWitProgramLength
			
					/// 
					case LDKParseError_InvalidPubKeyHashLength
			
					/// 
					case LDKParseError_InvalidScriptHashLength
			
					/// 
					case LDKParseError_InvalidRecoveryId
			
					/// 
					case LDKParseError_InvalidSliceLength
			
					/// Not an error, but used internally to signal that a part of the invoice should be ignored
					/// according to BOLT11
					case LDKParseError_Skip
			

					internal init (value: LDKParseError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKParseError_Skip

						
						if value == LDKParseError_Bech32Error {
							self = .LDKParseError_Bech32Error
						}
			
						if value == LDKParseError_ParseAmountError {
							self = .LDKParseError_ParseAmountError
						}
			
						if value == LDKParseError_MalformedSignature {
							self = .LDKParseError_MalformedSignature
						}
			
						if value == LDKParseError_BadPrefix {
							self = .LDKParseError_BadPrefix
						}
			
						if value == LDKParseError_UnknownCurrency {
							self = .LDKParseError_UnknownCurrency
						}
			
						if value == LDKParseError_UnknownSiPrefix {
							self = .LDKParseError_UnknownSiPrefix
						}
			
						if value == LDKParseError_MalformedHRP {
							self = .LDKParseError_MalformedHRP
						}
			
						if value == LDKParseError_TooShortDataPart {
							self = .LDKParseError_TooShortDataPart
						}
			
						if value == LDKParseError_UnexpectedEndOfTaggedFields {
							self = .LDKParseError_UnexpectedEndOfTaggedFields
						}
			
						if value == LDKParseError_DescriptionDecodeError {
							self = .LDKParseError_DescriptionDecodeError
						}
			
						if value == LDKParseError_PaddingError {
							self = .LDKParseError_PaddingError
						}
			
						if value == LDKParseError_IntegerOverflowError {
							self = .LDKParseError_IntegerOverflowError
						}
			
						if value == LDKParseError_InvalidSegWitProgramLength {
							self = .LDKParseError_InvalidSegWitProgramLength
						}
			
						if value == LDKParseError_InvalidPubKeyHashLength {
							self = .LDKParseError_InvalidPubKeyHashLength
						}
			
						if value == LDKParseError_InvalidScriptHashLength {
							self = .LDKParseError_InvalidScriptHashLength
						}
			
						if value == LDKParseError_InvalidRecoveryId {
							self = .LDKParseError_InvalidRecoveryId
						}
			
						if value == LDKParseError_InvalidSliceLength {
							self = .LDKParseError_InvalidSliceLength
						}
			
						if value == LDKParseError_Skip {
							self = .LDKParseError_Skip
						}
			
					}

					internal func getCValue() -> LDKParseError_Tag {
						switch self {
							
							case .LDKParseError_Bech32Error:
								return LDKParseError_Bech32Error
			
							case .LDKParseError_ParseAmountError:
								return LDKParseError_ParseAmountError
			
							case .LDKParseError_MalformedSignature:
								return LDKParseError_MalformedSignature
			
							case .LDKParseError_BadPrefix:
								return LDKParseError_BadPrefix
			
							case .LDKParseError_UnknownCurrency:
								return LDKParseError_UnknownCurrency
			
							case .LDKParseError_UnknownSiPrefix:
								return LDKParseError_UnknownSiPrefix
			
							case .LDKParseError_MalformedHRP:
								return LDKParseError_MalformedHRP
			
							case .LDKParseError_TooShortDataPart:
								return LDKParseError_TooShortDataPart
			
							case .LDKParseError_UnexpectedEndOfTaggedFields:
								return LDKParseError_UnexpectedEndOfTaggedFields
			
							case .LDKParseError_DescriptionDecodeError:
								return LDKParseError_DescriptionDecodeError
			
							case .LDKParseError_PaddingError:
								return LDKParseError_PaddingError
			
							case .LDKParseError_IntegerOverflowError:
								return LDKParseError_IntegerOverflowError
			
							case .LDKParseError_InvalidSegWitProgramLength:
								return LDKParseError_InvalidSegWitProgramLength
			
							case .LDKParseError_InvalidPubKeyHashLength:
								return LDKParseError_InvalidPubKeyHashLength
			
							case .LDKParseError_InvalidScriptHashLength:
								return LDKParseError_InvalidScriptHashLength
			
							case .LDKParseError_InvalidRecoveryId:
								return LDKParseError_InvalidRecoveryId
			
							case .LDKParseError_InvalidSliceLength:
								return LDKParseError_InvalidSliceLength
			
							case .LDKParseError_Skip:
								return LDKParseError_Skip
			
						}
					}

				}

			}
		