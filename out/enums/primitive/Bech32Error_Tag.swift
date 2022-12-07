
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Bech32Error_Tag = Bindings.Bech32Error_Tag

			extension Bindings {

				/// Represents an error returned from the bech32 library during validation of some bech32 data
				public enum Bech32Error_Tag {

					
					/// String does not contain the separator character
					case LDKBech32Error_MissingSeparator
			
					/// The checksum does not match the rest of the data
					case LDKBech32Error_InvalidChecksum
			
					/// The data or human-readable part is too long or too short
					case LDKBech32Error_InvalidLength
			
					/// Some part of the string contains an invalid character
					case LDKBech32Error_InvalidChar
			
					/// Some part of the data has an invalid value
					case LDKBech32Error_InvalidData
			
					/// The bit conversion failed due to a padding issue
					case LDKBech32Error_InvalidPadding
			
					/// The whole string must be of one case
					case LDKBech32Error_MixedCase
			

					internal init (value: LDKBech32Error_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKBech32Error_MixedCase

						
						if value == LDKBech32Error_MissingSeparator {
							self = .LDKBech32Error_MissingSeparator
						}
			
						if value == LDKBech32Error_InvalidChecksum {
							self = .LDKBech32Error_InvalidChecksum
						}
			
						if value == LDKBech32Error_InvalidLength {
							self = .LDKBech32Error_InvalidLength
						}
			
						if value == LDKBech32Error_InvalidChar {
							self = .LDKBech32Error_InvalidChar
						}
			
						if value == LDKBech32Error_InvalidData {
							self = .LDKBech32Error_InvalidData
						}
			
						if value == LDKBech32Error_InvalidPadding {
							self = .LDKBech32Error_InvalidPadding
						}
			
						if value == LDKBech32Error_MixedCase {
							self = .LDKBech32Error_MixedCase
						}
			
					}

					internal func getCValue() -> LDKBech32Error_Tag {
						switch self {
							
							case .LDKBech32Error_MissingSeparator:
								return LDKBech32Error_MissingSeparator
			
							case .LDKBech32Error_InvalidChecksum:
								return LDKBech32Error_InvalidChecksum
			
							case .LDKBech32Error_InvalidLength:
								return LDKBech32Error_InvalidLength
			
							case .LDKBech32Error_InvalidChar:
								return LDKBech32Error_InvalidChar
			
							case .LDKBech32Error_InvalidData:
								return LDKBech32Error_InvalidData
			
							case .LDKBech32Error_InvalidPadding:
								return LDKBech32Error_InvalidPadding
			
							case .LDKBech32Error_MixedCase:
								return LDKBech32Error_MixedCase
			
						}
					}

				}

			}
		