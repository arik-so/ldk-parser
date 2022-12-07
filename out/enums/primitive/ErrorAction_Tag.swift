
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ErrorAction_Tag = Bindings.ErrorAction_Tag

			extension Bindings {

				/// Used to put an error message in a LightningError
				public enum ErrorAction_Tag {

					
					/// The peer took some action which made us think they were useless. Disconnect them.
					case LDKErrorAction_DisconnectPeer
			
					/// The peer did something harmless that we weren't able to process, just log and ignore
					case LDKErrorAction_IgnoreError
			
					/// The peer did something harmless that we weren't able to meaningfully process.
					/// If the error is logged, log it at the given level.
					case LDKErrorAction_IgnoreAndLog
			
					/// The peer provided us with a gossip message which we'd already seen. In most cases this
					/// should be ignored, but it may result in the message being forwarded if it is a duplicate of
					/// our own channel announcements.
					case LDKErrorAction_IgnoreDuplicateGossip
			
					/// The peer did something incorrect. Tell them.
					case LDKErrorAction_SendErrorMessage
			
					/// The peer did something incorrect. Tell them without closing any channels.
					case LDKErrorAction_SendWarningMessage
			

					internal init (value: LDKErrorAction_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKErrorAction_SendWarningMessage

						
						if value == LDKErrorAction_DisconnectPeer {
							self = .LDKErrorAction_DisconnectPeer
						}
			
						if value == LDKErrorAction_IgnoreError {
							self = .LDKErrorAction_IgnoreError
						}
			
						if value == LDKErrorAction_IgnoreAndLog {
							self = .LDKErrorAction_IgnoreAndLog
						}
			
						if value == LDKErrorAction_IgnoreDuplicateGossip {
							self = .LDKErrorAction_IgnoreDuplicateGossip
						}
			
						if value == LDKErrorAction_SendErrorMessage {
							self = .LDKErrorAction_SendErrorMessage
						}
			
						if value == LDKErrorAction_SendWarningMessage {
							self = .LDKErrorAction_SendWarningMessage
						}
			
					}

					internal func getCValue() -> LDKErrorAction_Tag {
						switch self {
							
							case .LDKErrorAction_DisconnectPeer:
								return LDKErrorAction_DisconnectPeer
			
							case .LDKErrorAction_IgnoreError:
								return LDKErrorAction_IgnoreError
			
							case .LDKErrorAction_IgnoreAndLog:
								return LDKErrorAction_IgnoreAndLog
			
							case .LDKErrorAction_IgnoreDuplicateGossip:
								return LDKErrorAction_IgnoreDuplicateGossip
			
							case .LDKErrorAction_SendErrorMessage:
								return LDKErrorAction_SendErrorMessage
			
							case .LDKErrorAction_SendWarningMessage:
								return LDKErrorAction_SendWarningMessage
			
						}
					}

				}

			}
		