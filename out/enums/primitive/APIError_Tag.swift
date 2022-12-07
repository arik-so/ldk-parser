
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias APIError_Tag = Bindings.APIError_Tag

			extension Bindings {

				/// Indicates an error on the client's part (usually some variant of attempting to use too-low or
				/// too-high values)
				public enum APIError_Tag {

					
					/// Indicates the API was wholly misused (see err for more). Cases where these can be returned
					/// are documented, but generally indicates some precondition of a function was violated.
					case LDKAPIError_APIMisuseError
			
					/// Due to a high feerate, we were unable to complete the request.
					/// For example, this may be returned if the feerate implies we cannot open a channel at the
					/// requested value, but opening a larger channel would succeed.
					case LDKAPIError_FeeRateTooHigh
			
					/// A malformed Route was provided (eg overflowed value, node id mismatch, overly-looped route,
					/// too-many-hops, etc).
					case LDKAPIError_RouteError
			
					/// We were unable to complete the request as the Channel required to do so is unable to
					/// complete the request (or was not found). This can take many forms, including disconnected
					/// peer, channel at capacity, channel shutting down, etc.
					case LDKAPIError_ChannelUnavailable
			
					/// An attempt to call [`chain::Watch::watch_channel`]/[`chain::Watch::update_channel`]
					/// returned a [`ChannelMonitorUpdateStatus::InProgress`] indicating the persistence of a
					/// monitor update is awaiting async resolution. Once it resolves the attempted action should
					/// complete automatically.
					/// 
					/// [`chain::Watch::watch_channel`]: crate::chain::Watch::watch_channel
					/// [`chain::Watch::update_channel`]: crate::chain::Watch::update_channel
					/// [`ChannelMonitorUpdateStatus::InProgress`]: crate::chain::ChannelMonitorUpdateStatus::InProgress
					case LDKAPIError_MonitorUpdateInProgress
			
					/// [`KeysInterface::get_shutdown_scriptpubkey`] returned a shutdown scriptpubkey incompatible
					/// with the channel counterparty as negotiated in [`InitFeatures`].
					/// 
					/// Using a SegWit v0 script should resolve this issue. If you cannot, you won't be able to open
					/// a channel or cooperatively close one with this peer (and will have to force-close instead).
					/// 
					/// [`KeysInterface::get_shutdown_scriptpubkey`]: crate::chain::keysinterface::KeysInterface::get_shutdown_scriptpubkey
					/// [`InitFeatures`]: crate::ln::features::InitFeatures
					case LDKAPIError_IncompatibleShutdownScript
			

					internal init (value: LDKAPIError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKAPIError_IncompatibleShutdownScript

						
						if value == LDKAPIError_APIMisuseError {
							self = .LDKAPIError_APIMisuseError
						}
			
						if value == LDKAPIError_FeeRateTooHigh {
							self = .LDKAPIError_FeeRateTooHigh
						}
			
						if value == LDKAPIError_RouteError {
							self = .LDKAPIError_RouteError
						}
			
						if value == LDKAPIError_ChannelUnavailable {
							self = .LDKAPIError_ChannelUnavailable
						}
			
						if value == LDKAPIError_MonitorUpdateInProgress {
							self = .LDKAPIError_MonitorUpdateInProgress
						}
			
						if value == LDKAPIError_IncompatibleShutdownScript {
							self = .LDKAPIError_IncompatibleShutdownScript
						}
			
					}

					internal func getCValue() -> LDKAPIError_Tag {
						switch self {
							
							case .LDKAPIError_APIMisuseError:
								return LDKAPIError_APIMisuseError
			
							case .LDKAPIError_FeeRateTooHigh:
								return LDKAPIError_FeeRateTooHigh
			
							case .LDKAPIError_RouteError:
								return LDKAPIError_RouteError
			
							case .LDKAPIError_ChannelUnavailable:
								return LDKAPIError_ChannelUnavailable
			
							case .LDKAPIError_MonitorUpdateInProgress:
								return LDKAPIError_MonitorUpdateInProgress
			
							case .LDKAPIError_IncompatibleShutdownScript:
								return LDKAPIError_IncompatibleShutdownScript
			
						}
					}

				}

			}
		