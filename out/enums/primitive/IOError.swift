
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias IOError = Bindings.IOError

			extension Bindings {

				/// Represents an IO Error. Note that some information is lost in the conversion from Rust.
				public enum IOError {

					
					/// 
					case NotFound
			
					/// 
					case PermissionDenied
			
					/// 
					case ConnectionRefused
			
					/// 
					case ConnectionReset
			
					/// 
					case ConnectionAborted
			
					/// 
					case NotConnected
			
					/// 
					case AddrInUse
			
					/// 
					case AddrNotAvailable
			
					/// 
					case BrokenPipe
			
					/// 
					case AlreadyExists
			
					/// 
					case WouldBlock
			
					/// 
					case InvalidInput
			
					/// 
					case InvalidData
			
					/// 
					case TimedOut
			
					/// 
					case WriteZero
			
					/// 
					case Interrupted
			
					/// 
					case Other
			
					/// 
					case UnexpectedEof
			

					internal init (value: LDKIOError) {

						// TODO: remove this initial assumption somehow
						self = .UnexpectedEof

						
						if value == LDKIOError_NotFound {
							self = .NotFound
						}
			
						if value == LDKIOError_PermissionDenied {
							self = .PermissionDenied
						}
			
						if value == LDKIOError_ConnectionRefused {
							self = .ConnectionRefused
						}
			
						if value == LDKIOError_ConnectionReset {
							self = .ConnectionReset
						}
			
						if value == LDKIOError_ConnectionAborted {
							self = .ConnectionAborted
						}
			
						if value == LDKIOError_NotConnected {
							self = .NotConnected
						}
			
						if value == LDKIOError_AddrInUse {
							self = .AddrInUse
						}
			
						if value == LDKIOError_AddrNotAvailable {
							self = .AddrNotAvailable
						}
			
						if value == LDKIOError_BrokenPipe {
							self = .BrokenPipe
						}
			
						if value == LDKIOError_AlreadyExists {
							self = .AlreadyExists
						}
			
						if value == LDKIOError_WouldBlock {
							self = .WouldBlock
						}
			
						if value == LDKIOError_InvalidInput {
							self = .InvalidInput
						}
			
						if value == LDKIOError_InvalidData {
							self = .InvalidData
						}
			
						if value == LDKIOError_TimedOut {
							self = .TimedOut
						}
			
						if value == LDKIOError_WriteZero {
							self = .WriteZero
						}
			
						if value == LDKIOError_Interrupted {
							self = .Interrupted
						}
			
						if value == LDKIOError_Other {
							self = .Other
						}
			
						if value == LDKIOError_UnexpectedEof {
							self = .UnexpectedEof
						}
			
					}

					internal func getCValue() -> LDKIOError {
						switch self {
							
							case .NotFound:
								return LDKIOError_NotFound
			
							case .PermissionDenied:
								return LDKIOError_PermissionDenied
			
							case .ConnectionRefused:
								return LDKIOError_ConnectionRefused
			
							case .ConnectionReset:
								return LDKIOError_ConnectionReset
			
							case .ConnectionAborted:
								return LDKIOError_ConnectionAborted
			
							case .NotConnected:
								return LDKIOError_NotConnected
			
							case .AddrInUse:
								return LDKIOError_AddrInUse
			
							case .AddrNotAvailable:
								return LDKIOError_AddrNotAvailable
			
							case .BrokenPipe:
								return LDKIOError_BrokenPipe
			
							case .AlreadyExists:
								return LDKIOError_AlreadyExists
			
							case .WouldBlock:
								return LDKIOError_WouldBlock
			
							case .InvalidInput:
								return LDKIOError_InvalidInput
			
							case .InvalidData:
								return LDKIOError_InvalidData
			
							case .TimedOut:
								return LDKIOError_TimedOut
			
							case .WriteZero:
								return LDKIOError_WriteZero
			
							case .Interrupted:
								return LDKIOError_Interrupted
			
							case .Other:
								return LDKIOError_Other
			
							case .UnexpectedEof:
								return LDKIOError_UnexpectedEof
			
						}
					}

				}

			}
		