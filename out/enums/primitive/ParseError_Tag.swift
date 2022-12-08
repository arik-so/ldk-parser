
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Errors that indicate what is wrong with the invoice. They have some granularity for debug
			/// reasons, but should generally result in an \"invalid BOLT11 invoice\" message for the user.
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

						
						// LDKParseError_Bech32Error
						if value.rawValue == 0 {
							self = .LDKParseError_Bech32Error
						}
			
						// LDKParseError_ParseAmountError
						if value.rawValue == 1 {
							self = .LDKParseError_ParseAmountError
						}
			
						// LDKParseError_MalformedSignature
						if value.rawValue == 2 {
							self = .LDKParseError_MalformedSignature
						}
			
						// LDKParseError_BadPrefix
						if value.rawValue == 3 {
							self = .LDKParseError_BadPrefix
						}
			
						// LDKParseError_UnknownCurrency
						if value.rawValue == 4 {
							self = .LDKParseError_UnknownCurrency
						}
			
						// LDKParseError_UnknownSiPrefix
						if value.rawValue == 5 {
							self = .LDKParseError_UnknownSiPrefix
						}
			
						// LDKParseError_MalformedHRP
						if value.rawValue == 6 {
							self = .LDKParseError_MalformedHRP
						}
			
						// LDKParseError_TooShortDataPart
						if value.rawValue == 7 {
							self = .LDKParseError_TooShortDataPart
						}
			
						// LDKParseError_UnexpectedEndOfTaggedFields
						if value.rawValue == 8 {
							self = .LDKParseError_UnexpectedEndOfTaggedFields
						}
			
						// LDKParseError_DescriptionDecodeError
						if value.rawValue == 9 {
							self = .LDKParseError_DescriptionDecodeError
						}
			
						// LDKParseError_PaddingError
						if value.rawValue == 10 {
							self = .LDKParseError_PaddingError
						}
			
						// LDKParseError_IntegerOverflowError
						if value.rawValue == 11 {
							self = .LDKParseError_IntegerOverflowError
						}
			
						// LDKParseError_InvalidSegWitProgramLength
						if value.rawValue == 12 {
							self = .LDKParseError_InvalidSegWitProgramLength
						}
			
						// LDKParseError_InvalidPubKeyHashLength
						if value.rawValue == 13 {
							self = .LDKParseError_InvalidPubKeyHashLength
						}
			
						// LDKParseError_InvalidScriptHashLength
						if value.rawValue == 14 {
							self = .LDKParseError_InvalidScriptHashLength
						}
			
						// LDKParseError_InvalidRecoveryId
						if value.rawValue == 15 {
							self = .LDKParseError_InvalidRecoveryId
						}
			
						// LDKParseError_InvalidSliceLength
						if value.rawValue == 16 {
							self = .LDKParseError_InvalidSliceLength
						}
			
						// LDKParseError_Skip
						if value.rawValue == 17 {
							self = .LDKParseError_Skip
						}
			
					}

					internal func getCValue() -> LDKParseError_Tag {
						switch self {
							
							case .LDKParseError_Bech32Error:
								// return LDKParseError_Bech32Error
								return LDKParseError_Tag(0)
			
							case .LDKParseError_ParseAmountError:
								// return LDKParseError_ParseAmountError
								return LDKParseError_Tag(1)
			
							case .LDKParseError_MalformedSignature:
								// return LDKParseError_MalformedSignature
								return LDKParseError_Tag(2)
			
							case .LDKParseError_BadPrefix:
								// return LDKParseError_BadPrefix
								return LDKParseError_Tag(3)
			
							case .LDKParseError_UnknownCurrency:
								// return LDKParseError_UnknownCurrency
								return LDKParseError_Tag(4)
			
							case .LDKParseError_UnknownSiPrefix:
								// return LDKParseError_UnknownSiPrefix
								return LDKParseError_Tag(5)
			
							case .LDKParseError_MalformedHRP:
								// return LDKParseError_MalformedHRP
								return LDKParseError_Tag(6)
			
							case .LDKParseError_TooShortDataPart:
								// return LDKParseError_TooShortDataPart
								return LDKParseError_Tag(7)
			
							case .LDKParseError_UnexpectedEndOfTaggedFields:
								// return LDKParseError_UnexpectedEndOfTaggedFields
								return LDKParseError_Tag(8)
			
							case .LDKParseError_DescriptionDecodeError:
								// return LDKParseError_DescriptionDecodeError
								return LDKParseError_Tag(9)
			
							case .LDKParseError_PaddingError:
								// return LDKParseError_PaddingError
								return LDKParseError_Tag(10)
			
							case .LDKParseError_IntegerOverflowError:
								// return LDKParseError_IntegerOverflowError
								return LDKParseError_Tag(11)
			
							case .LDKParseError_InvalidSegWitProgramLength:
								// return LDKParseError_InvalidSegWitProgramLength
								return LDKParseError_Tag(12)
			
							case .LDKParseError_InvalidPubKeyHashLength:
								// return LDKParseError_InvalidPubKeyHashLength
								return LDKParseError_Tag(13)
			
							case .LDKParseError_InvalidScriptHashLength:
								// return LDKParseError_InvalidScriptHashLength
								return LDKParseError_Tag(14)
			
							case .LDKParseError_InvalidRecoveryId:
								// return LDKParseError_InvalidRecoveryId
								return LDKParseError_Tag(15)
			
							case .LDKParseError_InvalidSliceLength:
								// return LDKParseError_InvalidSliceLength
								return LDKParseError_Tag(16)
			
							case .LDKParseError_Skip:
								// return LDKParseError_Skip
								return LDKParseError_Tag(17)
			
						}
					}

				}

			}
		