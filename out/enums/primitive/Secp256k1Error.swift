
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents an error returned from libsecp256k1 during validation of some secp256k1 data
			public typealias Secp256k1Error = Bindings.Secp256k1Error

			extension Bindings {

				/// Represents an error returned from libsecp256k1 during validation of some secp256k1 data
				public enum Secp256k1Error {

					
					/// Signature failed verification
					case IncorrectSignature
			
					/// Badly sized message ("messages" are actually fixed-sized digests; see the MESSAGE_SIZE constant)
					case InvalidMessage
			
					/// Bad public key
					case InvalidPublicKey
			
					/// Bad signature
					case InvalidSignature
			
					/// Bad secret key
					case InvalidSecretKey
			
					/// Bad shared secret.
					case InvalidSharedSecret
			
					/// Bad recovery id
					case InvalidRecoveryId
			
					/// Invalid tweak for add_assign or mul_assign
					case InvalidTweak
			
					/// Didn't pass enough memory to context creation with preallocated memory
					case NotEnoughMemory
			
					/// Bad set of public keys.
					case InvalidPublicKeySum
			
					/// The only valid parity values are 0 or 1.
					case InvalidParityValue
			

					internal init (value: LDKSecp256k1Error) {

						// TODO: remove this initial assumption somehow
						// self = .InvalidParityValue

						switch value {
							
							// LDKSecp256k1Error_IncorrectSignature
							// if value.rawValue == 0 {
							case LDKSecp256k1Error_IncorrectSignature: // {
								self = .IncorrectSignature
							// }
			
							// LDKSecp256k1Error_InvalidMessage
							// if value.rawValue == 1 {
							case LDKSecp256k1Error_InvalidMessage: // {
								self = .InvalidMessage
							// }
			
							// LDKSecp256k1Error_InvalidPublicKey
							// if value.rawValue == 2 {
							case LDKSecp256k1Error_InvalidPublicKey: // {
								self = .InvalidPublicKey
							// }
			
							// LDKSecp256k1Error_InvalidSignature
							// if value.rawValue == 3 {
							case LDKSecp256k1Error_InvalidSignature: // {
								self = .InvalidSignature
							// }
			
							// LDKSecp256k1Error_InvalidSecretKey
							// if value.rawValue == 4 {
							case LDKSecp256k1Error_InvalidSecretKey: // {
								self = .InvalidSecretKey
							// }
			
							// LDKSecp256k1Error_InvalidSharedSecret
							// if value.rawValue == 5 {
							case LDKSecp256k1Error_InvalidSharedSecret: // {
								self = .InvalidSharedSecret
							// }
			
							// LDKSecp256k1Error_InvalidRecoveryId
							// if value.rawValue == 6 {
							case LDKSecp256k1Error_InvalidRecoveryId: // {
								self = .InvalidRecoveryId
							// }
			
							// LDKSecp256k1Error_InvalidTweak
							// if value.rawValue == 7 {
							case LDKSecp256k1Error_InvalidTweak: // {
								self = .InvalidTweak
							// }
			
							// LDKSecp256k1Error_NotEnoughMemory
							// if value.rawValue == 8 {
							case LDKSecp256k1Error_NotEnoughMemory: // {
								self = .NotEnoughMemory
							// }
			
							// LDKSecp256k1Error_InvalidPublicKeySum
							// if value.rawValue == 9 {
							case LDKSecp256k1Error_InvalidPublicKeySum: // {
								self = .InvalidPublicKeySum
							// }
			
							// LDKSecp256k1Error_InvalidParityValue
							// if value.rawValue == 10 {
							default: // {
								self = .InvalidParityValue
							// }
			
						}
					}

					internal func getCValue() -> LDKSecp256k1Error {
						switch self {
							
							case .IncorrectSignature:
								return LDKSecp256k1Error_IncorrectSignature
								// return LDKSecp256k1Error(0)
			
							case .InvalidMessage:
								return LDKSecp256k1Error_InvalidMessage
								// return LDKSecp256k1Error(1)
			
							case .InvalidPublicKey:
								return LDKSecp256k1Error_InvalidPublicKey
								// return LDKSecp256k1Error(2)
			
							case .InvalidSignature:
								return LDKSecp256k1Error_InvalidSignature
								// return LDKSecp256k1Error(3)
			
							case .InvalidSecretKey:
								return LDKSecp256k1Error_InvalidSecretKey
								// return LDKSecp256k1Error(4)
			
							case .InvalidSharedSecret:
								return LDKSecp256k1Error_InvalidSharedSecret
								// return LDKSecp256k1Error(5)
			
							case .InvalidRecoveryId:
								return LDKSecp256k1Error_InvalidRecoveryId
								// return LDKSecp256k1Error(6)
			
							case .InvalidTweak:
								return LDKSecp256k1Error_InvalidTweak
								// return LDKSecp256k1Error(7)
			
							case .NotEnoughMemory:
								return LDKSecp256k1Error_NotEnoughMemory
								// return LDKSecp256k1Error(8)
			
							case .InvalidPublicKeySum:
								return LDKSecp256k1Error_InvalidPublicKeySum
								// return LDKSecp256k1Error(9)
			
							case .InvalidParityValue:
								return LDKSecp256k1Error_InvalidParityValue
								// return LDKSecp256k1Error(10)
			
						}
					}

				}

			}
		