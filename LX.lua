-- LX Regular edition
--[[

 _    __  __      
| |   \ \/ /    
| |    \  /     
| |___ /  \     
|_____/_/\_\    
                                       

Before you ask, Yes LX is Vibecoded with Claude but some parts are hand written or hand made/edited by me such as themes,Config,Plugins, and other small things. A select few apps were also hand written by me

LX is a debugging suite designed to compete with dex and acheive TRUE freedom across games

LX also features a buncha useful features such as Hook and things that Zinnia was too lazy to add

Terry davis would be proud 
]]


local K = {}
-- Fixed for this distribution; saved settings and plugins cannot change the edition.
local ALL_KNOWING = false
K.Edition = ALL_KNOWING and "All Knowing" or "Regular"
function K.allowProperty(name)
	return ALL_KNOWING or (name ~= "Source" and name ~= "LinkedSource")
end


-- Configs if you really need them but i just made these for myself for easy editing
local Configuration = {
	VANILLA = { AssetId = 114851699900089, IconSize = 32, Columns = 25 },
	-- Optional animated icon on the intro card (sprite sheet / GIF frames). Image can be a url
	-- (downloaded once with writefile, loaded with getcustomasset), a workspace file path, or an asset id.
	-- IntroSprite = { Image = "https://example.com/sheet.png", FrameSize = Vector2.new(64, 64), Columns = 8, Frames = 32, FPS = 24 },
	IntroSprite = nil,
	Theme = {
		Main = Color3.fromRGB(37, 37, 37), Surface = Color3.fromRGB(29, 29, 29),
		Header = Color3.fromRGB(42, 42, 42), Input = Color3.fromRGB(23, 23, 23),
		Panel = Color3.fromRGB(54, 54, 54), Border = Color3.fromRGB(25, 25, 25),
		Text = Color3.fromRGB(222, 222, 222), Dim = Color3.fromRGB(140, 140, 140),
		Hover = Color3.fromRGB(48, 48, 48), Selected = Color3.fromRGB(41, 79, 214),
		Accent = Color3.fromRGB(51, 95, 255), Scrollbar = Color3.fromRGB(92, 92, 92),
		PropName = Color3.fromRGB(222, 222, 223), PropValue = Color3.fromRGB(222, 222, 224),
		PropBool = Color3.fromRGB(222, 222, 225), PropNumber = Color3.fromRGB(222, 222, 226),
		PropString = Color3.fromRGB(222, 222, 227), TabActive = Color3.fromRGB(49, 49, 49),
		TabText = Color3.fromRGB(240, 240, 240), MenuHover = Color3.fromRGB(58, 58, 58),
		CodeBackground = Color3.fromRGB(30, 30, 30), CodeGutter = Color3.fromRGB(34, 34, 34),
		CodeText = Color3.fromRGB(212, 212, 212), CodeLineNumber = Color3.fromRGB(115, 115, 115),
		CodeOp = Color3.fromRGB(212, 212, 213), CloseHover = Color3.fromRGB(55, 55, 55),
		AccentText = Color3.fromRGB(255, 255, 255),
		SelectionBox = Color3.fromRGB(51, 95, 254),
		CodeKeyword = Color3.fromRGB(248, 109, 124), CodeString = Color3.fromRGB(173, 241, 149),
		CodeComment = Color3.fromRGB(110, 116, 130), CodeNumber = Color3.fromRGB(255, 198, 0),
		CodeBool = Color3.fromRGB(255, 198, 1), CodeNil = Color3.fromRGB(255, 198, 2),
		CodeSelf = Color3.fromRGB(248, 109, 125), CodeBuiltin = Color3.fromRGB(132, 214, 247),
		CodeFn = Color3.fromRGB(253, 251, 172), CodeMethod = Color3.fromRGB(253, 251, 173),
		CodeProperty = Color3.fromRGB(97, 161, 241),
	},
}

local Options = {
	ShowHiddenServices = false,
	IncrementNames = false,
	ExpandOnSelect = true,
	LowEnd = false,
}

K.V = {
		Actor = 3, Attachment = 36, BasePart = 43, Beam = 47, BindableEvent = 51,
		BindableFunction = 52, BoolValue = 65, Camera = 75, Configuration = 100,
		CoreGui = 110, DataModel = 124, Debris = 141, Folder = 186, GlobalSettings = 200,
		Highlight = 221, Humanoid = 231, Instance = 250, IntValue = 253, Keyframe = 259,
		Lighting = 267, LocalScript = 274, Model = 306, ModuleScript = 307, Motor6D = 309,
		NumberValue = 325, ObjectValue = 326, Part = 335, Players = 359, RemoteEvent = 405,
		ReplicatedStorage = 410, RunService = 426, Script = 430, Selection = 442,
		ServerStorage = 450, Sound = 465, StarterGui = 482, StringValue = 490, Studio = 491,
		Terrain = 516, TextService = 531, Tool = 538, Trail = 547, TweenService = 554,
		UserInputService = 577, Weld = 602, Workspace = 605,
	}
K.CLASS_ALIAS = {
		Player = 359, Teams = 359, Team = 359,
		ReplicatedFirst = 410, ServerScriptService = 430,
		StarterPack = 538, StarterPlayer = 359,
		StarterPlayerScripts = 274, StarterCharacterScripts = 274,
		PlayerScripts = 274, Backpack = 538, PlayerGui = 482,
		SoundService = 465, SoundGroup = 465, MaterialService = 516,
		Chat = 405, TextChatService = 531,
		LocalizationService = 531, TestService = 491,
		MeshPart = 335, UnionOperation = 335, WedgePart = 335, TrussPart = 335,
		SpawnLocation = 335, Seat = 335, VehicleSeat = 335, CornerWedgePart = 335,
		RemoteFunction = 52, UnreliableRemoteEvent = 405,
		Animator = 231, HumanoidDescription = 231,
		Weld = 602, WeldConstraint = 602, ManualWeld = 602, Motor6D = 309,
		Animation = 259, KeyframeSequence = 259,
		ScreenGui = 482, SurfaceGui = 482, BillboardGui = 482,
		Sky = 267, Atmosphere = 267, PointLight = 267,
		SpotLight = 267, SurfaceLight = 267,
	}
K.ISA_FALLBACK = {
		{ "BasePart", 335 }, { "Model", 306 }, { "LocalScript", 274 },
		{ "ModuleScript", 307 }, { "LuaSourceContainer", 430 },
		{ "ValueBase", 490 }, { "GuiBase", 482 },
		{ "Light", 267 }, { "PostEffect", 267 }, { "JointInstance", 602 },
		{ "Constraint", 602 }, { "Sound", 465 }, { "Tool", 538 }, { "Folder", 186 },
	}
K.SERVICE_ORDER = {
		"Workspace", "Players", "Lighting", "MaterialService", "ReplicatedFirst",
		"ReplicatedStorage", "ServerScriptService", "ServerStorage", "StarterGui",
		"StarterPack", "StarterPlayer", "Teams", "SoundService", "Chat",
		"TextChatService", "LocalizationService", "TestService",
	}
K.INSERT_CATALOG = {
		{ "Frequently Used", { "Part", "Script", "LocalScript", "ModuleScript", "Folder", "Tool", "SpawnLocation", "MeshPart", "Model" } },
		{ "3D Interfaces", { "ClickDetector", "Decal", "Dialog", "DialogChoice", "MaterialVariant", "ProximityPrompt", "Texture", "SurfaceGui", "BillboardGui", "SurfaceAppearance" } },
		{ "Parts", { "Part", "WedgePart", "CornerWedgePart", "TrussPart", "Seat", "VehicleSeat", "SpawnLocation", "MeshPart" } },
		{ "Scripting", { "Script", "LocalScript", "ModuleScript", "RemoteEvent", "RemoteFunction", "UnreliableRemoteEvent", "BindableEvent", "BindableFunction", "Actor" } },
		{ "Values", { "BoolValue", "IntValue", "NumberValue", "StringValue", "ObjectValue", "Color3Value", "Vector3Value", "CFrameValue", "BrickColorValue", "RayValue" } },
		{ "Lights & Effects", { "PointLight", "SpotLight", "SurfaceLight", "Fire", "Smoke", "Sparkles", "ParticleEmitter", "Beam", "Trail", "Highlight", "Explosion" } },
		{ "Lighting", { "Atmosphere", "Sky", "Clouds", "BloomEffect", "BlurEffect", "ColorCorrectionEffect", "DepthOfFieldEffect", "SunRaysEffect" } },
		{ "Constraints & Joints", { "Attachment", "Weld", "WeldConstraint", "Motor6D", "HingeConstraint", "RopeConstraint", "SpringConstraint", "AlignPosition", "AlignOrientation", "LinearVelocity", "AngularVelocity", "VectorForce" } },
		{ "Meshes", { "SpecialMesh", "BlockMesh", "CylinderMesh" } },
		{ "GUI", { "ScreenGui", "Frame", "ScrollingFrame", "TextLabel", "TextButton", "TextBox", "ImageLabel", "ImageButton", "ViewportFrame", "CanvasGroup", "UICorner", "UIStroke", "UIGradient", "UIListLayout", "UIGridLayout", "UIPadding", "UIScale", "UIAspectRatioConstraint" } },
		{ "Sound", { "Sound", "SoundGroup", "ReverbSoundEffect", "EchoSoundEffect", "EqualizerSoundEffect" } },
		{ "Characters", { "Humanoid", "HumanoidDescription", "Animation", "Animator", "Shirt", "Pants", "Accessory", "BodyColors" } },
		{ "Organization", { "Folder", "Model", "Configuration", "Tool", "Camera" } },
	}
K.SERVICE_CATALOG = {
		"Teams", "Chat", "TextChatService", "SoundService", "LocalizationService", "TestService",
		"MaterialService", "Debris", "TweenService", "RunService", "UserInputService", "HttpService",
		"CollectionService", "PhysicsService", "PathfindingService", "MarketplaceService",
		"ContentProvider", "GuiService", "InsertService", "ProximityPromptService", "StarterGui",
		"StarterPack", "StarterPlayer", "ServerStorage", "ServerScriptService", "ReplicatedFirst",
	}
K.PROPERTY_LIST = {
		{ "Data", {
			"Name", "ClassName", "Parent", "Archivable", "Value", "Source",
			"LinkedSource", "RunContext", "Disabled", "Enabled", "Adornee", "Part0",
			"Part1", "Attachment0", "Attachment1", "Target", "PrimaryPart", "WorldPivot",
			"CurrentCamera", "CameraSubject", "CameraType", "Team", "TeamColor", "UserId",
			"DisplayName", "AccountAge", "Character", "Tool", "ToolTip", "RequiresHandle",
			"CanBeDropped", "ManualActivationOnly", "AutoAssignable", "LocalizationTable", "RootLocalizationTable",
		} },
		{ "Appearance", {
			"BrickColor", "Color", "Color3", "Material", "MaterialVariant", "Reflectance",
			"Transparency", "LocalTransparencyModifier", "CastShadow", "Shape", "FormFactor", "BackgroundColor3",
			"BackgroundTransparency", "BorderColor3", "BorderMode", "BorderSizePixel", "Style", "FillColor",
			"FillTransparency", "OutlineColor", "OutlineTransparency", "DepthMode", "Face", "Texture",
			"TextureID", "TextureId", "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap",
			"StudsPerTileU", "StudsPerTileV", "OffsetStudsU", "OffsetStudsV", "LightEmission", "LightInfluence",
			"Brightness", "Range", "Angle", "Shadows", "ZOffset", "Sky",
			"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp",
			"SunTextureId", "MoonTextureId", "SunAngularSize", "MoonAngularSize", "StarCount", "CelestialBodiesShown",
		} },
		{ "Text", {
			"Text", "ContentText", "RichText", "Font", "FontFace", "LineHeight",
			"MaxVisibleGraphemes", "TextColor3", "TextTransparency", "TextStrokeColor3", "TextStrokeTransparency", "TextSize",
			"TextScaled", "TextWrapped", "TextWrap", "TextTruncate", "TextXAlignment", "TextYAlignment",
			"TextDirection", "TextFits", "TextBounds", "PlaceholderText", "PlaceholderColor3", "ClearTextOnFocus",
			"MultiLine", "TextEditable", "ShowNativeInput", "CursorPosition", "SelectionStart", "OpenTypeFeatures",
			"LocalizationMatchIdentifier", "AutoLocalize",
		} },
		{ "Image", {
			"Image", "ImageColor3", "ImageTransparency", "ImageRectOffset", "ImageRectSize", "ImageContent",
			"ResampleMode", "ScaleType", "SliceCenter", "SliceScale", "TileSize", "HoverImage",
			"PressedImage", "IsLoaded", "ImageColor", "Ambient", "LightColor", "LightDirection",
		} },
		{ "Transform", {
			"Position", "Orientation", "Rotation", "Size", "CFrame", "PivotOffset",
			"Origin", "AnchorPoint", "AbsolutePosition", "AbsoluteSize", "AbsoluteRotation", "SizeConstraint",
			"AutomaticSize", "WorldPosition", "WorldOrientation", "WorldCFrame", "WorldAxis", "WorldSecondaryAxis",
			"Axis", "SecondaryAxis", "C0", "C1", "Offset", "Scale",
			"VertexColor", "MeshId", "MeshType", "MeshSize", "RenderFidelity", "CollisionFidelity",
			"DoubleSided", "UsePartColor",
		} },
		{ "GUI", {
			"Visible", "Active", "Selectable", "SelectionOrder", "LayoutOrder", "ZIndex",
			"ZIndexBehavior", "ClipsDescendants", "Interactable", "AutoButtonColor", "Modal", "Selected",
			"SelectionImageObject", "SelectionGroup", "SelectionBehaviorUp", "SelectionBehaviorDown", "SelectionBehaviorLeft", "SelectionBehaviorRight",
			"NextSelectionUp", "NextSelectionDown", "NextSelectionLeft", "NextSelectionRight", "GroupColor3", "GroupTransparency",
			"GuiState", "DisplayOrder", "IgnoreGuiInset", "ScreenInsets", "SafeAreaCompatibility", "ClipToDeviceSafeArea",
			"ResetOnSpawn", "OnTopOfCoreBlur", "AlwaysOnTop", "MaxDistance", "DistanceLowerLimit", "DistanceUpperLimit",
			"DistanceStep", "ExtentsOffset", "ExtentsOffsetWorldSpace", "StudsOffset", "StudsOffsetWorldSpace", "SizeOffset",
			"PlayerToHideFrom", "CanvasSize", "PixelsPerStud", "SizingMode", "ToolPunchThroughDistance",
		} },
		{ "Scrolling", {
			"CanvasPosition", "AbsoluteCanvasSize", "AbsoluteWindowSize", "AutomaticCanvasSize", "ScrollingEnabled", "ScrollingDirection",
			"ScrollBarThickness", "ScrollBarImageColor3", "ScrollBarImageTransparency", "TopImage", "MidImage", "BottomImage",
			"VerticalScrollBarInset", "HorizontalScrollBarInset", "VerticalScrollBarPosition", "ElasticBehavior", "ScrollVelocity",
		} },
		{ "UI Modifiers", {
			"CornerRadius", "Thickness", "ApplyStrokeMode", "LineJoinMode", "StrokeSizingMode", "PaddingTop",
			"PaddingBottom", "PaddingLeft", "PaddingRight", "Padding", "FillDirection", "HorizontalAlignment",
			"VerticalAlignment", "SortOrder", "Wraps", "HorizontalFlex", "VerticalFlex", "ItemLineAlignment",
			"CellSize", "CellPadding", "FillDirectionMaxCells", "StartCorner", "AbsoluteContentSize", "AspectRatio",
			"AspectType", "DominantAxis", "MinSize", "MaxSize", "MinTextSize", "MaxTextSize",
			"FlexMode", "GrowRatio", "ShrinkRatio", "Animated", "Circular", "EasingDirection",
			"EasingStyle", "TweenTime", "GamepadInputEnabled", "ScrollWheelInputEnabled", "TouchInputEnabled", "FillEmptySpaceColumns",
			"FillEmptySpaceRows", "MajorAxis",
		} },
		{ "Behavior", {
			"Anchored", "CanCollide", "CanTouch", "CanQuery", "Locked", "Massless",
			"RootPriority", "CollisionGroup", "CollisionGroupId", "CustomPhysicalProperties", "AssemblyMass", "AssemblyLinearVelocity",
			"AssemblyAngularVelocity", "AssemblyCenterOfMass", "Mass", "ResizeIncrement", "ResizeableFaces", "EnableFluidForces",
			"Velocity", "RotVelocity", "ModelStreamingMode", "LevelOfDetail", "Sandboxed", "MaxActivationDistance",
			"CursorIcon", "HoldDuration", "ActionText", "ObjectText", "KeyboardKeyCode", "GamepadKeyCode",
			"RequiresLineOfSight", "Exclusivity", "ClickablePrompt", "UIOffset",
		} },
		{ "Surface", {
			"TopSurface", "BottomSurface", "FrontSurface", "BackSurface", "LeftSurface", "RightSurface",
		} },
		{ "Constraint", {
			"Length", "CurrentLength", "Restitution", "Stiffness", "Damping", "FreeLength",
			"MaxForce", "MaxTorque", "MaxVelocity", "Responsiveness", "RigidityEnabled", "ReactionForceEnabled",
			"ReactionTorqueEnabled", "Mode", "ApplyAtCenterOfMass", "RelativeTo", "Force", "Torque",
			"VectorVelocity", "AngularVelocity", "LinearVelocity", "ActuatorType", "AngularSpeed", "ServoMaxTorque",
			"TargetAngle", "MotorMaxTorque", "LimitsEnabled", "UpperAngle", "LowerAngle", "Coils",
			"Radius", "WinchEnabled", "WinchForce", "WinchSpeed", "WinchTarget", "DesiredAngle",
			"CurrentAngle", "Transform",
		} },
		{ "Character", {
			"Health", "MaxHealth", "WalkSpeed", "JumpPower", "JumpHeight", "UseJumpPower",
			"HipHeight", "AutoRotate", "AutoJumpEnabled", "RigType", "RequiresNeck", "BreakJointsOnDeath",
			"EvaluateStateMachine", "DisplayDistanceType", "HealthDisplayType", "HealthDisplayDistance", "NameDisplayDistance", "NameOcclusion",
			"MoveDirection", "FloorMaterial", "Sit", "PlatformStand", "SeatPart", "WalkToPoint",
			"WalkToPart", "MaxSlopeAngle", "CameraOffset", "HeadColor3", "TorsoColor3", "LeftArmColor3",
			"RightArmColor3", "LeftLegColor3", "RightLegColor3", "ShirtTemplate", "PantsTemplate", "Graphic",
			"AccessoryType", "AttachmentPoint",
		} },
		{ "Sound", {
			"SoundId", "Volume", "Playing", "Looped", "PlaybackSpeed", "TimePosition",
			"TimeLength", "PlayOnRemove", "RollOffMode", "RollOffMinDistance", "RollOffMaxDistance", "EmitterSize",
			"SoundGroup", "IsPlaying", "IsPaused", "PlaybackLoudness", "PlaybackRegionsEnabled", "PlaybackRegion",
			"LoopRegion", "Priority", "DecayTime", "Density", "Diffusion", "DryLevel",
			"WetLevel", "Delay", "Feedback", "HighGain", "MidGain", "LowGain",
			"Octave", "Level", "Attack", "Release", "Ratio", "Threshold",
			"MakeupGain", "Depth", "Frequency", "Mix",
		} },
		{ "Animation", {
			"AnimationId", "Weight", "Speed", "Time", "WeightCurrent", "WeightTarget",
			"EvaluationThrottled",
		} },
		{ "Emission", {
			"Rate", "Lifetime", "SpreadAngle", "RotSpeed", "Acceleration", "Drag",
			"EmissionDirection", "LockedToPart", "VelocityInheritance", "TimeScale", "Squash", "FlipbookLayout",
			"FlipbookMode", "FlipbookFramerate", "FlipbookStartRandom", "ShapeInOut", "ShapeStyle", "ShapePartial",
			"WindAffectsDrag", "Heat", "SecondaryColor", "Opacity", "RiseVelocity", "SparkleColor",
			"Segments", "Width0", "Width1", "CurveSize0", "CurveSize1", "FaceCamera",
			"TextureLength", "TextureMode", "TextureSpeed", "MinLength", "MaxLength", "WidthScale",
			"BlastPressure", "BlastRadius", "DestroyJointRadiusPercent", "ExplosionType",
		} },
		{ "Lighting", {
			"ClockTime", "TimeOfDay", "GeographicLatitude", "OutdoorAmbient", "ColorShift_Top", "ColorShift_Bottom",
			"EnvironmentDiffuseScale", "EnvironmentSpecularScale", "GlobalShadows", "ShadowSoftness", "ShadowColor", "Technology",
			"ExposureCompensation", "FogColor", "FogStart", "FogEnd", "Contrast", "Saturation",
			"TintColor", "Intensity", "Spread", "FarIntensity", "FocusDistance", "InFocusRadius",
			"NearIntensity", "Glare", "Haze", "Decay", "Cover",
		} },
		{ "Camera", {
			"FieldOfView", "FieldOfViewMode", "DiagonalFieldOfView", "MaxAxisFieldOfView", "Focus", "HeadLocked",
			"HeadScale", "NearPlaneZ", "ViewportSize", "VRTiltAndRollEnabled",
		} },
		{ "World", {
			"Gravity", "FallenPartsDestroyHeight", "FallHeightEnabled", "AirDensity", "GlobalWind", "StreamingEnabled",
			"StreamingMinRadius", "StreamingTargetRadius", "StreamingIntegrityMode", "SignalBehavior", "TouchesUseCollisionGroups", "AllowThirdPartySales",
			"DistributedGameTime", "WaterColor", "WaterReflectance", "WaterTransparency", "WaterWaveSize", "WaterWaveSpeed",
			"Decoration", "GrassLength", "MaxPlayers", "PreferredPlayers", "RespawnTime", "CharacterAutoLoads",
			"BubbleChat", "ClassicChat",
		} },
	}
K.STUDIO_ICON_NAMES = "Accessory Actor AdGui AdPortal AirController AlignOrientation AlignPosition AngularVelocity Animation AnimationConstraint AnimationController AnimationFromVideoCreatorService Animator ArcHandles Atmosphere Attachment AudioAnalyzer AudioChannelMixer AudioChannelSplitter AudioChorus AudioCompressor AudioDeviceInput AudioDeviceOutput AudioDistortion AudioEcho AudioEmitter AudioEqualizer AudioFader AudioFilter AudioFlanger AudioGate AudioLimiter AudioListener AudioPitchShifter AudioPlayer AudioRecorder AudioReverb AudioSpeechToText AudioStreamReader AudioStreamWriter AudioTextToSpeech AudioTremolo AudioWindSynthesizer AuroraScript AvatarAccessoryRules AvatarAnimationRules AvatarBodyRules AvatarClothingRules AvatarCollisionRules AvatarEditorService AvatarRules AvatarSettings Backpack BallSocketConstraint BasePlate Beam BillboardGui BindableEvent BindableFunction BlockMesh BloomEffect BlurEffect BodyAngularVelocity BodyColors BodyForce BodyGyro BodyPosition BodyThrust BodyVelocity Bone BoolValue BoxHandleAdornment Breakpoint BrickColorValue BubbleChatConfiguration Buggaroo CFrameValue Camera CanvasGroup ChannelTabsConfiguration CharacterControllerManager CharacterMesh Chat ChatInputBarConfiguration ChatWindowConfiguration ChorusSoundEffect Class Cleanup ClickDetector ClientReplicator ClimbController Clouds Color ColorCorrectionEffect CompressorSoundEffect ConeHandleAdornment Configuration Constant Constructor ControlState Controller CoreGui CornerWedgePart CustomFolder CylinderHandleAdornment CylindricalConstraint Decal DepthOfFieldEffect Dialog DialogChoice DistortionSoundEffect DragDetector EchoSoundEffect EditableImage EditableMesh Enum EnumMember EqualizerSoundEffect Event Explosion FaceControls Field File Fire FlangeSoundEffect Folder ForceField Frame Function GameSettings GeneratedFolder GroundController Handles HapticEffect HapticService HeightmapImporterService Highlight HingeConstraint Humanoid HumanoidDescription IKControl ImageButton ImageHandleAdornment ImageLabel InputAction InputActionLabel InputBinding InputContext Interface IntersectOperation Keyword Lighting LineForce LineHandleAdornment LinearVelocity LocalFile LocalScript LocalizationService LocalizationTable MaterialService MaterialVariant MemoryStoreService MeshPart Meshparts MessagingService Method Model Modelgroups Module ModuleScript Motor6D NegateOperation NetworkClient NoCollisionConstraint Operator PackageLink Pants Part ParticleEmitter Path2D PathfindingLink PathfindingModifier PathfindingService PitchShiftSoundEffect Place Plane PlaneConstraint Player PlayerControlState Players PluginGuiService PointLight PrismaticConstraint ProceduralModel Property ProximityPrompt PublishService Reference RemoteEvent RemoteFunction RenderingTest ReplicatedFirst ReplicatedScriptService ReplicatedStorage ReverbSoundEffect RigidConstraint RobloxPluginGuiService RocketPropulsion RodConstraint RopeConstraint Rotate ScreenGui Script ScrollingFrame Seat Selected_Workspace SelectionBox SelectionSphere ServerScriptService ServerStorage Service Shirt ShirtGraphic SkinnedMeshPart Sky Smoke Snap Snippet SocialService Sound SoundEffect SoundGroup SoundService Sparkles SpawnLocation SpecialMesh SphereHandleAdornment SpotLight SpringConstraint StandalonePluginScripts StarterCharacterScripts StarterGui StarterPack StarterPlayer StarterPlayerScripts Struct StyleDerive StyleLink StyleQuery StyleRule StyleSheet SunRaysEffect SurfaceAppearance SurfaceGui SurfaceLight SurfaceSelection SwimController TaskScheduler Team Teams Terrain TerrainDetail TestService TextBox TextBoxService TextButton TextChannel TextChannelWindow TextChatCommand TextChatService TextLabel TextString Texture Tool Torque TorsionSpringConstraint Trail TremoloSoundEffect TrussPart TypeParameter UGCValidationService UIAspectRatioConstraint UICorner UIDragDetector UIFlexItem UIGradient UIGridLayout UIListLayout UIPadding UIPageLayout UIScale UIShadow UISizeConstraint UIStroke UITableLayout UITextSizeConstraint UnionOperation Unit UniversalConstraint UnreliableRemoteEvent UpdateAvailable UserService VRService Value Variable VectorForce VehicleSeat VideoDisplay VideoFrame VideoPlayer ViewportCamera ViewportFrame VirtualUser VoiceChannel VoiceChatService Voicechat WedgePart Weld WeldConstraint Wire WireframeHandleAdornment Workspace WorldModel WrapDeformer WrapLayer WrapTarget WrapTextureTransfer"
K.STUDIO_ALIAS = {
		PlayerGui = "StarterGui", PlayerScripts = "StarterPlayerScripts", StarterGear = "Backpack",
		Hat = "Accessory", Keyframe = "Animation", KeyframeSequence = "Animation", KeyframeMarker = "Animation",
		Pose = "Bone", NumberPose = "Bone", CoreScript = "Script", ManualWeld = "Weld", ManualGlue = "Weld",
		Glue = "Weld", Motor = "Motor6D", FileMesh = "SpecialMesh", CylinderMesh = "BlockMesh",
		Message = "TextLabel", Hint = "TextLabel", GuiMain = "ScreenGui", TextSource = "TextChannel",
	}
K.STUDIO_ISA = {
		{ "LocalScript", "LocalScript" }, { "ModuleScript", "ModuleScript" }, { "LuaSourceContainer", "Script" },
		{ "MeshPart", "MeshPart" }, { "PartOperation", "UnionOperation" }, { "BasePart", "Part" },
		{ "Model", "Model" }, { "ValueBase", "Value" }, { "LayerCollector", "ScreenGui" },
		{ "GuiButton", "TextButton" }, { "GuiObject", "Frame" }, { "Light", "PointLight" },
		{ "PostEffect", "ColorCorrectionEffect" }, { "JointInstance", "Weld" }, { "Constraint", "RopeConstraint" },
		{ "SoundEffect", "SoundEffect" }, { "Sound", "Sound" }, { "Clothing", "Shirt" },
		{ "DataModelMesh", "SpecialMesh" }, { "Accoutrement", "Accessory" }, { "BodyMover", "BodyPosition" },
		{ "HandleAdornment", "BoxHandleAdornment" }, { "FaceInstance", "Decal" }, { "Folder", "Folder" },
		{ "BackpackItem", "Tool" }, { "Humanoid", "Humanoid" }, { "Controller", "Controller" },
	}
K.PREVIEW_TEXT = {
		max = "Maximize", left = "Dock left", right = "Dock right", bottom = "Dock bottom",
		["dock:top"] = "Dock above", ["dock:bottom"] = "Dock below", ["dock:tabs"] = "Add as tab",
	}
K.ROW_HEIGHT = 20
K.TITLE_H = 26
K.FILTER_H = 30

local Services = {
	Players = game:GetService("Players"),
	GuiService = game:GetService("GuiService"),
	UserInputService = game:GetService("UserInputService"),
	TweenService = game:GetService("TweenService"),
	RunService = game:GetService("RunService"),
	ContextActionService = game:GetService("ContextActionService"),
	ContentProvider = game:GetService("ContentProvider"),
	TextService = game:GetService("TextService"),
}


-- Can't leave the IOS peoples out
Delve_IsMobile = false
pcall(function()
	local uis = game:GetService("UserInputService")
	Delve_IsMobile = uis.TouchEnabled and not uis.KeyboardEnabled
end)
if Delve_IsMobile then
	K.ROW_HEIGHT = math.max(K.ROW_HEIGHT, 32)
	K.TITLE_H = math.max(K.TITLE_H, 32 + 4)
	K.FILTER_H = math.max(K.FILTER_H, 32 + 6)
end
local function touchH(h)
	if Delve_IsMobile then return math.max(h, 32) end
	return h
end

local env = getfenv()
local function envFn(...)
	for _, n in ipairs({ ... }) do
		local ok, f = pcall(function() return env[n] end)
		if ok and typeof(f) == "function" then return f end
	end
	return nil
end
for _, n in ipairs({ "getcustomasset", "writefile", "readfile", "isfile", "isfolder", "makefolder", "listfiles", "delfile" }) do
	if not envFn(n) then return end
end
Services.setClipboard = envFn("setclipboard")
Services.saveInstanceFn = envFn("saveinstance")
Services.writeFile = envFn("writefile")
Services.isFolder = envFn("isfolder")
Services.makeFolder = envFn("makefolder")
Services.httpRequest = envFn("request")

local State = {
	selected = nil, dirty = true, filterText = "", pending = false,
	selection = {}, selSet = setmetatable({}, { __mode = "k" }), anchorInst = nil,
	expanded = setmetatable({}, { __mode = "k" }), clipboard = {}, renaming = nil,
	collapsedCats = {}, propConns = {}, propRows = {},
	pickerMode = "object", pickerTargets = {}, pickerFirst = nil,
	menuH = 8, menuOrder = 0, searchToken = 0, acc = 0,
	touchPoint = nil, touchActive = false, lastRightClick = 0,
	camSavedType = nil, camToken = 0, viewing = nil,
	threeDeeActive = false,
	viewKeys = { W = false, A = false, S = false, D = false, Q = false, E = false, Shift = false },
	viewCam = nil, viewYaw = 0, viewPitch = 0, viewCamPos = Vector3.new(0, 0, 0), viewModelClone = nil,
	drag = nil, dragConn = nil, currentPreview = nil,
	flat = {}, searchHistory = {},
	editingInst = nil, editingProp = nil, editingKind = nil,
}

local UI = {
	guiParent = game:GetService("CoreGui"),
	menuW = 240, pickW = 250, pickH = 380, itemH = 0,
}
local previous = UI.guiParent:FindFirstChild("delve")
if previous then previous:Destroy() end

local function new(class, props, parent)
	local o = Instance.new(class)
	for k, v in pairs(props) do o[k] = v end
	o.Parent = parent
	return o
end

local function stroke(parent, color, thickness)
	return new("UIStroke", {
		Color = color or Configuration.Theme.Border, Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, parent)
end

Options.LowEnd = Options.LowEnd == true
K.fastTween = TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
K.popTweens = setmetatable({}, { __mode = "k" })
function K.popIn(frame, dy)
	if Options.LowEnd or not frame then return end
	local goal = frame.Position
	local prev = K.popTweens[frame]
	if prev then prev:Cancel() end
	frame.Position = goal + UDim2.fromOffset(0, dy or -6)
	local t = Services.TweenService:Create(frame, K.fastTween, { Position = goal })
	K.popTweens[frame] = t
	t:Play()
end
function K.accentShade(kind)
	local a = Configuration.Theme.Accent
	if kind == "hover" then return a:Lerp(Color3.new(1, 1, 1), 0.15) end
	if kind == "down" then return a:Lerp(Color3.new(0, 0, 0), 0.2) end
	if kind == "on" then return a:Lerp(Color3.new(0, 0, 0), 0.12) end
	return a
end
do
	local samples, total = 0, 0
	local conn
	conn = Services.RunService.Heartbeat:Connect(function(dt)
		samples += 1
		total += dt
		if samples >= 90 then
			conn:Disconnect()
			if total / samples > 1 / 40 then K.lowFpsDetected = true end
			if Options.LowEnd and K.applyLowEnd then K.applyLowEnd() end
		end
	end)
end

UI.gui = new("ScreenGui", {
	Name = "delve", ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset = true, DisplayOrder = 999,
}, UI.guiParent)

UI.snapPreview = new("Frame", {
	Name = "snap", BackgroundColor3 = Color3.new(0, 0, 0), Active = false,
	BackgroundTransparency = 0.8, BorderSizePixel = 0, Visible = false, ZIndex = 30,
}, UI.gui)
stroke(UI.snapPreview, Configuration.Theme.Accent, 2)

local iconCache = {}
local function iconIndexFor(inst)
	if inst:IsA("Model") then return K.V.Model end
	local cn = inst.ClassName
	local cached = iconCache[cn]
	if cached then return cached end
	local idx = K.V[cn] or K.CLASS_ALIAS[cn]
	if not idx then
		for _, pair in ipairs(K.ISA_FALLBACK) do
			local ok, r = pcall(inst.IsA, inst, pair[1])
			if ok and r then idx = pair[2] break end
		end
	end
	idx = idx or K.V.Instance
	iconCache[cn] = idx
	return idx
end

local IconSheet = { image = "rbxassetid://" .. tostring(Configuration.VANILLA.AssetId), source = "rbxassetid" }
do
	local folder = "vanilla3_icons"
	local path = folder .. "/vanilla3.png"
	if not isfolder(folder) then makefolder(folder) end
	if not isfile(path) then
		pcall(function()
			local data = game:HttpGet("https://assetdelivery.roblox.com/v1/asset/?id=" .. tostring(Configuration.VANILLA.AssetId))
			if data and #data > 256 then writefile(path, data) end
		end)
	end
	if isfile(path) then IconSheet.image = getcustomasset(path) end
end

local function setIcon(img, index)
	local cell = math.max(0, index - 1)
	img.Image = IconSheet.image
	img.ImageRectSize = Vector2.new(Configuration.VANILLA.IconSize, Configuration.VANILLA.IconSize)
	img.ImageRectOffset = Vector2.new(
		Configuration.VANILLA.IconSize * (cell % Configuration.VANILLA.Columns),
		Configuration.VANILLA.IconSize * math.floor(cell / Configuration.VANILLA.Columns))
end
local function iconForClass(cls) return iconCache[cls] or K.V[cls] or K.CLASS_ALIAS[cls] or K.V.Instance end

local StudioIcons = {
	enabled = true, folder = "LX/icons/studio",
	available = {}, assets = {}, state = {}, queue = {}, active = 0, changed = false, byClass = {}, fs = {},
}
for name in string.gmatch(K.STUDIO_ICON_NAMES, "%S+") do StudioIcons.available[name] = true end
do
	local fs = StudioIcons.fs
	fs.writefile, fs.isfile, fs.isfolder, fs.makefolder, fs.customAsset = writefile, isfile, isfolder, makefolder, getcustomasset
	local acc = ""
	for part in StudioIcons.folder:gmatch("[^/]+") do
		acc = (acc == "" and part) or (acc .. "/" .. part)
		if not isfolder(acc) then makefolder(acc) end
	end
end
function K.isPng(data) return type(data) == "string" and #data > 64 and data:sub(1, 4) == "\137PNG" end
function K.studioDownload(name)
	local url = name:find("/", 1, true)
		and ("https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/studio-svg-textures/Shared/" .. name .. "@2x.png")
		or ("https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/studio-svg-textures/Shared/InsertableObjects/Dark/Standard/" .. name .. "@2x.png")
	local ok, res = pcall(function() return game:HttpGet(url) end)
	if ok and K.isPng(res) then return res end
	return nil
end
function K.studioLoad(name)
	local fs = StudioIcons.fs
	local path = StudioIcons.folder .. "/" .. name:gsub("/", "_") .. ".png"
	if not fs.isfile(path) then
		local data = K.studioDownload(name)
		if not data then return false end
		if not pcall(fs.writefile, path, data) then return false end
	end
	local ok, asset = pcall(fs.customAsset, path)
	if ok and type(asset) == "string" and #asset > 0 then StudioIcons.assets[name] = asset return true end
	return false
end
local function pumpStudioIcons()
	while StudioIcons.active < 8 and #StudioIcons.queue > 0 do
		local name = table.remove(StudioIcons.queue, 1)
		StudioIcons.active += 1
		task.spawn(function()
			local ok, loaded = pcall(K.studioLoad, name)
			StudioIcons.state[name] = (ok and loaded) and "ready" or "failed"
			StudioIcons.active -= 1
			if ok and loaded then StudioIcons.changed = true end
			pumpStudioIcons()
		end)
	end
end
function StudioIcons.request(name)
	if not (StudioIcons.enabled and name and StudioIcons.available[name]) or StudioIcons.state[name] then return end
	StudioIcons.state[name] = "pending"
	StudioIcons.queue[#StudioIcons.queue + 1] = name
	pumpStudioIcons()
end
function StudioIcons.busy() return StudioIcons.active + #StudioIcons.queue end

local function studioNameFor(inst)
	local cn = inst.ClassName
	local cached = StudioIcons.byClass[cn]
	if cached then return cached end
	local name
	if StudioIcons.available[cn] then
		name = cn
	elseif K.STUDIO_ALIAS[cn] then
		name = K.STUDIO_ALIAS[cn]
	else
		for _, pair in ipairs(K.STUDIO_ISA) do
			local ok, r = pcall(inst.IsA, inst, pair[1])
			if ok and r then name = pair[2] break end
		end
		if not name then
			local ok, isSvc = pcall(function() return inst.Parent == game end)
			name = (ok and isSvc) and "Service" or "Class"
		end
	end
	StudioIcons.byClass[cn] = name
	return name
end
local function studioNameForClass(cls)
	return StudioIcons.byClass[cls] or (StudioIcons.available[cls] and cls) or K.STUDIO_ALIAS[cls] or "Class"
end
local function applyStudio(img, name)
	local asset = StudioIcons.assets[name]
	if asset then
		img.Image = asset
		img.ImageRectSize = Vector2.zero
		img.ImageRectOffset = Vector2.zero
		return true
	end
	StudioIcons.request(name)
	return false
end
local function applyIcon(img, inst)
	if StudioIcons.enabled then
		local ok, name = pcall(studioNameFor, inst)
		if ok and name and applyStudio(img, name) then return end
	end
	setIcon(img, iconIndexFor(inst))
end
local function applyClassIcon(img, cls)
	if StudioIcons.enabled and applyStudio(img, studioNameForClass(cls)) then return end
	setIcon(img, iconForClass(cls))
end

local UI_PNG = {
	winclose = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\60\73\68\65\84\120\218\237\151\77\78\195\48\16\70\103\146\84\237\134\13\247\161\7\41\28\128\85\207\208\5\139\22\110\0\75\224\110\136\59\148\199\130\137\176\76\98\123\18\75\93\16\75\86\126\28\127\223\115\236\153\196\10\200\37\75\35\23\46\11\192\2\80\10\208\78\208\110\107\2\156\69\68\157\3\59\215\2\80\17\217\138\8\118\174\5\154\95\34\114\35\34\235\172\58\48\86\91\59\110\249\41\79\118\221\1\58\210\167\179\227\222\250\220\69\90\127\106\10\64\128\6\88\3\143\38\120\76\64\196\230\111\192\149\105\232\84\128\176\227\201\132\79\3\16\177\249\235\136\134\27\160\23\232\18\16\171\17\243\38\103\94\10\144\131\152\108\238\1\24\131\56\0\247\193\156\187\204\189\0\49\196\129\223\242\108\109\46\115\192\157\138\9\242\192\71\112\255\211\218\252\25\211\249\6\226\213\254\2\60\36\162\163\234\20\12\197\121\73\136\86\1\232\18\171\125\53\7\162\196\188\201\132\90\42\68\117\110\34\234\77\114\113\30\66\28\131\180\221\6\3\112\3\196\31\163\247\76\156\15\65\220\206\253\24\9\176\1\118\129\184\102\242\68\223\190\3\174\115\125\212\185\47\80\139\247\90\207\185\126\201\138\69\131\164\148\253\139\210\101\103\180\0\252\123\128\111\200\13\133\169\35\17\162\157\0\0\0\0\73\69\78\68\174\66\96\130",
	arrow_right = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\2\73\68\65\84\120\218\237\213\177\74\196\48\28\199\241\255\47\220\18\29\111\40\28\180\164\139\80\168\187\62\192\33\226\120\190\128\190\132\160\227\249\24\206\62\192\77\114\231\168\110\247\4\14\255\6\186\56\183\82\40\209\191\75\38\183\235\73\51\152\239\146\41\201\135\148\38\68\177\88\236\191\135\93\39\88\107\151\68\164\155\166\185\45\203\178\31\29\80\85\213\23\0\37\34\155\174\235\22\69\81\52\251\0\212\206\98\64\249\113\174\181\126\181\214\206\70\5\252\194\28\19\209\75\93\215\71\65\0\190\220\57\247\198\204\39\161\0\4\96\10\224\153\153\207\131\0\60\226\16\192\138\153\175\131\0\60\98\2\224\193\90\123\19\4\48\164\201\31\175\215\139\200\149\49\230\113\116\128\136\124\42\165\46\243\60\127\10\113\2\31\0\46\178\44\219\134\248\4\172\148\58\75\211\244\61\196\61\176\117\206\157\14\221\124\208\9\136\200\183\127\140\214\90\235\69\146\36\237\168\127\1\128\123\34\58\104\219\246\206\24\211\83\44\22\139\237\217\15\210\164\81\21\9\153\87\125\0\0\0\0\73\69\78\68\174\66\96\130",
	arrow_down = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\12\73\68\65\84\120\218\237\148\175\78\4\49\16\198\191\105\42\150\123\129\37\217\63\221\189\167\64\32\112\144\16\4\2\143\225\9\78\65\46\65\192\67\29\2\80\72\16\200\19\215\172\88\181\138\64\72\54\52\29\12\226\4\176\237\109\130\97\126\178\253\250\125\147\233\100\0\65\16\4\225\191\67\67\130\166\105\174\152\249\130\136\84\140\49\51\123\34\186\54\198\92\254\166\11\49\221\138\13\7\128\175\55\147\33\221\160\113\215\117\231\204\188\216\160\187\119\125\223\207\71\127\1\0\180\109\59\113\206\221\2\216\9\12\127\76\146\100\47\77\211\183\209\29\0\128\44\203\222\181\214\71\204\188\12\144\175\156\115\135\33\225\193\29\88\27\200\41\128\7\0\219\63\12\94\167\181\222\205\243\124\25\234\25\53\92\198\152\149\82\106\31\192\203\55\215\175\0\14\98\194\163\11\0\128\162\40\158\189\247\199\0\250\181\227\15\34\58\169\170\234\41\214\79\109\178\60\234\186\190\39\162\83\102\246\204\204\0\206\202\178\188\249\243\45\102\173\157\89\107\103\178\207\5\65\16\198\240\9\8\73\81\242\141\212\25\22\0\0\0\0\73\69\78\68\174\66\96\130",
	close = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\82\73\68\65\84\120\218\237\149\77\75\66\65\24\133\207\43\51\55\255\128\66\119\165\48\11\5\93\213\214\164\108\19\209\159\109\81\155\12\132\150\238\20\18\154\133\110\46\161\63\64\112\6\79\27\131\50\63\174\215\27\17\204\179\126\153\243\12\243\30\6\8\4\2\129\63\70\210\12\77\38\147\23\146\39\222\251\91\99\204\116\215\172\181\182\172\181\126\32\57\175\84\42\173\125\103\23\82\138\22\69\228\92\41\213\181\214\150\119\133\43\165\186\0\206\0\20\211\28\156\74\64\107\125\67\114\32\34\13\173\117\111\60\30\159\174\207\36\73\82\82\74\61\137\72\3\192\136\228\93\110\2\113\28\207\162\40\234\144\28\0\168\137\200\243\87\137\36\73\74\139\197\162\43\34\77\0\163\229\114\121\89\173\86\223\115\219\129\109\65\36\175\162\40\242\89\195\15\22\216\32\241\6\192\3\168\103\9\207\36\240\41\225\156\235\173\130\65\210\146\108\29\26\126\72\11\126\64\242\251\77\68\50\93\166\112\196\19\212\87\79\240\42\34\102\125\49\127\69\96\195\182\95\104\173\219\219\218\145\171\192\182\170\237\171\104\46\2\251\122\126\140\68\42\1\231\220\163\136\52\73\14\157\115\237\77\219\30\199\241\204\123\127\77\114\8\160\6\224\62\55\1\146\115\146\125\239\125\103\215\103\100\140\153\122\239\59\36\251\0\230\225\175\15\4\2\255\130\15\150\180\231\116\218\136\46\219\0\0\0\0\73\69\78\68\174\66\96\130",
	chevron_right = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\0\144\73\68\65\84\120\218\237\213\49\14\130\64\16\5\208\65\72\172\182\132\200\57\60\130\231\182\178\35\216\72\225\29\40\119\54\243\215\68\178\20\90\218\8\196\136\254\215\239\254\159\108\102\71\132\136\104\141\128\120\2\208\170\106\53\247\174\205\180\99\105\43\146\237\243\188\56\46\81\226\109\222\251\210\12\23\32\38\51\92\67\8\53\75\252\119\9\85\173\204\208\1\49\1\104\62\48\5\95\228\197\19\236\24\254\219\225\143\93\128\230\25\222\205\253\138\39\78\65\118\19\73\231\97\184\31\156\115\61\215\51\17\173\218\8\97\243\188\94\115\155\244\26\0\0\0\0\73\69\78\68\174\66\96\130",
	more = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\0\95\73\68\65\84\120\218\237\209\193\9\128\48\16\68\209\191\193\46\4\33\245\216\71\106\210\74\108\39\160\125\140\23\115\140\167\128\7\231\157\22\254\101\96\193\204\204\236\239\162\23\106\173\43\176\3\146\84\114\206\199\200\222\76\47\227\182\136\152\159\123\7\150\193\29\128\244\245\11\186\3\36\21\73\151\164\51\165\84\70\119\51\51\51\107\110\147\16\66\1\148\22\183\167\0\0\0\0\73\69\78\68\174\66\96\130",
	history = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\2\197\73\68\65\84\120\218\237\87\75\107\84\75\16\254\106\140\246\156\132\8\46\220\248\0\31\224\245\130\139\171\160\136\15\4\193\7\42\6\116\23\197\139\40\247\15\184\52\63\65\4\221\11\110\84\92\40\68\215\130\196\40\186\81\81\84\92\136\145\36\131\228\222\171\160\139\174\234\100\230\115\83\39\12\145\201\156\113\142\186\208\130\67\115\234\84\87\125\253\85\85\119\31\224\87\23\41\106\72\178\50\61\61\189\141\228\0\201\205\34\178\142\228\18\0\117\17\25\7\240\30\192\8\128\225\16\194\227\210\0\144\92\144\82\58\1\224\44\128\181\5\253\190\38\57\20\66\184\33\34\44\4\64\85\239\3\104\84\171\213\157\77\186\63\1\92\22\145\45\174\26\7\112\133\228\72\189\94\127\214\219\219\251\1\64\197\204\86\144\92\85\169\84\14\1\24\0\176\210\193\63\36\57\152\101\217\219\182\144\205\140\102\54\139\54\198\184\95\85\63\185\254\157\153\13\146\172\20\97\204\204\78\153\217\132\153\81\85\255\77\41\237\234\8\64\140\113\159\170\38\119\112\141\100\127\167\197\69\178\223\204\134\221\135\181\5\145\3\80\213\245\170\250\217\223\207\119\83\225\36\43\102\118\33\103\34\198\184\186\8\128\71\62\94\37\41\221\182\153\131\200\153\120\208\210\103\14\192\159\177\34\180\171\234\61\85\189\87\48\29\147\14\226\104\17\0\199\138\172\110\110\225\182\177\61\237\246\175\90\181\161\137\200\162\22\243\167\102\102\102\54\246\245\245\213\230\2\0\128\16\66\209\253\100\12\192\10\0\155\66\8\79\0\96\182\173\68\228\28\201\212\106\126\215\91\174\72\29\192\176\191\14\148\178\143\119\146\2\103\249\128\207\185\147\235\42\248\177\242\198\199\229\63\5\64\8\97\210\235\97\22\64\79\89\169\152\83\112\163\205\103\74\147\228\11\110\148\194\0\201\209\14\129\46\243\130\172\149\194\64\139\85\206\39\107\124\172\125\197\64\74\105\171\170\254\111\102\167\190\99\25\28\116\230\70\190\250\146\82\218\238\45\50\65\178\167\236\200\36\123\204\108\220\99\252\213\42\71\47\220\96\176\108\0\41\165\127\220\247\203\249\138\228\100\19\11\253\37\174\126\177\153\213\252\48\58\50\159\161\168\234\3\55\188\94\226\113\124\203\125\142\182\245\233\23\146\143\249\133\164\27\16\30\252\162\7\159\138\49\174\42\52\49\198\184\71\85\173\137\137\197\223\72\251\237\166\43\89\103\45\27\99\220\221\196\196\164\153\29\35\185\176\72\181\123\193\229\57\159\154\47\184\180\73\199\31\0\46\137\200\118\87\77\2\184\70\242\110\163\209\120\158\101\217\127\249\181\220\55\153\131\34\114\216\207\124\144\188\79\242\120\150\101\99\221\252\152\72\74\233\111\146\103\68\100\67\65\2\95\145\28\170\86\171\55\75\251\53\243\94\222\65\114\47\128\157\0\86\147\92\10\160\33\34\19\0\106\36\71\68\100\56\132\240\20\191\165\160\124\1\66\153\168\175\136\40\175\50\0\0\0\0\73\69\78\68\174\66\96\130",
	clear = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\61\73\68\65\84\120\218\237\150\49\78\195\64\16\69\255\44\13\135\160\229\28\200\216\27\69\84\136\138\22\4\72\196\52\28\6\129\148\16\238\129\99\249\32\161\131\67\36\138\179\159\38\145\172\8\111\60\27\16\8\237\111\237\245\123\158\25\239\26\136\137\137\217\146\170\170\14\126\114\173\241\93\124\45\203\147\69\237\166\69\81\222\106\225\69\81\94\214\75\190\77\38\213\169\239\62\241\217\47\106\55\21\145\125\0\14\228\181\181\233\184\43\28\34\195\213\11\206\151\245\222\97\191\127\244\174\170\64\146\36\31\48\24\0\112\0\12\129\81\151\74\52\225\36\9\242\190\13\190\181\5\189\52\125\161\240\10\128\19\17\33\240\224\147\216\132\11\144\91\155\62\6\207\128\70\34\4\222\73\160\139\68\40\220\59\132\45\95\197\133\80\70\77\16\128\121\40\92\45\240\197\132\187\70\37\157\0\55\89\118\252\172\121\158\209\10\88\155\142\215\237\88\173\95\79\251\157\22\30\36\0\0\226\244\149\251\31\45\216\156\118\194\229\205\118\56\114\168\221\182\77\40\28\194\65\47\203\158\180\155\85\144\64\27\60\116\199\84\9\108\131\239\42\97\190\3\190\139\196\223\62\142\141\240\140\228\140\112\121\87\120\115\179\34\57\19\200\185\239\56\254\245\95\178\152\152\152\79\18\54\41\101\241\194\24\155\0\0\0\0\73\69\78\68\174\66\96\130",
	check = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\82\73\68\65\84\120\218\237\150\189\74\196\64\20\133\103\146\93\80\44\108\100\65\108\173\86\196\55\112\93\91\91\223\192\194\194\82\16\31\66\223\65\80\59\59\95\64\240\21\180\23\196\159\102\23\4\255\182\216\124\54\39\120\25\162\172\217\36\54\115\154\27\102\146\249\206\206\156\220\172\115\81\81\81\53\10\240\128\255\47\120\82\116\221\40\28\232\0\157\166\225\45\213\30\48\4\6\64\95\99\105\221\240\84\117\17\184\227\91\167\214\92\221\219\62\15\220\10\60\2\198\192\102\169\29\152\52\197\64\162\123\103\129\43\193\63\84\247\202\194\39\74\177\192\45\213\11\65\223\85\15\167\218\122\155\226\34\19\57\92\215\39\1\252\184\20\220\4\169\175\4\15\129\158\198\218\63\36\254\40\128\159\231\107\253\185\17\153\69\207\180\88\6\60\3\221\96\190\173\186\31\156\249\101\105\184\125\16\216\0\94\100\0\224\201\152\152\81\221\9\224\215\192\156\66\153\84\241\74\173\9\140\49\177\170\185\109\153\27\105\238\6\88\168\172\245\154\173\238\6\38\238\129\93\253\234\177\198\30\128\165\202\187\221\47\38\48\71\51\48\71\147\214\217\219\173\137\55\25\120\5\214\155\104\179\185\137\21\224\81\38\62\129\173\162\215\179\238\15\205\50\112\96\194\152\186\166\20\166\187\138\180\251\146\38\18\231\92\230\189\207\226\31\207\168\168\105\245\5\84\220\74\86\183\215\180\173\0\0\0\0\73\69\78\68\174\66\96\130",
	filter = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\1\143\73\68\65\84\120\218\237\151\65\74\195\64\20\134\255\153\182\130\130\160\66\247\122\7\55\93\41\40\94\192\165\155\34\66\143\161\199\168\59\111\225\17\92\184\112\33\110\68\188\128\136\168\21\170\54\249\220\188\224\144\182\49\137\177\81\240\135\199\75\83\230\205\63\255\252\153\151\72\255\168\25\46\125\3\112\63\58\161\115\252\94\5\0\47\169\45\105\40\201\75\98\146\74\5\145\212\136\37\181\36\13\156\115\195\49\2\64\195\46\251\146\246\36\13\108\0\21\44\50\178\90\55\146\182\36\61\142\109\7\224\44\218\192\5\213\227\9\232\4\74\79\208\202\254\0\86\129\59\96\100\17\151\140\8\120\181\235\221\148\210\154\70\162\105\121\219\152\191\91\129\50\120\179\124\100\53\91\249\92\243\73\162\23\144\40\138\100\204\73\88\51\191\117\77\42\224\184\4\137\145\229\115\96\33\241\87\81\2\14\104\88\62\75\21\206\66\100\113\15\172\101\154\46\7\9\111\177\2\220\6\19\76\67\28\152\182\147\203\116\5\182\98\29\120\9\28\158\37\125\175\212\190\231\48\101\55\67\133\228\94\191\210\201\3\18\45\203\135\129\212\233\149\159\38\147\87\222\212\204\140\30\88\4\30\130\61\15\87\191\145\152\55\111\93\95\176\149\198\95\244\7\95\180\221\250\146\221\173\50\120\213\140\63\75\32\178\23\140\90\8\56\73\203\54\246\219\68\124\129\39\0\123\182\159\37\29\72\186\146\212\172\138\72\153\115\97\14\216\7\46\131\3\105\179\146\243\63\111\127\8\136\116\129\107\96\103\38\4\194\118\29\252\158\7\150\102\241\109\145\73\164\54\148\122\235\249\135\164\15\203\113\86\31\127\113\13\56\0\0\0\0\73\69\78\68\174\66\96\130",
	grip = "\137\80\78\71\13\10\26\10\0\0\0\13\73\72\68\82\0\0\0\32\0\0\0\32\8\6\0\0\0\115\122\122\244\0\0\0\231\73\68\65\84\120\218\237\214\65\10\194\48\16\64\209\73\91\5\41\232\202\67\88\183\110\188\141\30\202\155\185\242\0\30\162\32\223\77\138\131\212\86\147\73\186\176\179\73\232\4\38\201\228\65\69\230\152\99\142\127\8\192\1\110\170\226\133\154\151\217\79\222\21\6\106\253\45\219\201\129\3\112\5\238\192\249\253\86\146\246\28\88\1\55\94\241\0\26\189\137\100\59\113\206\33\34\11\17\217\138\8\34\210\250\122\155\110\73\234\91\40\253\120\2\90\127\3\23\160\72\210\130\62\106\234\17\54\192\113\18\106\64\213\55\207\66\77\141\75\96\109\206\112\132\90\149\148\225\8\181\189\207\213\73\25\14\81\203\194\112\128\154\83\45\176\99\248\11\53\189\214\132\97\40\53\19\134\161\212\76\24\70\80\139\103\24\65\205\142\97\40\53\51\134\129\212\108\25\170\199\180\27\160\246\117\206\130\161\179\200\5\109\226\211\159\109\104\110\242\120\2\5\94\148\196\110\2\192\173\0\0\0\0\73\69\78\68\174\66\96\130",
}
do
	local UIS = game:GetService("UserInputService")
	local GS = game:GetService("GuiService")
	local last
	local function track(io)
		local t = io.UserInputType
		if t == Enum.UserInputType.MouseMovement or t == Enum.UserInputType.MouseButton1
			or t == Enum.UserInputType.MouseButton2 or t == Enum.UserInputType.MouseButton3 then
			last = Vector2.new(io.Position.X, io.Position.Y)
		end
	end
	UIS.InputChanged:Connect(track)
	UIS.InputBegan:Connect(track)
	UIS.InputEnded:Connect(track)
	function K.mouseAbs()
		if last then return last end
		local ok, inset = pcall(GS.GetGuiInset, GS)
		return UIS:GetMouseLocation() - (ok and inset or Vector2.zero)
	end
end
local UIIcon = {}
do
	if not isfolder("delve_ui") then makefolder("delve_ui") end
	for name, data in pairs(UI_PNG) do
		local path = "delve_ui/" .. name .. ".png"
		writefile(path, data)
		UIIcon[name] = getcustomasset(path)
	end
end

function K.remoteImage(url, path)
	K.remoteCache = K.remoteCache or {}
	if K.remoteCache[path] then return K.remoteCache[path] end
	if not isfolder("LX") then makefolder("LX") end
	if not isfolder("LX/ui") then makefolder("LX/ui") end
	if not isfile(path) then
		local ok, data = pcall(function() return game:HttpGet(url) end)
		if not ok or type(data) ~= "string" or data:sub(2, 4) ~= "PNG" then return nil end
		writefile(path, data)
	end
	local id = getcustomasset(path)
	K.remoteCache[path] = id
	return id
end

local function uiImage(props, parent, name, color)
	local img = Instance.new(props.ClassName or "ImageLabel")
	props.ClassName = nil
	img.BackgroundTransparency = 1
	img.Image = UIIcon[name] or ""
	img.ImageColor3 = color or Configuration.Theme.Dim
	for k, v in pairs(props) do img[k] = v end
	img.Parent = parent
	return img
end

local function windowButton(parent, kind, size)
	local T = Configuration.Theme
	local b = new("TextButton", {
		Size = size or UDim2.fromOffset(30, K.TITLE_H - 4), BackgroundColor3 = T.Panel,
		BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", ZIndex = 9,
	}, parent)
	new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
	b:SetAttribute("Glyph", kind)
	local strokes, images = {}, {}
	local function line(w, rot)
		local f = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(w, 1), Rotation = rot, BackgroundColor3 = T.Text,
			BorderSizePixel = 0, ZIndex = 10,
		}, b)
		strokes[#strokes + 1] = f
	end
	if kind == "close" then
		if UIIcon.winclose then
			images[1] = new("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(16, 16), BackgroundTransparency = 1, Image = UIIcon.winclose,
				ImageColor3 = T.Text, ZIndex = 10,
			}, b)
		else
			line(12, 45)
			line(12, -45)
		end
	else
		line(10, 0)
	end
	local tween
	local function fade(goal)
		if tween then tween:Cancel() end
		if Options.LowEnd then b.BackgroundTransparency = goal return end
		tween = Services.TweenService:Create(b, K.fastTween, { BackgroundTransparency = goal })
		tween:Play()
	end
	b.MouseEnter:Connect(function()
		b.BackgroundColor3 = Configuration.Theme.Panel
		fade(0)
		for _, f in ipairs(strokes) do f.BackgroundColor3 = Configuration.Theme.TabText end
		for _, i in ipairs(images) do i.ImageColor3 = Configuration.Theme.TabText end
	end)
	b.MouseLeave:Connect(function()
		fade(1)
		for _, f in ipairs(strokes) do f.BackgroundColor3 = Configuration.Theme.Text end
		for _, i in ipairs(images) do i.ImageColor3 = Configuration.Theme.Text end
	end)
	return b
end

local function divider(parent, y)
	return new("Frame", {
		Size = UDim2.new(1, 0, 0, 1), Position = y,
		BackgroundColor3 = Configuration.Theme.Border, BorderSizePixel = 0, ZIndex = 3,
	}, parent)
end

local function paneHeader(parent, text, font)
	local h = new("TextButton", {
		Size = UDim2.new(1, 0, 0, K.TITLE_H), BackgroundColor3 = Configuration.Theme.Main,
		BorderSizePixel = 0, AutoButtonColor = false, Text = "",
	}, parent)
	new("TextLabel", {
		BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0),
		Font = font or Enum.Font.SourceSans, TextSize = 14, TextColor3 = Configuration.Theme.Text, Text = text,
	}, h)
	local lbl = h:FindFirstChildOfClass("TextLabel")
	K.paneTitles = K.paneTitles or {}
	K.paneTitles[#K.paneTitles + 1] = { label = lbl, font = lbl.FontFace, size = lbl.TextSize }
	if K.styleTitles then K.styleTitles() end
	return h
end

local function filterBox(parent, y, placeholder, opts)
	opts = opts or {}
	local T = Configuration.Theme
	local holder = new("Frame", {
		Size = UDim2.new(1, 0, 0, K.FILTER_H), Position = UDim2.fromOffset(0, y),
		BackgroundColor3 = T.Main, BorderSizePixel = 0,
	}, parent)
	local right = opts.more and 34 or 8
	local field = new("Frame", {
		Size = UDim2.new(1, -(8 + right), 0, 22), Position = UDim2.fromOffset(8, 3),
		BackgroundColor3 = opts.boxed and T.Surface or T.Input, BorderSizePixel = 0,
	}, holder)
	new("UICorner", { CornerRadius = UDim.new(0, 4) }, field)
	local fieldStroke = stroke(field, opts.boxed and T.Input or T.Input, 1)
	fieldStroke.Transparency = opts.boxed and 0 or 1
	local iconW = (opts.history or opts.dropdown) and 22 or 0
	local box = new("TextBox", {
		BackgroundTransparency = 1, Size = UDim2.new(1, -(8 + iconW + 20), 1, 0),
		Position = UDim2.fromOffset(8, 0), Font = Enum.Font.SourceSans, TextSize = 14,
		TextColor3 = T.Text, PlaceholderColor3 = T.Dim,
		PlaceholderText = placeholder, Text = "", ClearTextOnFocus = false,
		TextXAlignment = Enum.TextXAlignment.Left, ClipsDescendants = true,
	}, field)
	box.Focused:Connect(function() fieldStroke.Color = T.Accent; fieldStroke.Transparency = 0 end)
	box.FocusLost:Connect(function() fieldStroke.Color = T.Input; fieldStroke.Transparency = opts.boxed and 0 or 1 end)
	local clear = new("ImageButton", {
		BackgroundTransparency = 1, Size = UDim2.fromOffset(16, 16), Visible = false, AutoButtonColor = false,
		Position = UDim2.new(1, -(iconW + 20), 0.5, -8), Image = UIIcon.clear or "", ImageColor3 = T.Dim, ZIndex = 2,
	}, field)
	clear.MouseEnter:Connect(function() clear.ImageColor3 = T.Text end)
	clear.MouseLeave:Connect(function() clear.ImageColor3 = T.Dim end)
	clear.MouseButton1Click:Connect(function() box.Text = "" end)
	box:GetPropertyChangedSignal("Text"):Connect(function() clear.Visible = box.Text ~= "" and UIIcon.clear ~= nil end)
	local extra = {}
	if opts.history then
		extra.history = uiImage({
			ClassName = "ImageButton", AutoButtonColor = false, Size = UDim2.fromOffset(18, 18),
			Position = UDim2.new(1, -21, 0.5, -9), ZIndex = 2,
		}, field, "history", T.Text)
	elseif opts.dropdown then
		uiImage({ Size = UDim2.fromOffset(16, 16), Position = UDim2.new(1, -20, 0.5, -8), ZIndex = 2 }, field, "arrow_down", T.Dim)
	end
	if opts.more then
		local more = new("ImageButton", {
			Size = UDim2.fromOffset(22, 22), Position = UDim2.new(1, -30, 0, 3), BackgroundColor3 = T.Input,
			AutoButtonColor = false, Image = "", BorderSizePixel = 0,
		}, holder)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, more)
		uiImage({ AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(18, 18) }, more, "more", T.TabText)
		more.MouseEnter:Connect(function() more.BackgroundColor3 = Configuration.Theme.Panel end)
		more.MouseLeave:Connect(function()
			local open = UI.options and UI.options.Visible
			more.BackgroundColor3 = open and Configuration.Theme.Panel or Configuration.Theme.Input
		end)
		extra.more = more
	end
	return holder, box, extra
end

local function scroller(parent)
	return new("ScrollingFrame", {
		BackgroundColor3 = Configuration.Theme.Surface, BorderSizePixel = 0,
		ScrollBarThickness = 6, ScrollBarImageColor3 = Configuration.Theme.Scrollbar,
		VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
		CanvasSize = UDim2.new(), ScrollingDirection = Enum.ScrollingDirection.Y,
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
	}, parent)
end

UI.explorerPane = new("Frame", { Name = "Explorer", BackgroundTransparency = 1, ClipsDescendants = true }, nil)
UI.titleBar = paneHeader(UI.explorerPane, "LX")
local explorerFilterBar, explorerFilter, explorerExtra = filterBox(UI.explorerPane, K.TITLE_H, "Search", { history = true, more = true })
UI.explorerFilterBar = explorerFilterBar
UI.explorerFilter = explorerFilter
UI.explorerHistoryBtn = explorerExtra.history
UI.explorerMoreBtn = explorerExtra.more
UI.tree = scroller(UI.explorerPane)
UI.tree.Position = UDim2.fromOffset(0, K.TITLE_H + K.FILTER_H)
UI.tree.Size = UDim2.new(1, 0, 1, -(K.TITLE_H + K.FILTER_H))

UI.propsPane = new("Frame", { Name = "Properties", BackgroundTransparency = 1, ClipsDescendants = true }, nil)
UI.propsHeader = paneHeader(UI.propsPane, "Properties")
local _, propsFilter = filterBox(UI.propsPane, K.TITLE_H, "Filter Properties", { boxed = true, dropdown = true })
UI.propsFilter = propsFilter
UI.props = scroller(UI.propsPane)
UI.props.Position = UDim2.fromOffset(0, K.TITLE_H + K.FILTER_H)
UI.props.Size = UDim2.new(1, 0, 1, -(K.TITLE_H + K.FILTER_H))

local Panes = {
	explorer = { id = "explorer", title = "LX", frame = UI.explorerPane, header = UI.titleBar },
	props = { id = "props", title = "Properties", frame = UI.propsPane, header = UI.propsHeader },
}

local rowPool = {}
local tilePool = {}
local renderTree, renderProps, selectInstance
local openContextMenu, openPicker, mousePos
local Delve = {}
_G.Delve = Delve

local function markDirty() State.dirty = true; State.pending = true; State.gridDirty = true end
local function safeChildren(inst)
	local ok, c = pcall(inst.GetChildren, inst)
	return ok and c or {}
end

local function repaintRows()
	for _, r in ipairs(rowPool) do r.paint() end
	if UI.repaintGrid then UI.repaintGrid() end
end

local selectionBoxes = setmetatable({}, { __mode = "k" })

local function adorneeFor(inst)
	local ok, target = pcall(function()
		if inst:IsA("BasePart") or inst:IsA("Model") then return inst end
		if inst:IsA("DataModelMesh") or inst:IsA("SurfaceAppearance") or inst:IsA("FaceInstance") then
			local p = inst.Parent
			if p and p:IsA("BasePart") then return p end
		end
		if inst:IsA("Accoutrement") or inst:IsA("Tool") or inst:IsA("Clothing") then
			return inst:FindFirstChild("Handle") or inst:FindFirstChildWhichIsA("BasePart", true)
		end
		if inst ~= workspace and not inst:IsA("ServiceProvider") and inst.Parent ~= game then
			return inst:FindFirstChildWhichIsA("BasePart", true)
		end
		return nil
	end)
	if ok and target and target:IsDescendantOf(workspace) then return target end
	return nil
end

function K.viewable(inst)
	local ok, r = pcall(function()
		if inst:IsA("Model") and inst ~= workspace then return true end
		if inst:IsA("BasePart") then return true end
		if inst == workspace or inst == game or inst.Parent == game then return false end
		return inst:FindFirstChildWhichIsA("BasePart", true) ~= nil
	end)
	return ok and r == true
end

local function refreshSelectionBoxes()
	local wanted = {}
	for _, inst in ipairs(Options.SelectionBoxes == false and {} or State.selection) do
		local target = adorneeFor(inst)
		if target then wanted[inst] = target end
	end
	for inst, box in pairs(selectionBoxes) do
		if not wanted[inst] or box.Adornee ~= wanted[inst] then
			box:Destroy()
			selectionBoxes[inst] = nil
		end
	end
	for inst, target in pairs(wanted) do
		if not selectionBoxes[inst] then
			selectionBoxes[inst] = new("SelectionBox", {
				Name = "delvesel", Adornee = target, Color3 = Configuration.Theme.SelectionBox,
				LineThickness = 0.04, SurfaceTransparency = 1, Transparency = 0,
			}, UI.gui)
		end
	end
end

local function setSelection(list, primary)
	table.clear(State.selection); table.clear(State.selSet)
	for _, inst in ipairs(list) do
		if inst and not State.selSet[inst] then State.selSet[inst] = true; State.selection[#State.selection + 1] = inst end
	end
	State.selected = primary or State.selection[#State.selection]
	refreshSelectionBoxes()
	repaintRows(); renderProps()
end
selectInstance = function(inst) setSelection(inst and { inst } or {}, inst) end
local function toggleSelect(inst)
	if State.selSet[inst] then
		State.selSet[inst] = nil
		local i = table.find(State.selection, inst)
		if i then table.remove(State.selection, i) end
		if State.selected == inst then State.selected = State.selection[#State.selection] end
	else
		State.selSet[inst] = true; State.selection[#State.selection + 1] = inst; State.selected = inst
	end
	refreshSelectionBoxes()
	repaintRows(); renderProps()
end
local function indexInFlat(inst)
	for i, n in ipairs(State.flat) do if n.inst == inst then return i end end
	return nil
end
local function selectRange(a, b)
	local i, j = indexInFlat(a), indexInFlat(b)
	if not (i and j) then selectInstance(b) return end
	if i > j then i, j = j, i end
	local list = {}
	for k = i, j do list[#list + 1] = State.flat[k].inst end
	setSelection(list, b)
end
local function pruneSelection()
	local keep = {}
	for _, inst in ipairs(State.selection) do if inst.Parent ~= nil then keep[#keep + 1] = inst end end
	local primary = (State.selected and State.selected.Parent ~= nil) and State.selected or nil
	setSelection(keep, primary)
end
local heldKeys = {}
Services.UserInputService.InputBegan:Connect(function(i) if i.KeyCode ~= Enum.KeyCode.Unknown then heldKeys[i.KeyCode] = true end end)
Services.UserInputService.InputEnded:Connect(function(i) if i.KeyCode ~= Enum.KeyCode.Unknown then heldKeys[i.KeyCode] = nil end end)
pcall(function() Services.UserInputService.WindowFocusReleased:Connect(function() table.clear(heldKeys) end) end)
local function keyDown(a, b)
	local uis = Services.UserInputService
	return heldKeys[a] or heldKeys[b] or uis:IsKeyDown(a) or uis:IsKeyDown(b)
end
local function modifiers()
	local ctrl = keyDown(Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl) or keyDown(Enum.KeyCode.LeftMeta, Enum.KeyCode.RightMeta)
	local shift = keyDown(Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift)
	local alt = keyDown(Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt)
	return ctrl and true or false, shift and true or false, alt and true or false
end

local Cache = {
	ready = false, all = {},
	index = setmetatable({}, { __mode = "k" }),
	children = setmetatable({}, { __mode = "k" }),
	roots = setmetatable({}, { __mode = "k" }),
	extraRoots = {}, knownClasses = {}, creatable = {},
}
local function sortChildren(list)
	table.sort(list, function(a, b)
		local an, bn = a.Name:lower(), b.Name:lower()
		if an == bn then return a.ClassName < b.ClassName end
		return an < bn
	end)
end
function Cache.add(inst)
	if Cache.index[inst] then return end
	local ok, name, cls = pcall(function() return inst.Name, inst.ClassName end)
	if not ok then return end
	local rec = { inst = inst, raw = name, lower = name:lower(), class = cls:lower() }
	local n = #Cache.all + 1
	Cache.all[n] = rec; Cache.index[inst] = n
	if not Cache.knownClasses[cls] then
		Cache.knownClasses[cls] = true
		pcall(iconIndexFor, inst); pcall(studioNameFor, inst)
	end
end
function Cache.remove(inst)
	local i = Cache.index[inst]
	if not i then return end
	local all = Cache.all
	local last = #all
	local lastRec = all[last]
	all[i] = lastRec; Cache.index[lastRec.inst] = i
	all[last] = nil; Cache.index[inst] = nil
end
function Cache.getChildren(inst)
	local c = Cache.children[inst]
	if c then return c end
	c = safeChildren(inst); pcall(sortChildren, c)
	Cache.children[inst] = c
	return c
end
function Cache.invalidate(inst) if inst then Cache.children[inst] = nil end end
function Cache.isCreatable(cls)
	local v = Cache.creatable[cls]
	if v ~= nil then return v end
	local ok, inst = pcall(Instance.new, cls)
	v = ok and inst ~= nil
	if v then pcall(iconIndexFor, inst); pcall(studioNameFor, inst); pcall(inst.Destroy, inst) end
	Cache.creatable[cls] = v
	return v
end
function Cache.search(needle, limit)
	local out = {}
	for _, rec in ipairs(Cache.all) do
		local inst = rec.inst
		local ok, name = pcall(function() return inst.Name end)
		if ok then
			if name ~= rec.raw then rec.raw = name; rec.lower = name:lower() end
			if (rec.lower:find(needle, 1, true) or rec.class:find(needle, 1, true)) and inst.Parent ~= nil then
				out[#out + 1] = rec
				if #out >= limit then break end
			end
		end
	end
	table.sort(out, function(a, b) return a.lower < b.lower end)
	for i, rec in ipairs(out) do out[i] = rec.inst end
	return out
end
function Cache.track(root)
	if Cache.roots[root] then return end
	Cache.roots[root] = true
	root.DescendantAdded:Connect(function(d) Cache.add(d); Cache.invalidate(d.Parent); markDirty() end)
	root.DescendantRemoving:Connect(function(d)
		Cache.remove(d); Cache.invalidate(d.Parent); Cache.children[d] = nil
		if State.selSet[d] then task.defer(pruneSelection) end
		markDirty()
	end)
end
function Cache.indexTree(root, onStep)
	local ok, desc = pcall(root.GetDescendants, root)
	if not ok then return 0 end
	for i, d in ipairs(desc) do
		if d.Parent ~= nil then Cache.add(d) end
		if onStep and i % 1500 == 0 then onStep(i, #desc) end
	end
	return #desc
end

local serviceClasses = {}
for _, n in ipairs(K.SERVICE_ORDER) do serviceClasses[n] = true end
for _, n in ipairs(K.SERVICE_CATALOG) do serviceClasses[n] = true end
local function isServiceClass(cls)
	if serviceClasses[cls] then return true end
	local ok, found = pcall(game.FindFirstChildOfClass, game, cls)
	if ok and found then serviceClasses[cls] = true; return true end
	return false
end

local function topLevel()
	local list, seen = {}, {}
	for _, name in ipairs(K.SERVICE_ORDER) do
		local s = game:FindFirstChildOfClass(name)
		if s and not seen[s] then table.insert(list, s); seen[s] = true end
	end
	if Options.ShowHiddenServices then
		local hidden = {}
		for _, s in ipairs(safeChildren(game)) do
			if not seen[s] then
				local ok, cls = pcall(function() return s.ClassName end)
				if ok and cls and cls ~= "" then hidden[#hidden + 1] = s; seen[s] = true end
			end
		end
		for _, cls in ipairs(K.SERVICE_CATALOG) do
			local ok, s = pcall(game.FindService, game, cls)
			if ok and s and not seen[s] then hidden[#hidden + 1] = s; seen[s] = true end
		end
		pcall(sortChildren, hidden)
		for _, s in ipairs(hidden) do table.insert(list, s) end
	end
	for _, s in ipairs(Cache.extraRoots) do
		if s.Parent ~= nil and not seen[s] then table.insert(list, s); seen[s] = true end
	end
	return list
end

K.Support = {}
function K.probeSupport(progress)
	local checks = {
		{ "Custom assets", { "getcustomasset" } },
		{ "File system", { "writefile" } }, { "File reading", { "readfile" } },
		{ "Folders", { "makefolder" } }, { "Clipboard", { "setclipboard" } },
		{ "Decompiler", { "decompile" } }, { "HTTP requests", { "request" } },
		{ "Hidden UI", { "gethui" } }, { "Connections", { "getconnections" } },
		{ "Save instance", { "saveinstance" } },
	}
	for i, c in ipairs(checks) do
		progress(0.02 * i / #checks, "Checking support: " .. c[1])
		local ok, fn = pcall(envFn, table.unpack(c[2]))
		K.Support[c[1]] = ok and fn ~= nil
		wait(0.06)
	end
	progress(0.02, "Measuring performance...")
	local frames, total = 0, 0
	local t0 = os.clock()
	while frames < 30 and os.clock() - t0 < 1.5 do
		total += Services.RunService.Heartbeat:Wait()
		frames += 1
	end
	K.Support.FrameTime = frames > 0 and total / frames or 0
	if K.Support.FrameTime > 1 / 40 then K.lowFpsDetected = true end
	K.applyPerformance()
	Delve.Support = K.Support
end

function Cache.preload(progress)
	local startedAt = os.clock()
	pcall(K.probeSupport, progress)
	progress(0.03, "Scanning services...")
	local roots = topLevel()
	local total = 0
	for _, r in ipairs(roots) do
		Cache.track(r)
		local ok, n = pcall(function() return #r:GetDescendants() end)
		total += ok and n or 0
		wait()
	end
	total = math.max(total, 1)
	local done = 0
	for _, r in ipairs(roots) do
		local base = done
		local n = Cache.indexTree(r, function(i)
			local d = base + i
			progress(0.05 + 0.75 * math.min(1, d / total),
				string.format("Indexing %s  (%d / %d)", r.Name, d, total))
			wait()
		end)
		done += n
		progress(0.05 + 0.75 * math.min(1, done / total), string.format("Indexed %s", r.Name))
	end
	progress(0.82, "Building hierarchy...")
	for i, r in ipairs(roots) do
		local kids = Cache.getChildren(r)
		if r == workspace then
			for j, c in ipairs(kids) do
				Cache.getChildren(c)
				if j % 200 == 0 then wait() end
			end
		end
		if i % 4 == 0 then wait() end
	end
	progress(0.9, "Checking insertable classes...")
	local n = 0
	for _, cat in ipairs(K.INSERT_CATALOG) do
		for _, cls in ipairs(cat[2]) do
			Cache.isCreatable(cls)
			n += 1
			if n % 25 == 0 then wait() end
		end
	end
	progress(0.96, "Loading icons...")
	if StudioIcons.enabled then
		for _, r in ipairs(roots) do pcall(function() StudioIcons.request(studioNameFor(r)) end) end
		for _, name in pairs(StudioIcons.byClass) do StudioIcons.request(name) end
		for _, cat in ipairs(K.INSERT_CATALOG) do
			for _, cls in ipairs(cat[2]) do StudioIcons.request(studioNameForClass(cls)) end
		end
		StudioIcons.request("Class"); StudioIcons.request("Service"); StudioIcons.request("Workspace")
	end
	local doneIcons = false
	task.spawn(function()
		pcall(function() Services.ContentProvider:PreloadAsync({ IconSheet.image }) end)
		doneIcons = true
	end)
	local t0 = os.clock()
	local startBusy = math.max(1, StudioIcons.busy())
	while (not doneIcons or StudioIcons.busy() > 0) and os.clock() - t0 < 12 do
		local left = StudioIcons.busy()
		progress(0.96 + 0.04 * (1 - left / startBusy), "Loading icons...")
		wait()
	end
	local MIN_LOAD = 3
	while os.clock() - startedAt < MIN_LOAD do
		progress(0.995, "Finishing up...")
		wait(0.05)
	end
	progress(1, string.format("Ready - %d instances indexed", #Cache.all))
end

local function rebuildFlat()
	table.clear(State.flat)
	if State.filterText ~= "" then
		for _, inst in ipairs(Cache.search(State.filterText:lower(), 3000)) do
			State.flat[#State.flat + 1] = { inst = inst, depth = 0, hasChildren = false }
		end
		return
	end
	local function walk(inst, depth)
		local children = Cache.getChildren(inst)
		State.flat[#State.flat + 1] = { inst = inst, depth = depth, hasChildren = #children > 0 }
		if State.expanded[inst] then
			for _, c in ipairs(children) do walk(c, depth + 1) end
		end
	end
	for _, s in ipairs(topLevel()) do walk(s, 0) end
end

local beginRowDrag
local function makeRow()
	local row = new("TextButton", {
		Size = UDim2.new(1, 0, 0, K.ROW_HEIGHT), BackgroundColor3 = Configuration.Theme.Hover,
		BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false,
		Text = "", Visible = false,
	}, UI.tree)
	local arrow = new("TextButton", {
		Name = "Arrow", Size = UDim2.fromOffset(16, K.ROW_HEIGHT), BackgroundTransparency = 1,
		Text = "", AutoButtonColor = false, ZIndex = 2,
	}, row)
	local arrowImg = uiImage({
		Size = UDim2.fromOffset(16, 16), Position = UDim2.fromOffset(0, (K.ROW_HEIGHT - 16) / 2),
		ZIndex = 3,
	}, arrow, "arrow_right", Configuration.Theme.Text)
	local icon = new("ImageLabel", {
		Name = "Icon", Size = UDim2.fromOffset(16, 16), BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit, ZIndex = 2,
	}, row)
	local label = new("TextLabel", {
		Name = "Label", BackgroundTransparency = 1, Size = UDim2.new(1, -60, 1, 0),
		Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = Configuration.Theme.Text,
		TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 2,
	}, row)
	local plus = new("TextButton", {
		Name = "Add", Size = UDim2.fromOffset(K.ROW_HEIGHT, K.ROW_HEIGHT),
		Position = UDim2.new(1, -K.ROW_HEIGHT - 2, 0, 0),
		BackgroundTransparency = 1, AutoButtonColor = false, Font = Enum.Font.SourceSansBold, TextSize = 18,
		TextColor3 = Configuration.Theme.Dim, Text = "+", Visible = false, ZIndex = 4,
	}, row)
	local r = { frame = row, arrow = arrow, arrowImg = arrowImg, icon = icon, label = label, plus = plus, node = nil, hover = false }

	local function paint()
		local isSel = r.node and State.selSet[r.node.inst]
		if isSel then
			row.BackgroundColor3 = Configuration.Theme.Header; row.BackgroundTransparency = 0
		elseif r.hover then
			row.BackgroundColor3 = Configuration.Theme.Hover; row.BackgroundTransparency = 0
		else
			row.BackgroundTransparency = 1
		end
		plus.Visible = r.node ~= nil and State.filterText == "" and (r.hover or (isSel and Services.UserInputService.TouchEnabled)) and true or false
	end
	r.paint = paint
	row.MouseEnter:Connect(function() r.hover = true; paint() end)
	row.MouseLeave:Connect(function() r.hover = false; paint() end)
	plus.MouseEnter:Connect(function() plus.TextColor3 = Configuration.Theme.TabText end)
	plus.MouseLeave:Connect(function() plus.TextColor3 = Configuration.Theme.Dim end)
	plus.MouseButton1Click:Connect(function()
		if not r.node then return end
		local inst = r.node.inst
		local a = plus.AbsolutePosition - UI.gui.AbsolutePosition
		openPicker("object", { inst }, a.X + plus.AbsoluteSize.X, a.Y, a.X, true)
	end)

	row.MouseButton2Click:Connect(function()
		if not r.node then return end
		r.handledRight = os.clock()
		if not State.selSet[r.node.inst] then
			selectInstance(r.node.inst)
			State.anchorInst = r.node.inst
		end
		openContextMenu(mousePos(), true)
	end)

	local holdToken = 0
	r.cancelHold = function() holdToken += 1 end
	row.InputBegan:Connect(function(i)
		if not r.node then return end
		if i.UserInputType == Enum.UserInputType.MouseButton1 and beginRowDrag then beginRowDrag(r) end
		if i.UserInputType == Enum.UserInputType.Touch then
			if beginRowDrag then beginRowDrag(r, true) end
			holdToken += 1
			local token = holdToken
			local inst = r.node.inst
			local startPos = mousePos()
			delay(0.5, function()
				if token ~= holdToken or not r.node or r.node.inst ~= inst then return end
				if (mousePos() - startPos).Magnitude > 12 then return end
				r.suppressClick = true
				if not State.selSet[inst] then selectInstance(inst); State.anchorInst = inst end
				openContextMenu(mousePos(), true)
			end)
		end
	end)
	row.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch then holdToken += 1 end
	end)

	local function toggle()
		if r.node and r.node.hasChildren then
			State.expanded[r.node.inst] = not State.expanded[r.node.inst] or nil
			State.dirty = true
			renderTree()
		end
	end
	arrow.MouseButton1Click:Connect(toggle)

	row.MouseButton1Click:Connect(function()
		if not r.node then return end
		if r.suppressClick then r.suppressClick = false return end
		if r.dragSuppress and os.clock() - r.dragSuppress < 0.25 then r.dragSuppress = nil return end
		local inst = r.node.inst
		local ctrl, shift = modifiers()
		if shift and State.anchorInst then
			selectRange(State.anchorInst, inst)
		elseif ctrl then
			toggleSelect(inst); State.anchorInst = inst
		else
			selectInstance(inst); State.anchorInst = inst
			local now = os.clock()
			if r.lastClickedInst == inst and now - (r.lastClick or 0) < 0.32 then
				r.lastClick = 0
				if ALL_KNOWING and inst:IsA("LuaSourceContainer") then
					task.spawn(function()
						pcall(Delve.openScriptViewer, inst)
					end)
				elseif K.viewable(inst) then
					task.spawn(function()
						pcall(Delve.open3DViewer, inst)
					end)
				end
				return
			end
			r.lastClickedInst = inst
			r.lastClick = now
		end
	end)
	return r
end

local function ensurePool(n)
	while #rowPool < n do table.insert(rowPool, makeRow()) end
end

renderTree = function()
	if State.dirty then rebuildFlat(); State.dirty = false end
	UI.tree.CanvasSize = UDim2.fromOffset(0, #State.flat * K.ROW_HEIGHT)
	local viewH = UI.tree.AbsoluteSize.Y
	local need = math.ceil(viewH / K.ROW_HEIGHT) + 2
	ensurePool(need)
	local first = math.floor(UI.tree.CanvasPosition.Y / K.ROW_HEIGHT) + 1
	for i, r in ipairs(rowPool) do
		local node = State.flat[first + i - 1]
		if node and i <= need then
			r.node = node
			local f = r.frame
			f.Visible = true
			f.Position = UDim2.fromOffset(0, (first + i - 2) * K.ROW_HEIGHT)
			local x = 8 + node.depth * 16
			r.arrow.Position = UDim2.fromOffset(x, 0)
			r.arrowImg.Visible = node.hasChildren
			r.arrowImg.Image = UIIcon[State.expanded[node.inst] and "arrow_down" or "arrow_right"] or ""
			r.icon.Position = UDim2.fromOffset(x + 20, math.floor((K.ROW_HEIGHT - 16) / 2))
			applyIcon(r.icon, node.inst)
			r.label.Position = UDim2.fromOffset(x + 40, 0)
			r.label.Size = UDim2.new(1, -(x + 40) - K.ROW_HEIGHT - 6, 1, 0)
			local ok, name = pcall(function() return node.inst.Name end)
			r.label.Text = ok and name or "?"
			r.paint()
		else
			r.node = nil
			r.frame.Visible = false
		end
	end
	if State.gridView and UI.renderGrid then pcall(UI.renderGrid) end
end

UI.tree:GetPropertyChangedSignal("CanvasPosition"):Connect(renderTree)
UI.tree:GetPropertyChangedSignal("AbsoluteSize"):Connect(renderTree)

local function fmt(v)
	local t = typeof(v)
	if t == "nil" then return "nil", Configuration.Theme.Dim end
	if t == "boolean" then return tostring(v), Configuration.Theme.PropBool end
	if t == "number" then
		return (math.floor(v) == v) and tostring(v) or string.format("%.3f", v), Configuration.Theme.PropNumber
	end
	if t == "string" then return v, Configuration.Theme.PropString end
	if t == "Instance" then return v.Name, Configuration.Theme.PropValue end
	if t == "EnumItem" then return v.Name, Configuration.Theme.PropValue end
	if t == "Vector3" then return string.format("%.3f, %.3f, %.3f", v.X, v.Y, v.Z), Configuration.Theme.PropValue end
	if t == "Vector2" then return string.format("%.3f, %.3f", v.X, v.Y), Configuration.Theme.PropValue end
	if t == "Color3" then
		return string.format("%d, %d, %d", math.floor(v.R * 255 + 0.5), math.floor(v.G * 255 + 0.5), math.floor(v.B * 255 + 0.5)), Configuration.Theme.PropValue
	end
	if t == "CFrame" then
		local p = v.Position
		return string.format("%.2f, %.2f, %.2f", p.X, p.Y, p.Z), Configuration.Theme.PropValue
	end
	local function n(x) return (math.floor(x) == x) and tostring(x) or string.format("%.3f", x) end
	if t == "UDim2" then
		return string.format("{%s, %s}, {%s, %s}", n(v.X.Scale), n(v.X.Offset), n(v.Y.Scale), n(v.Y.Offset)), Configuration.Theme.PropValue
	end
	if t == "UDim" then return string.format("%s, %s", n(v.Scale), n(v.Offset)), Configuration.Theme.PropValue end
	if t == "Rect" then
		return string.format("%s, %s, %s, %s", n(v.Min.X), n(v.Min.Y), n(v.Max.X), n(v.Max.Y)), Configuration.Theme.PropValue
	end
	if t == "NumberRange" then return string.format("%s, %s", n(v.Min), n(v.Max)), Configuration.Theme.PropValue end
	if t == "BrickColor" then return v.Name, Configuration.Theme.PropValue end
	if t == "Font" then
		local fam = tostring(v.Family):match("([^/]+)%.json$") or tostring(v.Family)
		return string.format("%s, %s, %s", fam, v.Weight.Name, v.Style.Name), Configuration.Theme.PropValue
	end
	if t == "NumberSequence" then
		local k = v.Keypoints
		if #k == 2 and k[1].Value == k[2].Value then return n(k[1].Value), Configuration.Theme.PropValue end
		local parts = {}
		for _, kp in ipairs(k) do parts[#parts + 1] = n(kp.Time) .. ":" .. n(kp.Value) end
		return "(" .. table.concat(parts, " ") .. ")", Configuration.Theme.PropValue
	end
	if t == "ColorSequence" then
		local k = v.Keypoints
		local function c(x) return string.format("%d,%d,%d", math.floor(x.R * 255 + 0.5), math.floor(x.G * 255 + 0.5), math.floor(x.B * 255 + 0.5)) end
		if #k == 2 and k[1].Value == k[2].Value then return "[" .. c(k[1].Value) .. "]", Configuration.Theme.PropValue end
		local parts = {}
		for _, kp in ipairs(k) do parts[#parts + 1] = n(kp.Time) .. ":[" .. c(kp.Value) .. "]" end
		return table.concat(parts, " "), Configuration.Theme.PropValue
	end
	if t == "PhysicalProperties" then
		return string.format("%s, %s, %s", n(v.Density), n(v.Friction), n(v.Elasticity)), Configuration.Theme.PropValue
	end
	if t == "Faces" or t == "Axes" then
		local parts = {}
		for _, f in ipairs({ "Top", "Bottom", "Left", "Right", "Front", "Back", "X", "Y", "Z" }) do
			local ok, has = pcall(function() return v[f] end)
			if ok and has then parts[#parts + 1] = f end
		end
		return table.concat(parts, ", "), Configuration.Theme.PropValue
	end
	if t == "Content" then
		local ok, uri = pcall(function() return v.Uri end)
		return (ok and uri) or "", Configuration.Theme.PropString
	end
	if t == "Vector3int16" or t == "Vector2int16" then return tostring(v), Configuration.Theme.PropValue end
	return tostring(v), Configuration.Theme.PropValue
end

UI.editBox = new("TextBox", {
	Visible = false, BackgroundColor3 = Configuration.Theme.Input, BorderSizePixel = 0, Font = Enum.Font.SourceSans,
	TextSize = 14, TextColor3 = Configuration.Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
	ClearTextOnFocus = false, Text = "", ZIndex = 20,
}, UI.props)
stroke(UI.editBox, Configuration.Theme.Accent)

function K.isAttr(name) return type(name) == "string" and name:sub(1, 1) == "@" end
function K.pget(inst, name)
	if not K.allowProperty(name) then return nil end
	if K.isAttr(name) then return inst:GetAttribute(name:sub(2)) end
	return inst[name]
end
function K.pset(inst, name, v)
	if not K.allowProperty(name) then return end
	if K.isAttr(name) then inst:SetAttribute(name:sub(2), v) return end
	inst[name] = v
end

local function closeEditBox()
	UI.editBox.Visible = false
	State.editingInst, State.editingProp, State.editingKind = nil, nil, nil
end

UI.editBox.FocusLost:Connect(function(enter)
	local inst, prop, kind = State.editingInst, State.editingProp, State.editingKind
	if not enter or not inst or not prop then closeEditBox(); return end
	local cur
	pcall(function() cur = K.pget(inst, prop) end)
	local newVal
	local txt = UI.editBox.Text
	if typeof(cur) == "number" then
		newVal = tonumber(txt)
	elseif typeof(cur) == "boolean" then
		newVal = txt:lower() == "true"
	elseif typeof(cur) == "string" then
		newVal = txt
	elseif typeof(cur) == "EnumItem" then
		local et = cur.EnumType
		for _, item in ipairs(et:GetEnumItems()) do
			if item.Name:lower() == txt:lower() or tostring(item.Value) == txt then
				newVal = item
				break
			end
		end
	elseif typeof(cur) == "Vector3" then
		local a, b, c = txt:match("(%-?[%d%.]+)%s*,%s*(%-?[%d%.]+)%s*,%s*(%-?[%d%.]+)")
		if a then newVal = Vector3.new(tonumber(a), tonumber(b), tonumber(c)) end
	elseif typeof(cur) == "Vector2" then
		local a, b = txt:match("(%-?[%d%.]+)%s*,%s*(%-?[%d%.]+)")
		if a then newVal = Vector2.new(tonumber(a), tonumber(b)) end
	else
		local nums = {}
		for x in txt:gmatch("%-?%d*%.?%d+") do nums[#nums + 1] = tonumber(x) end
		local k = typeof(cur)
		if k == "UDim2" and #nums >= 4 then
			newVal = UDim2.new(nums[1], nums[2], nums[3], nums[4])
		elseif k == "UDim" and #nums >= 2 then
			newVal = UDim.new(nums[1], nums[2])
		elseif k == "Rect" and #nums >= 4 then
			newVal = Rect.new(nums[1], nums[2], nums[3], nums[4])
		elseif k == "NumberRange" and #nums >= 1 then
			newVal = NumberRange.new(nums[1], nums[2] or nums[1])
		elseif k == "CFrame" and #nums >= 3 then
			newVal = CFrame.new(nums[1], nums[2], nums[3]) * (cur - cur.Position)
		elseif k == "Color3" and #nums >= 3 then
			newVal = Color3.fromRGB(nums[1], nums[2], nums[3])
		elseif k == "BrickColor" then
			pcall(function() newVal = BrickColor.new(txt) end)
		elseif k == "NumberSequence" and #nums >= 1 then
			newVal = NumberSequence.new(nums[1])
		elseif k == "PhysicalProperties" and #nums >= 3 then
			newVal = PhysicalProperties.new(nums[1], nums[2], nums[3])
		elseif k == "Vector3int16" and #nums >= 3 then
			newVal = Vector3int16.new(nums[1], nums[2], nums[3])
		elseif k == "Vector2int16" and #nums >= 2 then
			newVal = Vector2int16.new(nums[1], nums[2])
		elseif k == "Font" then
			local fam, w, st = txt:match("^%s*([^,]+)%s*,?%s*([^,]*)%s*,?%s*([^,]*)")
			if fam then
				pcall(function()
					local weight = (w ~= "" and Enum.FontWeight[w]) or cur.Weight
					local style = (st ~= "" and Enum.FontStyle[st]) or cur.Style
					local family = fam:find("rbxasset") and fam or ("rbxasset://fonts/families/" .. fam .. ".json")
					newVal = Font.new(family, weight, style)
				end)
			end
		elseif k == "Content" then
			pcall(function() newVal = Content.fromUri(txt) end)
		elseif k == "nil" or k == "Instance" then
			newVal = nil
		else
			newVal = txt
		end
	end
	if newVal ~= nil then
		pcall(K.pset, inst, prop, newVal)
	end
	closeEditBox()
	renderProps()
end)

local function beginPropEdit(inst, prop, curVal, row, valueLabel)
	if State.editingInst then closeEditBox() end
	State.editingInst, State.editingProp, State.editingKind = inst, prop, typeof(curVal)
	local lp = UI.props.AbsolutePosition
	UI.editBox.Position = UDim2.fromOffset(
		valueLabel.AbsolutePosition.X - lp.X - 2,
		valueLabel.AbsolutePosition.Y - lp.Y + 1)
	UI.editBox.Size = UDim2.new(0, math.max(120, valueLabel.AbsoluteSize.X + 40), 0, K.ROW_HEIGHT - 2)
	if typeof(curVal) == "Vector3" then
		UI.editBox.Text = string.format("%.3f, %.3f, %.3f", curVal.X, curVal.Y, curVal.Z)
	elseif typeof(curVal) == "Vector2" then
		UI.editBox.Text = string.format("%.3f, %.3f", curVal.X, curVal.Y)
	elseif typeof(curVal) == "string" or typeof(curVal) == "number" or typeof(curVal) == "boolean" then
		UI.editBox.Text = tostring(curVal)
	else
		UI.editBox.Text = (fmt(curVal))
	end
	UI.editBox.Visible = true
	UI.editBox.ZIndex = 20
	task.defer(function()
		UI.editBox:CaptureFocus()
		UI.editBox.SelectionStart = 1
		UI.editBox.CursorPosition = #UI.editBox.Text + 1
	end)
end

local function openColorPicker(initial, callback, preview)
	if UI.colorPicker then pcall(function() UI.colorPicker:Destroy() end) UI.colorPicker = nil end
	local okObj, objs = pcall(function() return game:GetObjects("rbxassetid://4908465318") end)
	if not okObj or type(objs) ~= "table" or not objs[1] then return end
	local root = objs[1]
	local host = new("ScreenGui", {
		Name = "colorpicker", ResetOnSpawn = false, IgnoreGuiInset = true,
		DisplayOrder = 1001, ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, UI.guiParent)
	UI.colorPicker = host
	local confirmed = false
	host.Destroying:Connect(function()
		if not confirmed and preview then pcall(preview, initial) end
	end)
	local picker = root
	if root:IsA("LayerCollector") then
		picker = new("Frame", { Name = "pickerroot", BackgroundTransparency = 1, Size = UDim2.fromOffset(438, 320) }, nil)
		for _, c in ipairs(root:GetChildren()) do c.Parent = picker end
		local inner = picker:FindFirstChild("ColorPicker")
		if inner and inner:IsA("GuiObject") then
			local sz = inner.AbsoluteSize
			if inner.Size.X.Offset > 0 then picker.Size = UDim2.fromOffset(inner.Size.X.Offset, inner.Size.Y.Offset) end
			inner.Position = UDim2.new()
			inner.AnchorPoint = Vector2.zero
		end
	end
	picker.Name = "picker"
	picker.AnchorPoint = Vector2.zero
	picker.Position = UDim2.new(0.5, -219, 0.5, -170)
	picker.Parent = host

	local function closePicker()
		if host then host:Destroy() end
		if UI.colorPicker == host then UI.colorPicker = nil end
	end

	local dragHandle = (picker:FindFirstChild("ColorPicker") and picker.ColorPicker:FindFirstChild("TopBar")) or picker
	local dragging, dragStart, startPos = false, nil, nil
	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = Services.UserInputService:GetMouseLocation()
			startPos = picker.Position
		end
	end)
	local moveConn, endConn
	moveConn = Services.UserInputService.InputChanged:Connect(function(input)
		if not host.Parent then moveConn:Disconnect() return end
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = Services.UserInputService:GetMouseLocation() - dragStart
			picker.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	endConn = Services.UserInputService.InputEnded:Connect(function(input)
		if not host.Parent then endConn:Disconnect() return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)

	local ColorPicker = {}
	ColorPicker.new = function()
		local newMt = setmetatable({}, {})

		local pickerGui = picker.ColorPicker
		local pickerTopBar = pickerGui.TopBar
		local pickerExit = pickerTopBar.Exit
		local pickerFrame = pickerGui.Content
		local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
		local colorStrip = pickerFrame.ColorStrip
		local previewFrame = pickerFrame.Preview
		local basicColorsFrame = pickerFrame.BasicColors
		local customColorsFrame = pickerFrame.CustomColors
		local defaultButton = pickerFrame.Default
		local cancelButton = pickerFrame.Cancel
		
		local shade1Button = pickerFrame:FindFirstChild("Shade1")
		local shade2Button = pickerFrame:FindFirstChild("Shade2")
		local shade3Button = pickerFrame:FindFirstChild("Shade3")
		local text1Button = pickerFrame:FindFirstChild("Text1")
		local text2Button = pickerFrame:FindFirstChild("Text2")
		local scrollButton = pickerFrame:FindFirstChild("Scroll")

		if shade1Button then shade1Button:Destroy() end
		if shade2Button then shade2Button:Destroy() end
		if shade3Button then shade3Button:Destroy() end
		if text1Button then text1Button:Destroy() end
		if text2Button then text2Button:Destroy() end
		if scrollButton then scrollButton:Destroy() end

		local colorScope = colorSpace.Scope
		local colorArrow = pickerFrame.ArrowFrame.Arrow

		do
			local T = Configuration.Theme
			local keepAsIs = { colorSpace, colorStrip, previewFrame }
			local function untouchable(o)
				for _, k in ipairs(keepAsIs) do
					if o == k or o:IsDescendantOf(k) then return true end
				end
				return false
			end
			local function shadeFor(c)
				local h, s, v = c:ToHSV()
				if s > 0.2 then return nil end
				if v < 0.16 then return T.Surface end
				if v < 0.3 then return T.Main end
				if v < 0.55 then return T.Input end
				return nil
			end
			local function recolor(o)
				if untouchable(o) then return end
				if o:IsA("GuiObject") then
					if o.BackgroundTransparency < 1 then
						local c = shadeFor(o.BackgroundColor3)
						if c then o.BackgroundColor3 = c end
					end
					o.BorderColor3 = T.Border
					if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then
						local _, s = o.TextColor3:ToHSV()
						if s < 0.2 then o.TextColor3 = T.Text end
						o.Font = Enum.Font.SourceSans
						if o:IsA("TextBox") then
							o.PlaceholderColor3 = T.Dim
							o.BackgroundColor3 = T.Input
						end
					end
				elseif o:IsA("UIStroke") then
					o.Color = T.Border
				end
			end
			recolor(pickerGui)
			for _, d in ipairs(pickerGui:GetDescendants()) do recolor(d) end
			pickerTopBar.BackgroundColor3 = T.Header
			pickerTopBar.BackgroundTransparency = 0
			pickerFrame.BackgroundColor3 = T.Main
		end

		local hueInput = pickerFrame.Hue.Input
		local satInput = pickerFrame.Sat.Input
		local valInput = pickerFrame.Val.Input

		local redInput = pickerFrame.Red.Input
		local greenInput = pickerFrame.Green.Input
		local blueInput = pickerFrame.Blue.Input

		local mouse = Services.UserInputService

		local hue, sat, val = initial:ToHSV()
		local red, green, blue = initial.R, initial.G, initial.B
		local chosenColor = initial

		local basicColors = {
			Color3.new(0, 0, 0), Color3.new(0.66666668653488, 0, 0), Color3.new(0, 0.33333334326744, 0), Color3.new(0.66666668653488, 0.33333334326744, 0), Color3.new(0, 0.66666668653488, 0), Color3.new(0.66666668653488, 0.66666668653488, 0), Color3.new(0, 1, 0), Color3.new(0.66666668653488, 1, 0), Color3.new(0, 0, 0.49803924560547), Color3.new(0.66666668653488, 0, 0.49803924560547), Color3.new(0, 0.33333334326744, 0.49803924560547), Color3.new(0.66666668653488, 0.33333334326744, 0.49803924560547), Color3.new(0, 0.66666668653488, 0.49803924560547), Color3.new(0.66666668653488, 0.66666668653488, 0.49803924560547), Color3.new(0, 1, 0.49803924560547), Color3.new(0.66666668653488, 1, 0.49803924560547), Color3.new(0, 0, 1), Color3.new(0.66666668653488, 0, 1), Color3.new(0, 0.33333334326744, 1), Color3.new(0.66666668653488, 0.33333334326744, 1), Color3.new(0, 0.66666668653488, 1), Color3.new(0.66666668653488, 0.66666668653488, 1), Color3.new(0, 1, 1), Color3.new(0.66666668653488, 1, 1), Color3.new(0.33333334326744, 0, 0), Color3.new(1, 0, 0), Color3.new(0.33333334326744, 0.33333334326744, 0), Color3.new(1, 0.33333334326744, 0), Color3.new(0.33333334326744, 0.66666668653488, 0), Color3.new(1, 0.66666668653488, 0), Color3.new(0.33333334326744, 1, 0), Color3.new(1, 1, 0), Color3.new(0.33333334326744, 0, 0.49803924560547), Color3.new(1, 0, 0.49803924560547), Color3.new(0.33333334326744, 0.33333334326744, 0.49803924560547), Color3.new(1, 0.33333334326744, 0.49803924560547), Color3.new(0.33333334326744, 0.66666668653488, 0.49803924560547), Color3.new(1, 0.66666668653488, 0.49803924560547), Color3.new(0.33333334326744, 1, 0.49803924560547), Color3.new(1, 1, 0.49803924560547), Color3.new(0.33333334326744, 0, 1), Color3.new(1, 0, 1), Color3.new(0.33333334326744, 0.33333334326744, 1), Color3.new(1, 0.33333334326744, 1), Color3.new(0.33333334326744, 0.66666668653488, 1), Color3.new(1, 0.66666668653488, 1), Color3.new(0.33333334326744, 1, 1), Color3.new(1, 1, 1)
		}
		local customColors = {}

		local function spaceSize()
			local s = colorSpace.AbsoluteSize
			return (s.X > 1 and s.X - 1 or 219), (s.Y > 1 and s.Y - 1 or 199)
		end
		local function stripHeight()
			local s = colorStrip.AbsoluteSize
			return s.Y > 1 and s.Y - 1 or 199
		end

		local function updateColor(noupdate)
			local sw, sh = spaceSize()
			local relativeX, relativeY, relativeStripY = sw - hue * sw, sh - sat * sh, stripHeight() * (1 - val)
			local hsvColor = Color3.fromHSV(hue, sat, val)

			if noupdate == 2 or not noupdate then
				hueInput.Text = tostring(math.floor(359 * hue + 0.5))
				satInput.Text = tostring(math.floor(255 * sat + 0.5))
				valInput.Text = tostring(math.floor(255 * val + 0.5))
			end
			if noupdate == 1 or not noupdate then
				redInput.Text = tostring(math.floor(255 * red + 0.5))
				greenInput.Text = tostring(math.floor(255 * green + 0.5))
				blueInput.Text = tostring(math.floor(255 * blue + 0.5))
			end

			chosenColor = Color3.new(red, green, blue)

			local so = colorScope.Parent and (colorSpace.AbsolutePosition - colorScope.Parent.AbsolutePosition) or Vector2.zero
			colorScope.AnchorPoint = Vector2.new(0.5, 0.5)
			colorScope.Position = UDim2.fromOffset(so.X + relativeX, so.Y + relativeY)
			colorStrip.ImageColor3 = Color3.fromHSV(hue, sat, 1)
			local ao = colorArrow.Parent and (colorStrip.AbsolutePosition - colorArrow.Parent.AbsolutePosition) or Vector2.zero
			colorArrow.AnchorPoint = Vector2.new(colorArrow.AnchorPoint.X, 0.5)
			colorArrow.Position = UDim2.new(colorArrow.Position.X.Scale, colorArrow.Position.X.Offset, 0, ao.Y + relativeStripY)
			previewFrame.BackgroundColor3 = chosenColor

			newMt.Color = chosenColor
			if newMt.Changed then newMt:Changed(chosenColor) end
			if newMt.Live then newMt.Live(chosenColor) end
		end

		local function colorSpaceInput()
			local m = K.mouseAbs()
			local sw, sh = spaceSize()
			local relativeX = math.clamp(m.X - colorSpace.AbsolutePosition.X, 0, sw)
			local relativeY = math.clamp(m.Y - colorSpace.AbsolutePosition.Y, 0, sh)

			hue = (sw - relativeX) / sw
			sat = (sh - relativeY) / sh

			local hsvColor = Color3.fromHSV(hue, sat, val)
			red, green, blue = hsvColor.r, hsvColor.g, hsvColor.b

			updateColor()
		end

		local function colorStripInput()
			local m = K.mouseAbs()
			local h = stripHeight()
			local relativeY = math.clamp(m.Y - colorStrip.AbsolutePosition.Y, 0, h)

			val = (h - relativeY) / h

			local hsvColor = Color3.fromHSV(hue, sat, val)
			red, green, blue = hsvColor.r, hsvColor.g, hsvColor.b

			updateColor()
		end

		local function hookButtons(frame, func)
			frame.ArrowFrame.Up.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					frame.ArrowFrame.Up.BackgroundTransparency = 0.5
				elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
					local releaseEvent, runEvent
					local startTime = tick()
					local pressing = true
					local startNum = tonumber(frame.Text)

					if not startNum then return end

					releaseEvent = mouse.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
						releaseEvent:Disconnect()
						pressing = false
					end)

					startNum = startNum + 1
					func(startNum)
					while pressing do
						if tick() - startTime > 0.3 then
							startNum = startNum + 1
							func(startNum)
						end
						wait(0.1)
					end
				end
			end)

			frame.ArrowFrame.Up.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					frame.ArrowFrame.Up.BackgroundTransparency = 1
				end
			end)

			frame.ArrowFrame.Down.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					frame.ArrowFrame.Down.BackgroundTransparency = 0.5
				elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
					local releaseEvent, runEvent
					local startTime = tick()
					local pressing = true
					local startNum = tonumber(frame.Text)

					if not startNum then return end

					releaseEvent = mouse.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
						releaseEvent:Disconnect()
						pressing = false
					end)

					startNum = startNum - 1
					func(startNum)
					while pressing do
						if tick() - startTime > 0.3 then
							startNum = startNum - 1
							func(startNum)
						end
						wait(0.1)
					end
				end
			end)

			frame.ArrowFrame.Down.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					frame.ArrowFrame.Down.BackgroundTransparency = 1
				end
			end)
		end

		local dragging
		local function over(gui, p, pad)
			local a, s = gui.AbsolutePosition, gui.AbsoluteSize
			pad = pad or 0
			return p.X >= a.X - pad and p.X <= a.X + s.X + pad and p.Y >= a.Y - pad and p.Y <= a.Y + s.Y + pad
		end
		local function pressed(input)
			return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
		end

		local beganConn = mouse.InputBegan:Connect(function(input)
			if not pressed(input) or not pickerGui.Visible then return end
			local p = K.mouseAbs()
			if over(colorSpace, p, 2) then
				dragging = colorSpaceInput
			elseif over(colorStrip, p, 4) or over(pickerFrame.ArrowFrame, p, 2) then
				dragging = colorStripInput
			end
			if dragging then dragging() end
		end)
		local endedConn = mouse.InputEnded:Connect(function(input)
			if pressed(input) then dragging = nil end
		end)
		local stepConn = Services.RunService.RenderStepped:Connect(function()
			if dragging then dragging() end
		end)
		host.Destroying:Connect(function()
			beganConn:Disconnect()
			endedConn:Disconnect()
			stepConn:Disconnect()
		end)

		local function updateHue(str)
			local num = tonumber(str)
			if num then
				hue = math.clamp(math.floor(num), 0, 359) / 359
				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.r, hsvColor.g, hsvColor.b
				hueInput.Text = tostring(math.floor(hue * 359 + 0.5))
				updateColor(1)
			end
		end
		hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput, updateHue)

		local function updateSat(str)
			local num = tonumber(str)
			if num then
				sat = math.clamp(math.floor(num), 0, 255) / 255
				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.r, hsvColor.g, hsvColor.b
				satInput.Text = tostring(math.floor(sat * 255 + 0.5))
				updateColor(1)
			end
		end
		satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput, updateSat)

		local function updateVal(str)
			local num = tonumber(str)
			if num then
				val = math.clamp(math.floor(num), 0, 255) / 255
				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.r, hsvColor.g, hsvColor.b
				valInput.Text = tostring(math.floor(val * 255 + 0.5))
				updateColor(1)
			end
		end
		valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput, updateVal)

		local function updateRed(str)
			local num = tonumber(str)
			if num then
				red = math.clamp(math.floor(num), 0, 255) / 255
				local newColor = Color3.new(red, green, blue)
				hue, sat, val = Color3.toHSV(newColor)
				redInput.Text = tostring(math.floor(red * 255 + 0.5))
				updateColor(2)
			end
		end
		redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput, updateRed)

		local function updateGreen(str)
			local num = tonumber(str)
			if num then
				green = math.clamp(math.floor(num), 0, 255) / 255
				local newColor = Color3.new(red, green, blue)
				hue, sat, val = Color3.toHSV(newColor)
				greenInput.Text = tostring(math.floor(green * 255 + 0.5))
				updateColor(2)
			end
		end
		greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput, updateGreen)

		local function updateBlue(str)
			local num = tonumber(str)
			if num then
				blue = math.clamp(math.floor(num), 0, 255) / 255
				local newColor = Color3.new(red, green, blue)
				hue, sat, val = Color3.toHSV(newColor)
				blueInput.Text = tostring(math.floor(blue * 255 + 0.5))
				updateColor(2)
			end
		end
		blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput, updateBlue)

		local colorChoice = Instance.new("TextButton")
		colorChoice.Name = "choice"
		colorChoice.Size = UDim2.new(0, 25, 0, 18)
		colorChoice.BorderColor3 = Color3.new(96 / 255, 96 / 255, 96 / 255)
		colorChoice.Text = ""
		colorChoice.AutoButtonColor = false
		colorChoice.ZIndex = 10

		local COLS = 8
		local function cellW(frame)
			local w = frame.AbsoluteSize.X
			return (w > 40) and math.floor(w / COLS) or 30
		end
		local bw = cellW(basicColorsFrame)
		colorChoice.Size = UDim2.new(0, bw - 5, 0, 18)
		colorChoice.BorderSizePixel = 0
		local row = 0
		local column = 0
		for i = 0, #basicColors - 1 do
			local v = basicColors[i + 1]
			local newColor = colorChoice:Clone()
			newColor.BackgroundColor3 = v
			newColor.Position = UDim2.new(0, 1 + bw * column, 0, 21 + 23 * row)

			newColor.MouseButton1Click:Connect(function()
				red, green, blue = v.r, v.g, v.b
				local newColor = Color3.new(red, green, blue)
				hue, sat, val = Color3.toHSV(newColor)
				updateColor()
			end)

			newColor.Parent = basicColorsFrame
			column = column + 1
			if column == COLS then row = row + 1 column = 0 end
		end

		row = 0
		column = 0
		local cw = cellW(customColorsFrame)
		for i = 1, 16 do
			local color = customColors[i] or Color3.new(1, 1, 1)
			local newColor = colorChoice:Clone()
			newColor.Size = UDim2.new(0, cw - 5, 0, 18)
			newColor.BackgroundColor3 = color
			newColor.Position = UDim2.new(0, 1 + cw * column, 0, 20 + 23 * row)

			newColor.MouseButton1Click:Connect(function()
				local curColor = customColors[i] or Color3.new(1, 1, 1)
				red, green, blue = curColor.r, curColor.g, curColor.b
				hue, sat, val = Color3.toHSV(curColor)
				updateColor()
			end)

			newColor.MouseButton2Click:Connect(function()
				customColors[i] = chosenColor
				newColor.BackgroundColor3 = chosenColor
			end)

			newColor.Parent = customColorsFrame
			column = column + 1
			if column == COLS then row = row + 1 column = 0 end
		end

		local hexLabel = Instance.new("TextLabel")
		hexLabel.BackgroundTransparency = 1
		hexLabel.Size = UDim2.fromOffset(34, 20)
		hexLabel.Position = UDim2.new(previewFrame.Position.X.Scale, previewFrame.Position.X.Offset,
			previewFrame.Position.Y.Scale, previewFrame.Position.Y.Offset + previewFrame.Size.Y.Offset + 6)
		hexLabel.Font = Enum.Font.SourceSans
		hexLabel.TextSize = 14
		hexLabel.TextColor3 = Configuration.Theme.Text
		hexLabel.TextXAlignment = Enum.TextXAlignment.Left
		hexLabel.Text = "Hex:"
		hexLabel.ZIndex = 10
		hexLabel.Parent = pickerFrame
		local hexBox = Instance.new("TextBox")
		hexBox.Size = UDim2.fromOffset(90, 20)
		hexBox.Position = hexLabel.Position + UDim2.fromOffset(36, 0)
		hexBox.BackgroundColor3 = Configuration.Theme.Input
		hexBox.BorderSizePixel = 0
		hexBox.Font = Enum.Font.SourceSans
		hexBox.TextSize = 14
		hexBox.TextColor3 = Configuration.Theme.Text
		hexBox.TextXAlignment = Enum.TextXAlignment.Left
		hexBox.ClearTextOnFocus = false
		hexBox.ZIndex = 10
		new("UIPadding", { PaddingLeft = UDim.new(0, 4) }, hexBox)
		stroke(hexBox, Configuration.Theme.Border)
		hexBox.Parent = pickerFrame
		local function syncHex()
			if not hexBox:IsFocused() then hexBox.Text = "#" .. chosenColor:ToHex():lower() end
		end
		local prevChanged = newMt.Changed
		newMt.Changed = function(self, c)
			syncHex()
			if prevChanged then prevChanged(self, c) end
		end
		hexBox.FocusLost:Connect(function()
			local h = hexBox.Text:gsub("[^%x]", "")
			if #h == 3 then h = h:sub(1, 1):rep(2) .. h:sub(2, 2):rep(2) .. h:sub(3, 3):rep(2) end
			local ok, c = pcall(Color3.fromHex, h)
			if #h == 6 and ok and c then
				red, green, blue = c.R, c.G, c.B
				hue, sat, val = c:ToHSV()
				updateColor()
			end
			syncHex()
		end)

		cancelButton.MouseButton1Click:Connect(function() if newMt.Cancel then newMt:Cancel() end end)
		defaultButton.MouseButton1Click:Connect(function() if newMt.Default then newMt:Default() end end)

		local applyBtn = Instance.new("TextButton")
		applyBtn.Name = "apply"
		applyBtn.Size = UDim2.new(0, 60, 0, 20)
		applyBtn.Position = UDim2.new(1, -70, 1, -25)
		applyBtn.BackgroundColor3 = Configuration.Theme.Accent
		applyBtn.BorderSizePixel = 0
		applyBtn.Font = Enum.Font.SourceSansBold
		applyBtn.TextSize = 14
		applyBtn.TextColor3 = Configuration.Theme.AccentText
		applyBtn.Text = "OK"
		applyBtn.AutoButtonColor = false
		applyBtn.ZIndex = 10
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, applyBtn)
		local function accentify(btn)
			if not (btn and btn:IsA("GuiButton")) then return end
			btn.BackgroundColor3 = Configuration.Theme.Accent
			btn.BackgroundTransparency = 0
			btn.BorderSizePixel = 0
			btn.AutoButtonColor = false
			if btn:IsA("TextButton") then
				btn.Font = Enum.Font.SourceSansBold
				btn.TextColor3 = Configuration.Theme.AccentText
			end
			for _, d in ipairs(btn:GetDescendants()) do
				if d:IsA("UIStroke") then d.Transparency = 1 end
				if d:IsA("TextLabel") then d.Font = Enum.Font.SourceSansBold; d.TextColor3 = Configuration.Theme.AccentText end
			end
			if not btn:FindFirstChildOfClass("UICorner") then new("UICorner", { CornerRadius = UDim.new(0, 4) }, btn) end
			btn.MouseEnter:Connect(function() btn.BackgroundColor3 = K.accentShade("hover") end)
			btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Configuration.Theme.Accent end)
			btn.MouseButton1Down:Connect(function() btn.BackgroundColor3 = K.accentShade("down") end)
			btn.MouseButton1Up:Connect(function() btn.BackgroundColor3 = K.accentShade("hover") end)
		end
		accentify(applyBtn)
		accentify(cancelButton)
		accentify(defaultButton)
		applyBtn.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor, nil) end end)
		applyBtn.Parent = pickerFrame
		
		if cancelButton then
			cancelButton.Size = UDim2.new(0, 60, 0, 20)
			cancelButton.Position = UDim2.new(1, -140, 1, -25)
		end
		if defaultButton then
			defaultButton.Size = UDim2.new(0, 60, 0, 20)
			defaultButton.Position = UDim2.new(1, -210, 1, -25)
		end

		pickerExit.MouseButton1Click:Connect(closePicker)

		updateColor()
		syncHex()
		return newMt
	end

	local Npicker = ColorPicker.new()
	if preview then Npicker.Live = function(c) pcall(preview, c) end end
	Npicker.Confirm = function(self, color, ctype)
		confirmed = true
		if callback then callback(color) end
		closePicker()
	end
	Npicker.Cancel = function(self) closePicker() end
	Npicker.Default = function(self)
		if callback then callback(Color3.fromRGB(36, 36, 36)) end
	end
end

K.Api = { props = nil, cache = {}, known = nil }
do
	local Http = game:GetService("HttpService")
	local CACHE = "LX/api_props.json"
	local API_URL = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/Mini-API-Dump.json"
	local function httpGet(url)
		local ok, res = pcall(function() return game:HttpGet(url) end)
		if ok and type(res) == "string" and #res > 0 then return res end
		return nil
	end
	task.spawn(function()
		wait(2)
		local data
		if isfile(CACHE) then
			local ok, body = pcall(readfile, CACHE)
			if ok and type(body) == "string" then
				local okD, d = pcall(Http.JSONDecode, Http, body)
				if okD and type(d) == "table" and d.v == 1 and type(d.classes) == "table" then data = d.classes end
			end
		end
		if not data then
			local raw = httpGet(API_URL)
			if not raw then return end
			local okD, dump = pcall(Http.JSONDecode, Http, raw)
			raw = nil
			if not okD or type(dump) ~= "table" or type(dump.Classes) ~= "table" then return end
			data = {}
			local skip = { Hidden = true, Deprecated = true, NotScriptable = true, NotBrowsable = true }
			for i, c in ipairs(dump.Classes) do
				local list = {}
				for _, m in ipairs(c.Members or {}) do
					if m.MemberType == "Property" then
						local bad = false
						for _, t in ipairs(m.Tags or {}) do
							if type(t) == "string" and skip[t] then bad = true break end
						end
						local sec = m.Security
						local r = type(sec) == "table" and sec.Read or sec
						if not bad and (r == nil or r == "None") then list[#list + 1] = m.Name end
					end
				end
				data[c.Name] = { s = c.Superclass, p = list }
				if i % 120 == 0 then wait() end
			end
			dump = nil
			if not isfolder("LX") then makefolder("LX") end
			local okE, json = pcall(Http.JSONEncode, Http, { v = 1, classes = data })
			if okE then pcall(writefile, CACHE, json) end
		end
		K.Api.props = data
		table.clear(K.Api.cache)
		if State.selected then pcall(renderProps) end
	end)
end
function K.extraProps(inst)
	local data = K.Api.props
	if not data then return nil end
	if not K.Api.known then
		K.Api.known = {}
		for _, cat in ipairs(K.PROPERTY_LIST) do
			for _, n in ipairs(cat[2]) do K.Api.known[n] = true end
		end
	end
	local cls = inst.ClassName
	local cached = K.Api.cache[cls]
	if cached then return cached end
	local out, seen, guard = {}, {}, 0
	local cur = cls
	while cur and data[cur] and guard < 40 do
		for _, n in ipairs(data[cur].p) do
			if not K.Api.known[n] and not seen[n] then seen[n] = true; out[#out + 1] = n end
		end
		cur = data[cur].s
		guard += 1
	end
	table.sort(out)
	K.Api.cache[cls] = out
	return out
end

local function clearProps()
	for _, c in ipairs(State.propConns) do
		if type(c) == "RBXScriptConnection" then c:Disconnect() end
	end
	table.clear(State.propConns)
	for _, r in ipairs(State.propRows) do r:Destroy() end
	table.clear(State.propRows)
	closeEditBox()
end

renderProps = function()
	if State.editingInst then return end
	clearProps()
	local inst = State.selected
	if not inst then UI.props.CanvasSize = UDim2.new(); return end
	local needle = UI.propsFilter.Text:lower()
	local y = 0
	local cats = K.PROPERTY_LIST
	local extra = K.extraProps(inst)
	if extra and #extra > 0 then
		cats = table.clone(K.PROPERTY_LIST)
		cats[#cats + 1] = { "Other", extra }
	end
	do
		local okA, attrs = pcall(inst.GetAttributes, inst)
		if okA and type(attrs) == "table" and next(attrs) then
			local names = {}
			for k in pairs(attrs) do names[#names + 1] = "@" .. tostring(k) end
			table.sort(names)
			if cats == K.PROPERTY_LIST then cats = table.clone(K.PROPERTY_LIST) end
			cats[#cats + 1] = { "Attributes", names }
		end
	end
	for _, cat in ipairs(cats) do
		local entries = {}
		for _, pname in ipairs(cat[2]) do
			if K.allowProperty(pname) and (needle == "" or pname:lower():find(needle, 1, true)) then
				local ok, val = pcall(K.pget, inst, pname)
				if ok and (K.isAttr(pname) or (typeof(val) ~= "RBXScriptSignal" and typeof(val) ~= "function")) then
					table.insert(entries, { pname, val })
				end
			end
		end
		if #entries > 0 then
			local catName = cat[1]
			local collapsed = State.collapsedCats[catName] and needle == ""
			local header = new("TextButton", {
				Size = UDim2.new(1, 0, 0, K.ROW_HEIGHT), Position = UDim2.fromOffset(0, y),
				BackgroundColor3 = Configuration.Theme.Header, BorderSizePixel = 0, Text = "", AutoButtonColor = false,
			}, UI.props)
			new("TextLabel", {
				BackgroundTransparency = 1, Position = UDim2.fromOffset(22, 0), Size = UDim2.new(1, -26, 1, 0),
				Font = Enum.Font.SourceSansBold, TextSize = 14, TextColor3 = Configuration.Theme.Text, Text = catName,
				TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 2,
			}, header)
			local hArrow = uiImage({
				Size = UDim2.fromOffset(16, 16), Position = UDim2.fromOffset(4, (K.ROW_HEIGHT - 16) / 2),
				ZIndex = 3,
			}, header, "arrow_right", Configuration.Theme.Text)
			hArrow.Image = UIIcon[collapsed and "arrow_right" or "arrow_down"] or ""
			new("Frame", {
				Name = "catbar", Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = Color3.fromRGB(18, 18, 18), BorderSizePixel = 0, ZIndex = 3,
			}, header)
			header.MouseEnter:Connect(function() header.BackgroundColor3 = Configuration.Theme.Panel end)
			header.MouseLeave:Connect(function() header.BackgroundColor3 = Configuration.Theme.Header end)
			header.MouseButton1Click:Connect(function()
				State.collapsedCats[catName] = not State.collapsedCats[catName] or nil
				local keep = UI.props.CanvasPosition
				renderProps()
				UI.props.CanvasPosition = keep
			end)
			table.insert(State.propRows, header)
			y += K.ROW_HEIGHT
			if not collapsed or needle ~= "" then
				for _, e in ipairs(entries) do
					local pname, val = e[1], e[2]
					local readOnly = false
					if pname == "ClassName" then
						readOnly = true
					elseif not K.isAttr(pname) then
						readOnly = not pcall(K.pset, inst, pname, val)
					end
					local GREY = Color3.fromRGB(110, 110, 110)
					local row = new("Frame", {
						Size = UDim2.new(1, 0, 0, K.ROW_HEIGHT), Position = UDim2.fromOffset(0, y),
						BackgroundTransparency = 1,
					}, UI.props)
					table.insert(State.propRows, row)
					new("TextLabel", {
						BackgroundTransparency = 1, Size = UDim2.new(0.45, -16, 1, 0),
						Position = UDim2.fromOffset(16, 0), Font = Enum.Font.SourceSans, TextSize = 14,
						TextColor3 = readOnly and GREY or Configuration.Theme.PropName, Text = K.isAttr(pname) and pname:sub(2) or pname,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
					}, row)
					new("Frame", {
						Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(0.45, 0, 0, 0),
						BackgroundColor3 = Configuration.Theme.Border, BorderSizePixel = 0,
					}, row)
					local valueLabel = new("TextButton", {
						BackgroundTransparency = 1, Size = UDim2.new(0.55, -24, 1, 0),
						Position = UDim2.new(0.45, 8, 0, 0), Font = Enum.Font.SourceSans, TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						AutoButtonColor = false,
					}, row)
					local function setVal(v)
						local text, color = fmt(v)
						valueLabel.Text = text
						valueLabel.TextColor3 = readOnly and GREY or color
						if typeof(v) == "Color3" then
							valueLabel.Text = "      " .. text
							local sw = row:FindFirstChild("swatch") or new("Frame", {
								Name = "swatch", Size = UDim2.fromOffset(12, 12),
								Position = UDim2.new(0.45, 8, 0, 4), BorderSizePixel = 0,
								BackgroundColor3 = v,
							}, row)
							sw.BackgroundColor3 = v
						end
					end
					setVal(val)
					local vt = typeof(val)
					if readOnly then
						valueLabel.Active = false
					elseif vt == "boolean" then
						valueLabel.MouseButton1Click:Connect(function()
							pcall(function() K.pset(inst, pname, not K.pget(inst, pname)) end)
							renderProps()
						end)
					elseif vt == "Color3" then
						valueLabel.MouseButton1Click:Connect(function()
							openColorPicker(K.pget(inst, pname), function(c)
								pcall(K.pset, inst, pname, c)
								renderProps()
							end, function(c)
								pcall(K.pset, inst, pname, c)
							end)
						end)
					elseif vt == "number" or vt == "string" or vt == "Vector3" or vt == "Vector2" or vt == "EnumItem"
						or vt == "UDim2" or vt == "UDim" or vt == "Rect" or vt == "NumberRange" or vt == "CFrame"
						or vt == "BrickColor" or vt == "NumberSequence" or vt == "PhysicalProperties" or vt == "Font"
						or vt == "Vector3int16" or vt == "Vector2int16" or vt == "Content" then
						valueLabel.MouseButton1Click:Connect(function()
							beginPropEdit(inst, pname, val, row, valueLabel)
						end)
					end
					local ok, sig
					if K.isAttr(pname) then
						ok, sig = pcall(inst.GetAttributeChangedSignal, inst, pname:sub(2))
					else
						ok, sig = pcall(inst.GetPropertyChangedSignal, inst, pname)
					end
					if ok and sig then
						table.insert(State.propConns, sig:Connect(function()
							if State.editingInst == inst and State.editingProp == pname then return end
							local ok2, nv = pcall(K.pget, inst, pname)
							if ok2 then setVal(nv) end
						end))
					end
					new("Frame", {
						Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, -1),
						BackgroundColor3 = Configuration.Theme.Border, BackgroundTransparency = 0.4,
						BorderSizePixel = 0,
					}, row)
					y += K.ROW_HEIGHT
				end
			end
		end
	end
	do
		local okA, now = pcall(inst.GetAttributes, inst)
		local have = okA and type(now) == "table" and now or {}
		local okS, sig = pcall(function() return inst.AttributeChanged end)
		if okS and sig then
			table.insert(State.propConns, sig:Connect(function(k)
				local okV, v = pcall(inst.GetAttribute, inst, k)
				local exists = okV and v ~= nil
				if exists ~= (have[k] ~= nil) and State.selected == inst then
					task.defer(function()
						if State.selected ~= inst then return end
						local keep = UI.props.CanvasPosition
						renderProps()
						UI.props.CanvasPosition = keep
					end)
				end
			end))
		end
	end
	UI.props.CanvasSize = UDim2.fromOffset(0, y)
end

UI.propsFilter:GetPropertyChangedSignal("Text"):Connect(renderProps)

UI.explorerFilter:GetPropertyChangedSignal("Text"):Connect(function()
	State.searchToken += 1
	local t = State.searchToken
	delay(0.12, function()
		if t ~= State.searchToken then return end
		local was = State.filterText
		State.filterText = UI.explorerFilter.Text
		State.dirty = true
		UI.tree.CanvasPosition = Vector2.zero
		if was ~= "" and State.filterText == "" and Options.ExpandOnSelect and State.selected and State.selected.Parent then
			local p = State.selected.Parent
			while p and p ~= game do State.expanded[p] = true; p = p.Parent end
			rebuildFlat(); State.dirty = false
			local idx = indexInFlat(State.selected)
			if idx then
				local viewH = UI.tree.AbsoluteSize.Y
				UI.tree.CanvasPosition = Vector2.new(0, math.max(0, (idx - 1) * K.ROW_HEIGHT - viewH / 2))
			end
		end
		renderTree()
	end)
end)

Services.RunService.Heartbeat:Connect(function(dt)
	State.acc += dt
	if StudioIcons.changed then StudioIcons.changed = false; State.pending = true end
	if State.pending and State.acc > 0.25 and UI.gui.Enabled then
		State.acc, State.pending = 0, false
		renderTree()
	end
end)

local function trackTouch(i)
	if i.UserInputType == Enum.UserInputType.Touch then
		local inset = Services.GuiService:GetGuiInset()
		State.touchPoint = Vector2.new(i.Position.X, i.Position.Y) + inset
		return true
	end
	if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.MouseButton2 then
		State.touchActive = false
	end
	return false
end
Services.UserInputService.InputBegan:Connect(function(i) if trackTouch(i) then State.touchActive = true end end)
Services.UserInputService.InputChanged:Connect(function(i) if trackTouch(i) then State.touchActive = true end end)
Services.UserInputService.TouchStarted:Connect(function(i) if trackTouch(i) then State.touchActive = true end end)
Services.UserInputService.TouchMoved:Connect(function(i) trackTouch(i) end)

local function uiK() return (Delve_Scale and Delve_Scale.Scale) or 1 end
local function absToLocal(v) return (v - UI.gui.AbsolutePosition) / uiK() end
mousePos = function()
	if State.touchActive and State.touchPoint then
		return absToLocal(State.touchPoint)
	end
	return absToLocal(K.mouseAbs())
end

local function isMouse(i)
	return i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch
end
local function isMove(i)
	return i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch
end
local function inside(frame, p)
	local o = frame
	while o and o ~= UI.gui do
		if o:IsA("GuiObject") and not o.Visible then return false end
		o = o.Parent
	end
	local a, s = absToLocal(frame.AbsolutePosition), frame.AbsoluteSize / uiK()
	return p.X >= a.X and p.X <= a.X + s.X and p.Y >= a.Y and p.Y <= a.Y + s.Y
end
K.hot = setmetatable({}, { __mode = "k" })
local function watchHover(f)
	if not f or K.hot[f] ~= nil then return end
	K.hot[f] = false
	f.MouseEnter:Connect(function() K.hot[f] = true end)
	f.MouseLeave:Connect(function() K.hot[f] = false end)
	f:GetPropertyChangedSignal("Visible"):Connect(function() if not f.Visible then K.hot[f] = false end end)
end
local function over(f, p)
	if not f then return false end
	watchHover(f)
	if K.hot[f] and f.Visible then return true end
	if not inside(f, p) then
		local a, s = absToLocal(f.AbsolutePosition), f.AbsoluteSize / uiK()
		local pad = 4
		if not f.Visible or p.X < a.X - pad or p.X > a.X + s.X + pad or p.Y < a.Y - pad or p.Y > a.Y + s.Y + pad then return false end
	end
	return true
end
local function screenSize()
	local s = UI.gui.AbsoluteSize / (Delve_Scale and Delve_Scale.Scale or 1)
	if s.X > 0 and s.Y > 0 then return s end
	local cam = workspace.CurrentCamera
	return cam and cam.ViewportSize or Vector2.new(1280, 720)
end

local function notify(msg)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = "LX", Text = tostring(msg), Duration = 4 })
	end)
end

local Grid = { items = {}, folder = nil, filter = "" }
K.GRID_TILE_W, K.GRID_TILE_H = 72, Delve_IsMobile and 80 or 72
K.GRID_GAP, K.GRID_PAD = 6, 6
K.GRID_CRUMB_H = touchH(24)
State.gridView = false
State.gridDirty = true

UI.grid = new("Frame", {
	Name = "grid", BackgroundTransparency = 1, Visible = false,
	Position = UDim2.fromOffset(0, K.TITLE_H), Size = UDim2.new(1, 0, 1, -K.TITLE_H),
}, UI.explorerPane)
local gridSearchBar, gridSearch = filterBox(UI.grid, 0, "Search this folder", {})
UI.gridSearch = gridSearch
UI.gridSearchBar = gridSearchBar

UI.gridCrumbBar = new("Frame", {
	Name = "path", BackgroundColor3 = Configuration.Theme.Main, BorderSizePixel = 0,
	Position = UDim2.fromOffset(0, K.FILTER_H), Size = UDim2.new(1, 0, 0, K.GRID_CRUMB_H),
}, UI.grid)
UI.gridUp = new("TextButton", {
	Name = "Up", BackgroundColor3 = Configuration.Theme.Hover, BackgroundTransparency = 1, BorderSizePixel = 0,
	AutoButtonColor = false, Size = UDim2.fromOffset(K.GRID_CRUMB_H, K.GRID_CRUMB_H), Text = "^",
	Font = Enum.Font.SourceSansBold, TextSize = 15, TextColor3 = Configuration.Theme.Text, ZIndex = 2,
}, UI.gridCrumbBar)
UI.gridCrumbs = new("ScrollingFrame", {
	Name = "crumbs", BackgroundTransparency = 1, BorderSizePixel = 0,
	Position = UDim2.fromOffset(K.GRID_CRUMB_H, 0), Size = UDim2.new(1, -K.GRID_CRUMB_H, 1, 0),
	CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.X,
	ScrollingDirection = Enum.ScrollingDirection.X, ScrollBarThickness = 0, ZIndex = 2,
}, UI.gridCrumbBar)
new("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center,
	Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder,
}, UI.gridCrumbs)

UI.gridScroll = scroller(UI.grid)
UI.gridScroll.Position = UDim2.fromOffset(0, K.FILTER_H + K.GRID_CRUMB_H)
UI.gridScroll.Size = UDim2.new(1, 0, 1, -(K.FILTER_H + K.GRID_CRUMB_H))

local function gridSource()
	local folder = Grid.folder
	if folder and folder.Parent == nil then
		Grid.folder = nil
		folder = nil
	end
	local list = folder and Cache.getChildren(folder) or topLevel()
	if Grid.filter == "" then return list end
	local out, needle = {}, Grid.filter:lower()
	for _, inst in ipairs(list) do
		local ok, name, cls = pcall(function() return inst.Name, inst.ClassName end)
		if ok and (name:lower():find(needle, 1, true) or cls:lower():find(needle, 1, true)) then
			out[#out + 1] = inst
		end
	end
	return out
end

local function gridGoTo(folder)
	Grid.folder = folder
	Grid.filter = ""
	UI.gridSearch.Text = ""
	State.gridDirty = true
	UI.gridScroll.CanvasPosition = Vector2.zero
	if UI.renderGrid then UI.renderGrid() end
end

local function refreshCrumbs()
	for _, c in ipairs(UI.gridCrumbs:GetChildren()) do
		if c:IsA("GuiObject") then c:Destroy() end
	end
	local chain = {}
	local o = Grid.folder
	while o and o ~= game do
		table.insert(chain, 1, o)
		o = o.Parent
	end
	local order = 0
	local function crumb(text, target, last)
		order += 1
		local ts = Services.TextService
		local okS, sz = pcall(ts.GetTextSize, ts, text, 14, Enum.Font.SourceSans, Vector2.new(1000, 24))
		local b = new("TextButton", {
			Size = UDim2.fromOffset(math.min(160, (okS and math.ceil(sz.X) or #text * 7) + 10), K.GRID_CRUMB_H - 4),
			BackgroundColor3 = Configuration.Theme.Hover, BackgroundTransparency = 1, BorderSizePixel = 0,
			AutoButtonColor = false, Font = Enum.Font.SourceSans, TextSize = 14, Text = text, LayoutOrder = order,
			TextColor3 = last and Configuration.Theme.TabText or Configuration.Theme.Dim, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 3,
		}, UI.gridCrumbs)
		new("UICorner", { CornerRadius = UDim.new(0, 3) }, b)
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		b.MouseButton1Click:Connect(function() gridGoTo(target) end)
		if not last then
			order += 1
			new("TextLabel", {
				BackgroundTransparency = 1, Size = UDim2.fromOffset(10, K.GRID_CRUMB_H), Text = ">",
				Font = Enum.Font.SourceSans, TextSize = 13, TextColor3 = Configuration.Theme.Dim, LayoutOrder = order, ZIndex = 3,
			}, UI.gridCrumbs)
		end
	end
	crumb("game", nil, #chain == 0)
	for i, inst in ipairs(chain) do
		local ok, name = pcall(function() return inst.Name end)
		crumb(ok and name or "?", inst, i == #chain)
	end
	UI.gridUp.TextTransparency = Grid.folder and 0 or 0.6
	task.defer(function()
		pcall(function() UI.gridCrumbs.CanvasPosition = Vector2.new(UI.gridCrumbs.AbsoluteCanvasSize.X, 0) end)
	end)
end

local function openGridItem(inst)
	if ALL_KNOWING and inst:IsA("LuaSourceContainer") then
		task.spawn(function() pcall(Delve.openScriptViewer, inst) end)
		return
	end
	if #Cache.getChildren(inst) == 0 and K.viewable(inst) then
		task.spawn(function() pcall(Delve.open3DViewer, inst) end)
		return
	end
	gridGoTo(inst)
end

local function gridRange(a, b)
	local i, j = table.find(Grid.items, a), table.find(Grid.items, b)
	if not (i and j) then selectInstance(b) return end
	if i > j then i, j = j, i end
	local list = {}
	for k = i, j do list[#list + 1] = Grid.items[k] end
	setSelection(list, b)
end

local function makeTile()
	local b = new("TextButton", {
		Size = UDim2.fromOffset(K.GRID_TILE_W, K.GRID_TILE_H), BackgroundColor3 = Configuration.Theme.Hover,
		BackgroundTransparency = 1, BorderSizePixel = 0, AutoButtonColor = false, Text = "", Visible = false, ZIndex = 2,
	}, UI.gridScroll)
	new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
	local icon = new("ImageLabel", {
		Name = "Icon", Size = UDim2.fromOffset(32, 32), Position = UDim2.new(0.5, -16, 0, 8),
		BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Fit, ZIndex = 3,
	}, b)
	local label = new("TextLabel", {
		Name = "Label", BackgroundTransparency = 1, Position = UDim2.fromOffset(3, 43),
		Size = UDim2.new(1, -6, 1, -45), Font = Enum.Font.SourceSans, TextSize = 12, TextColor3 = Configuration.Theme.Text,
		TextWrapped = true, TextTruncate = Enum.TextTruncate.AtEnd, TextYAlignment = Enum.TextYAlignment.Top, ZIndex = 3,
	}, b)
	local t = { frame = b, icon = icon, label = label, node = nil, hover = false, isTile = true }

	function t.paint()
		local sel = t.node and State.selSet[t.node.inst]
		if sel then
			b.BackgroundColor3 = Configuration.Theme.Selected; b.BackgroundTransparency = 0
		elseif t.hover then
			b.BackgroundColor3 = Configuration.Theme.Hover; b.BackgroundTransparency = 0
		else
			b.BackgroundTransparency = 1
		end
		label.TextColor3 = sel and Configuration.Theme.TabText or Configuration.Theme.Text
	end
	b.MouseEnter:Connect(function() t.hover = true; t.paint() end)
	b.MouseLeave:Connect(function() t.hover = false; t.paint() end)

	b.MouseButton1Click:Connect(function()
		if not t.node then return end
		if t.suppressClick then t.suppressClick = false return end
		if t.dragSuppress and os.clock() - t.dragSuppress < 0.25 then t.dragSuppress = nil return end
		local inst = t.node.inst
		local ctrl, shift = modifiers()
		if shift and State.anchorInst then
			gridRange(State.anchorInst, inst)
		elseif ctrl then
			toggleSelect(inst); State.anchorInst = inst
		else
			local now = os.clock()
			if t.lastInst == inst and now - (t.lastClick or 0) < 0.35 then
				t.lastClick = 0
				openGridItem(inst)
				return
			end
			selectInstance(inst); State.anchorInst = inst
			t.lastInst, t.lastClick = inst, now
		end
	end)

	b.MouseButton2Click:Connect(function()
		if not t.node then return end
		t.handledRight = os.clock()
		local inst = t.node.inst
		if not State.selSet[inst] then selectInstance(inst); State.anchorInst = inst end
		openContextMenu(mousePos(), true)
	end)

	local holdToken = 0
	t.cancelHold = function() holdToken += 1 end
	b.InputBegan:Connect(function(i)
		if not t.node then return end
		if i.UserInputType == Enum.UserInputType.MouseButton1 and beginRowDrag then beginRowDrag(t) end
		if i.UserInputType == Enum.UserInputType.Touch then
			if beginRowDrag then beginRowDrag(t, true) end
			holdToken += 1
			local token = holdToken
			local inst = t.node.inst
			local startPos = mousePos()
			delay(0.5, function()
				if token ~= holdToken or not t.node or t.node.inst ~= inst then return end
				if (mousePos() - startPos).Magnitude > 12 then return end
				t.suppressClick = true
				if not State.selSet[inst] then selectInstance(inst); State.anchorInst = inst end
				openContextMenu(mousePos(), true)
			end)
		end
	end)
	b.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch then holdToken += 1 end
	end)
	return t
end

local function renderGrid()
	if not State.gridView then return end
	if State.gridDirty then
		State.gridDirty = false
		Grid.items = gridSource()
		pcall(refreshCrumbs)
	end
	local k = uiK()
	local width = UI.gridScroll.AbsoluteSize.X / k - 8
	local viewH = UI.gridScroll.AbsoluteSize.Y / k
	local stepX, stepY = K.GRID_TILE_W + K.GRID_GAP, K.GRID_TILE_H + K.GRID_GAP
	local cols = math.max(1, math.floor((width - K.GRID_PAD * 2 + K.GRID_GAP) / stepX))
	local rows = math.ceil(#Grid.items / cols)
	UI.gridScroll.CanvasSize = UDim2.fromOffset(0, K.GRID_PAD * 2 + rows * stepY)
	local firstRow = math.max(0, math.floor((UI.gridScroll.CanvasPosition.Y - K.GRID_PAD) / stepY))
	local need = (math.ceil(viewH / stepY) + 1) * cols
	while #tilePool < need do tilePool[#tilePool + 1] = makeTile() end
	local start = firstRow * cols
	for i, t in ipairs(tilePool) do
		local idx = start + i
		local inst = i <= need and Grid.items[idx] or nil
		if inst then
			local n = idx - 1
			t.node = { inst = inst }
			t.frame.Position = UDim2.fromOffset(K.GRID_PAD + (n % cols) * stepX, K.GRID_PAD + math.floor(n / cols) * stepY)
			t.frame.Visible = true
			pcall(applyIcon, t.icon, inst)
			local ok, name = pcall(function() return inst.Name end)
			t.label.Text = ok and name or "?"
			t.paint()
		else
			t.node = nil
			t.frame.Visible = false
		end
	end
end
UI.renderGrid = renderGrid
UI.repaintGrid = function()
	if not State.gridView then return end
	for _, t in ipairs(tilePool) do if t.node then t.paint() end end
end

UI.gridScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function() pcall(renderGrid) end)
UI.gridScroll:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() pcall(renderGrid) end)
UI.gridSearch:GetPropertyChangedSignal("Text"):Connect(function()
	if Grid.filter == UI.gridSearch.Text then return end
	Grid.filter = UI.gridSearch.Text
	State.gridDirty = true
	UI.gridScroll.CanvasPosition = Vector2.zero
	pcall(renderGrid)
end)
UI.gridUp.MouseButton1Click:Connect(function()
	local f = Grid.folder
	if not f then return end
	gridGoTo((f.Parent and f.Parent ~= game) and f.Parent or nil)
end)
UI.gridScroll.InputBegan:Connect(function(i)
	if i.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
	task.defer(function()
		for _, t in ipairs(tilePool) do
			if t.handledRight and os.clock() - t.handledRight < 0.2 then return end
		end
		local m = mousePos()
		for _, t in ipairs(tilePool) do
			if t.node and inside(t.frame, m) then return end
		end
		openContextMenu(m, false)
	end)
end)

local function setGridView(on)
	State.gridView = on and true or false
	UI.tree.Visible = not State.gridView
	UI.explorerFilterBar.Visible = not State.gridView
	UI.grid.Visible = State.gridView
	if UI.gridToggle then UI.gridToggle.Text = State.gridView and "List" or "Grid" end
	if State.gridView then
		local sel = State.selected
		if sel and sel.Parent and not Grid.folder then
			Grid.folder = sel.Parent ~= game and sel.Parent or nil
		end
		State.gridDirty = true
		pcall(renderGrid)
	else
		State.dirty = true
		renderTree()
	end
end
Delve.setGridView = setGridView


local function topServiceOf(inst)
	local o = inst
	while o and o.Parent and o.Parent ~= game do o = o.Parent end
	return o
end
function Delve.setHiddenServices(on)
	Options.ShowHiddenServices = on and true or false
	local roots = topLevel()
	if Options.ShowHiddenServices then
		local fresh = {}
		for _, s in ipairs(roots) do
			if not Cache.roots[s] then
				pcall(Cache.track, s)
				fresh[#fresh + 1] = s
			end
		end
		task.spawn(function()
			for _, s in ipairs(fresh) do
				pcall(Cache.indexTree, s)
				wait()
			end
		end)
	else
		local shown = {}
		for _, s in ipairs(roots) do shown[s] = true end
		local keep, changed = {}, false
		for _, inst in ipairs(State.selection) do
			if shown[topServiceOf(inst)] then keep[#keep + 1] = inst else changed = true end
		end
		if changed then setSelection(keep) end
		if Grid.folder and not shown[topServiceOf(Grid.folder)] then Grid.folder = nil end
	end
	markDirty()
	State.dirty = true
	pcall(renderTree)
	if UI.syncMoreBtn then pcall(UI.syncMoreBtn) end
end

local function reveal(inst)
	local p = inst.Parent
	while p and p ~= game do State.expanded[p] = true; p = p.Parent end
	State.dirty = true
end

UI.renameBox = new("TextBox", {
	Visible = false, BackgroundColor3 = Configuration.Theme.Input, BorderSizePixel = 0, Font = Enum.Font.SourceSans,
	TextSize = 15, TextColor3 = Configuration.Theme.Text, TextXAlignment = Enum.TextXAlignment.Left,
	ClearTextOnFocus = false, Text = "", ZIndex = 10,
}, UI.tree)
stroke(UI.renameBox, Configuration.Theme.Accent)

local function beginRename(inst)
	if not inst then return end
	if State.filterText == "" then reveal(inst) end
	if State.dirty then rebuildFlat(); State.dirty = false end
	local idx = indexInFlat(inst)
	if not idx then notify("Can't rename") return end
	local node = State.flat[idx]
	local y = (idx - 1) * K.ROW_HEIGHT
	local viewH = UI.tree.AbsoluteSize.Y
	if y < UI.tree.CanvasPosition.Y or y + K.ROW_HEIGHT > UI.tree.CanvasPosition.Y + viewH then
		UI.tree.CanvasPosition = Vector2.new(0, math.max(0, y - viewH / 2))
	end
	renderTree()
	local x = 8 + node.depth * 16 + 38
	UI.renameBox.Position = UDim2.fromOffset(x, y + 1)
	UI.renameBox.Size = UDim2.new(1, -(x + 12), 0, K.ROW_HEIGHT - 2)
	UI.renameBox.Text = inst.Name
	State.renaming = inst
	UI.renameBox.Visible = true
	task.defer(function()
		UI.renameBox:CaptureFocus()
		UI.renameBox.SelectionStart = 1
		UI.renameBox.CursorPosition = #UI.renameBox.Text + 1
	end)
end

UI.renameBox.FocusLost:Connect(function(enter)
	local inst = State.renaming
	State.renaming = nil
	UI.renameBox.Visible = false
	if inst and enter and UI.renameBox.Text ~= "" then
		local ok = pcall(function() inst.Name = UI.renameBox.Text end)
		if not ok then notify("Rename failed") end
		Cache.invalidate(inst.Parent)
		State.dirty = true
	end
	renderTree(); renderProps()
end)

local Actions = {}

local function uniqueName(parent, name)
	if not (Options.IncrementNames and parent) then return name end
	local ok, taken = pcall(parent.FindFirstChild, parent, name)
	if not (ok and taken) then return name end
	local base = name:gsub("%d+$", "")
	local n = 1
	while true do
		local okN, hit = pcall(parent.FindFirstChild, parent, base .. n)
		if not (okN and hit) then return base .. n end
		n += 1
	end
end

local function cloneSafe(inst)
	local okA, arch = pcall(function() return inst.Archivable end)
	if okA and not arch then pcall(function() inst.Archivable = true end) end
	local ok, c = pcall(inst.Clone, inst)
	if okA and not arch then pcall(function() inst.Archivable = false end) end
	return ok and c or nil
end
local function topMost(list)
	local set = {}
	for _, i in ipairs(list) do set[i] = true end
	local out = {}
	for _, i in ipairs(list) do
		local p, covered = i.Parent, false
		while p do
			if set[p] then covered = true break end
			p = p.Parent
		end
		if not covered then out[#out + 1] = i end
	end
	return out
end
local function isGroup(inst)
	return inst and inst.Parent ~= game and (inst.ClassName == "Model" or inst.ClassName == "Folder")
end
local function isService(inst) return inst and inst.Parent == game end
local function canDelete(inst) return inst and inst.Parent and inst.Parent ~= game end

local function boundsOf(inst)
	local ok, cf, size = pcall(function()
		if inst:IsA("BasePart") then return inst.CFrame, inst.Size end
		if inst:IsA("Model") and inst ~= workspace then return inst:GetBoundingBox() end
		if inst:IsA("Attachment") then return inst.WorldCFrame, Vector3.one * 2 end
		local p = inst:FindFirstAncestorWhichIsA("BasePart") or inst:FindFirstChildWhichIsA("BasePart", true)
		if p then return p.CFrame, p.Size end
		return nil
	end)
	if ok and cf then return cf, size end
	return nil
end

local function pathOf(inst)
	local parts = {}
	local cur = inst
	while cur and cur ~= game do
		local parent = cur.Parent
		if parent == game then
			table.insert(parts, 1, string.format('game:GetService("%s")', cur.ClassName))
		elseif parent == nil then
			table.insert(parts, 1, "nil --[[" .. cur.Name .. "]]")
		else
			local n = cur.Name
			if n:match("^[%a_][%w_]*$") then
				table.insert(parts, 1, "." .. n)
			else
				table.insert(parts, 1, string.format("[%q]", n))
			end
		end
		cur = parent
	end
	return table.concat(parts)
end

local function afterChange(newSelection, expandParent)
	if expandParent then State.expanded[expandParent] = true end
	State.dirty = true; renderTree()
	if newSelection then setSelection(newSelection) end
end

function Actions.copy()
	State.clipboard = {}
	for _, i in ipairs(topMost(State.selection)) do
		local c = cloneSafe(i)
		if c then State.clipboard[#State.clipboard + 1] = c end
	end
	notify(string.format("Copied %d item(s)", #State.clipboard))
end
function Actions.delete()
	local n = 0
	for _, i in ipairs(topMost(State.selection)) do
		if canDelete(i) and pcall(i.Destroy, i) then n += 1 end
	end
	setSelection({})
	afterChange()
	if n == 0 then notify("Nothing deleted") end
end
function Actions.cut() Actions.copy(); Actions.delete() end
function Actions.paste(into, explicitParent)
	if #State.clipboard == 0 then notify("Clipboard is empty") return end
	local parent = explicitParent or (into and State.selected) or (State.selected and State.selected.Parent) or workspace
	if parent == game then parent = workspace end
	local made = {}
	for _, src in ipairs(State.clipboard) do
		local c = cloneSafe(src)
		if c then pcall(function() c.Name = uniqueName(parent, c.Name) end) end
		if c and pcall(function() c.Parent = parent end) then made[#made + 1] = c end
	end
	afterChange(made, parent)
	notify(string.format("Pasted %d item(s)", #made))
end
function Actions.duplicate()
	local made = {}
	for _, i in ipairs(topMost(State.selection)) do
		local c = cloneSafe(i)
		if c and i.Parent then pcall(function() c.Name = uniqueName(i.Parent, c.Name) end) end
		if c and i.Parent and pcall(function() c.Parent = i.Parent end) then made[#made + 1] = c end
	end
	afterChange(made)
end
function Actions.group(cls)
	local list = topMost(State.selection)
	if #list == 0 then return end
	local parent = list[1].Parent
	if not parent or parent == game then notify("Can't group services") return end
	local g = Instance.new(cls); g.Name = cls
	if not pcall(function() g.Parent = parent end) then notify("Group failed") return end
	local moved = 0
	for _, i in ipairs(list) do if pcall(function() i.Parent = g end) then moved += 1 end end
	State.expanded[g] = true
	afterChange({ g }, parent)
	notify(string.format("Grouped %d item(s) as %s", moved, cls))
end
function Actions.ungroup()
	local made = {}
	for _, inst in ipairs(topMost(State.selection)) do
		if isGroup(inst) then
			local parent = inst.Parent
			for _, c in ipairs(safeChildren(inst)) do
				if pcall(function() c.Parent = parent end) then made[#made + 1] = c end
			end
			pcall(inst.Destroy, inst)
		end
	end
	afterChange(made)
end
function Actions.selectChildren()
	local out, seen = {}, {}
	local list = #State.selection > 0 and State.selection or { State.selected }
	for _, p in ipairs(list) do
		if p then
			State.expanded[p] = true
			for _, c in ipairs(Cache.getChildren(p)) do
				if not seen[c] then seen[c] = true; out[#out + 1] = c end
			end
		end
	end
	if #out > 0 then afterChange(out) end
end
function Actions.selectAll()
	if State.dirty then rebuildFlat(); State.dirty = false end
	local list = {}
	for _, n in ipairs(State.flat) do list[#list + 1] = n.inst end
	if #list > 0 then setSelection(list, State.selected) end
end
local function scrollToIndex(idx)
	local y = (idx - 1) * K.ROW_HEIGHT
	local viewH = UI.tree.AbsoluteSize.Y
	local cy = UI.tree.CanvasPosition.Y
	if y < cy then
		UI.tree.CanvasPosition = Vector2.new(0, y)
	elseif y + K.ROW_HEIGHT > cy + viewH then
		UI.tree.CanvasPosition = Vector2.new(0, math.max(0, y + K.ROW_HEIGHT - viewH))
	end
end
function Actions.navigate(key)
	if State.dirty then rebuildFlat(); State.dirty = false end
	local n = #State.flat
	if n == 0 then return end
	local _, shift = modifiers()
	local cur = State.selected and indexInFlat(State.selected)
	local function moveTo(idx, extend)
		idx = math.clamp(idx, 1, n)
		local inst = State.flat[idx].inst
		if extend and State.anchorInst then
			selectRange(State.anchorInst, inst)
		else
			selectInstance(inst); State.anchorInst = inst
		end
		scrollToIndex(idx); renderTree()
	end
	if key == Enum.KeyCode.Up then
		moveTo(cur and cur - 1 or 1, shift)
	elseif key == Enum.KeyCode.Down then
		moveTo(cur and cur + 1 or 1, shift)
	elseif key == Enum.KeyCode.Left and cur then
		local node = State.flat[cur]
		if node.hasChildren and State.expanded[node.inst] then
			State.expanded[node.inst] = nil; State.dirty = true; renderTree()
		else
			local p = node.inst.Parent
			local pi = p and p ~= game and indexInFlat(p)
			if pi then moveTo(pi, false) end
		end
	elseif key == Enum.KeyCode.Right and cur then
		local node = State.flat[cur]
		if node.hasChildren then
			if not State.expanded[node.inst] then
				State.expanded[node.inst] = true; State.dirty = true; renderTree()
			elseif State.flat[cur + 1] then
				moveTo(cur + 1, false)
			end
		end
	end
end

local function stopViewing()
	local cam = workspace.CurrentCamera
	if State.viewing and cam then
		pcall(function()
			cam.CameraSubject = State.viewing.subject
			cam.CameraType = State.viewing.ctype
		end)
	end
	if State.viewing and State.viewing.conn then State.viewing.conn:Disconnect() end
	State.viewing = nil
end

function Actions.zoomTo()
	local inst = State.selected
	local cam = workspace.CurrentCamera
	if not (inst and cam) then return end
	local cf, size = boundsOf(inst)
	if not cf then notify("Nothing to zoom to") return end
	local target = cf.Position
	local dist = math.max(size.Magnitude * 1.1, 6)
	local dir = cam.CFrame.Position - target
	dir = dir.Magnitude > 0.01 and dir.Unit or Vector3.new(0, 0.5, 1).Unit
	local goal = CFrame.lookAt(target + dir * dist, target)
	if not State.camSavedType then State.camSavedType = cam.CameraType end
	cam.CameraType = Enum.CameraType.Scriptable
	Services.TweenService:Create(cam, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ CFrame = goal, Focus = CFrame.new(target) }):Play()
	State.camToken += 1
	local t = State.camToken
	notify("Zoomed to " .. inst.Name .. " (camera returns in 4s)")
	delay(4, function()
		if t == State.camToken and State.camSavedType then
			pcall(function() cam.CameraType = State.camSavedType end)
			State.camSavedType = nil
		end
	end)
end
function Actions.teleportTo()
	local inst = State.selected
	if not inst then return end
	local plr = Services.Players and Services.Players.LocalPlayer or game:GetService("Players").LocalPlayer
	local char = plr and plr.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if not root then notify("No character to teleport") return end
	if inst:IsDescendantOf(char) then notify("That's already you") return end
	local cf, size = boundsOf(inst)
	if not cf then notify("Nothing to teleport to") return end
	local up = (size and size.Y or 0) / 2 + 3
	local goal = CFrame.new(cf.Position + Vector3.new(0, up, 0)) * (root.CFrame - root.CFrame.Position)
	local ok = pcall(function() char:PivotTo(goal) end)
	if not ok then pcall(function() root.CFrame = goal end) end
	pcall(function()
		root.AssemblyLinearVelocity = Vector3.zero
		root.AssemblyAngularVelocity = Vector3.zero
	end)
	notify("Teleported to " .. inst.Name)
end
function Actions.viewObject()
	local cam = workspace.CurrentCamera
	if not cam then return end
	if State.viewing then stopViewing(); notify("Stopped viewing") return end
	local inst = State.selected
	if not inst then return end
	local subj
	if inst:IsA("Humanoid") or inst:IsA("BasePart") then
		subj = inst
	elseif inst:IsA("Model") then
		subj = inst:FindFirstChildOfClass("Humanoid") or inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart", true)
	else
		subj = inst:FindFirstAncestorWhichIsA("BasePart") or inst:FindFirstChildWhichIsA("BasePart", true)
	end
	if not subj then notify("Nothing to view") return end
	State.camToken += 1
	local prevType = State.camSavedType or cam.CameraType
	State.camSavedType = nil
	State.viewing = { subject = cam.CameraSubject, ctype = prevType }
	State.viewing.conn = subj.AncestryChanged:Connect(function() if not subj.Parent then stopViewing() end end)
	cam.CameraType = Enum.CameraType.Custom
	cam.CameraSubject = subj
	notify("Viewing " .. inst.Name)
end
function Actions.copyPath()
	local list = #State.selection > 0 and State.selection or { State.selected }
	local out = {}
	for _, i in ipairs(list) do if i then out[#out + 1] = pathOf(i) end end
	if #out == 0 then return end
	local p = table.concat(out, "\n")
	if Services.setClipboard then pcall(Services.setClipboard, p) else print("[Delve] " .. p) end
end

local function dumpInstance(inst, depth, out)
	if #out > 200000 then return end
	local pad = string.rep("  ", depth)
	out[#out + 1] = string.format("%s%s [%s]", pad, inst.Name, inst.ClassName)
	for _, cat in ipairs(K.PROPERTY_LIST) do
		for _, p in ipairs(cat[2]) do
			if K.allowProperty(p) and p ~= "Name" and p ~= "ClassName" and p ~= "Parent" then
				local ok, v = pcall(function() return inst[p] end)
				if ok and v ~= nil and typeof(v) ~= "RBXScriptSignal" and typeof(v) ~= "function" then
					out[#out + 1] = pad .. "  ." .. p .. " = " .. (fmt(v))
				end
			end
		end
	end
	for _, c in ipairs(safeChildren(inst)) do dumpInstance(c, depth + 1, out) end
end
function Actions.saveToFile()
	local inst = State.selected
	if not inst then return end
	local fname = (inst.Name:gsub("[^%w_%-]", "_"))
	if ALL_KNOWING and Services.saveInstanceFn then
		local ok = pcall(Services.saveInstanceFn, inst)
		if not ok then ok = pcall(Services.saveInstanceFn, { Object = inst, FilePath = fname }) end
		if ok then notify("Saved " .. inst.Name) return end
	end
	K.ensureFolder("LX/Saves")
	local out = {}
	dumpInstance(inst, 0, out)
	local path = string.format("LX/Saves/%s_%d.txt", fname, os.time())
	local ok = pcall(writefile, path, table.concat(out, "\n"))
	notify(ok and ("Saved to " .. path) or "Save failed")
end

UI.picker = new("Frame", {
	Name = "insert", Size = UDim2.fromOffset(UI.pickW, UI.pickH), BackgroundColor3 = Configuration.Theme.Main,
	BorderSizePixel = 0, Visible = false, ZIndex = 60, Active = true,
}, UI.gui)
stroke(UI.picker)
new("UICorner", { CornerRadius = UDim.new(0, 6) }, UI.picker)
new("TextLabel", {
	BackgroundTransparency = 1, Size = UDim2.new(1, -32, 0, 24), Position = UDim2.fromOffset(8, 0),
	Font = Enum.Font.SourceSansBold, TextSize = 14, TextColor3 = Configuration.Theme.Text, Text = "Insert Object",
	TextXAlignment = Enum.TextXAlignment.Left,
}, UI.picker)
UI.pickerClose = windowButton(UI.picker, "close", UDim2.fromOffset(28, 22))
UI.pickerClose.Position = UDim2.new(1, -30, 0, 1)
UI.pickerSearchHolder = new("Frame", {
	Position = UDim2.fromOffset(6, 26), Size = UDim2.new(1, -12, 0, 24),
	BackgroundColor3 = Configuration.Theme.Input, BorderSizePixel = 0,
}, UI.picker)
stroke(UI.pickerSearchHolder)
UI.pickerSearch = new("TextBox", {
	BackgroundTransparency = 1, Size = UDim2.new(1, -12, 1, 0), Position = UDim2.fromOffset(6, 0),
	Font = Enum.Font.SourceSans, TextSize = 14, TextColor3 = Configuration.Theme.Text, PlaceholderColor3 = Configuration.Theme.Dim,
	PlaceholderText = "Search object", Text = "", ClearTextOnFocus = false,
	TextXAlignment = Enum.TextXAlignment.Left, ClipsDescendants = true,
}, UI.pickerSearchHolder)
UI.pickerList = scroller(UI.picker)
UI.pickerList.BackgroundColor3 = Configuration.Theme.Main
UI.pickerList.Position = UDim2.fromOffset(0, 56)
UI.pickerList.Size = UDim2.new(1, 0, 1, -56)
UI.pickerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }, UI.pickerList)

local function hidePicker() UI.picker.Visible = false; pcall(function() UI.pickerSearch:ReleaseFocus() end) end
UI.pickerClose.MouseButton1Click:Connect(hidePicker)

local function insertClass(cls)
	local made = {}
	for _, parent in ipairs(State.pickerTargets) do
		local ok, inst = pcall(Instance.new, cls)
		if ok and inst then
			if inst:IsA("BasePart") and (parent == workspace or parent:IsDescendantOf(workspace)) then
				local cam = workspace.CurrentCamera
				if cam then inst.CFrame = CFrame.new((cam.CFrame * CFrame.new(0, 0, -12)).Position) end
				inst.Anchored = true
			end
			pcall(function() inst.Name = uniqueName(parent, inst.Name) end)
			if pcall(function() inst.Parent = parent end) then
				made[#made + 1] = inst; State.expanded[parent] = true
			else inst:Destroy() end
		end
	end
	hidePicker()
	if #made > 0 then afterChange(made); notify(string.format("Inserted %s", cls)) else notify("Couldn't insert " .. cls) end
end

local function insertService(name)
	hidePicker()
	local ok, s = pcall(game.GetService, game, name)
	if not (ok and s) then notify("Service not available: " .. name) return end
	if not table.find(K.SERVICE_ORDER, s.ClassName) and not table.find(Cache.extraRoots, s) then
		table.insert(Cache.extraRoots, s)
	end
	Cache.track(s); Cache.indexTree(s); afterChange({ s })
	notify("Added " .. s.ClassName)
end

local function fillPicker()
	for _, c in ipairs(UI.pickerList:GetChildren()) do
		if c:IsA("GuiObject") then c:Destroy() end
	end
	State.pickerFirst = nil
	local raw = (UI.pickerSearch.Text:gsub("^%s+", ""):gsub("%s+$", ""))
	local q = raw:lower()
	local order = 0
	local function header(text)
		order += 1
		local l = new("TextLabel", {
			Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Font = Enum.Font.SourceSansBold, TextSize = 14,
			TextColor3 = Configuration.Theme.Dim, Text = text, TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = order,
		}, UI.pickerList)
		new("UIPadding", { PaddingLeft = UDim.new(0, 8) }, l)
	end
	local function item(text, cls, enabled, onPick)
		order += 1
		local b = new("TextButton", {
			Size = UDim2.new(1, 0, 0, 22), BackgroundColor3 = Configuration.Theme.Hover, BackgroundTransparency = 1,
			BorderSizePixel = 0, AutoButtonColor = false, Text = "", LayoutOrder = order,
		}, UI.pickerList)
		local ic = new("ImageLabel", {
			Size = UDim2.fromOffset(16, 16), Position = UDim2.fromOffset(10, 3),
			BackgroundTransparency = 1, ImageTransparency = enabled and 0 or 0.5,
		}, b)
		applyClassIcon(ic, cls)
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(32, 0), Size = UDim2.new(1, -40, 1, 0),
			Font = Enum.Font.SourceSans, TextSize = 15, Text = text, TextColor3 = Configuration.Theme.Text,
			TextTransparency = enabled and 0 or 0.5, TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		}, b)
		if enabled then
			if not State.pickerFirst then State.pickerFirst = onPick end
			b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
			b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
			b.MouseButton1Click:Connect(onPick)
		end
	end
	if State.pickerMode == "object" then
		if q == "" then
			for _, cat in ipairs(K.INSERT_CATALOG) do
				header(cat[1])
				for _, cls in ipairs(cat[2]) do
					if not isServiceClass(cls) then
						item(cls, cls, Cache.isCreatable(cls), function() insertClass(cls) end)
					end
				end
			end
		else
			local seen, matches, exact = {}, {}, false
			local function consider(cls)
				if not seen[cls] and not isServiceClass(cls) and cls:lower():find(q, 1, true) then
					seen[cls] = true; matches[#matches + 1] = cls
					if cls:lower() == q then exact = true end
				end
			end
			for _, cat in ipairs(K.INSERT_CATALOG) do
				for _, cls in ipairs(cat[2]) do consider(cls) end
			end
			for cls in pairs(Cache.knownClasses) do consider(cls) end
			table.sort(matches)
			if not exact then
				local ok, inst = pcall(Instance.new, raw)
				if ok and inst then
					local cn = inst.ClassName
					pcall(iconIndexFor, inst); pcall(studioNameFor, inst); inst:Destroy()
					if not isServiceClass(cn) then
						header("New Instance")
						item("New Instance: " .. cn, cn, true, function() insertClass(cn) end)
					end
				end
			end
			header(#matches > 0 and "Results" or "No matches")
			for i, cls in ipairs(matches) do
				if i > 150 then break end
				item(cls, cls, Cache.isCreatable(cls), function() insertClass(cls) end)
			end
		end
	else
		header("Services")
		local exact = false
		for _, name in ipairs(K.SERVICE_CATALOG) do
			if q == "" or name:lower():find(q, 1, true) then
				if name:lower() == q then exact = true end
				local present = game:FindFirstChildOfClass(name) ~= nil
				item(name .. (present and "" or "  (hidden)"), name, true, function() insertService(name) end)
			end
		end
		if q ~= "" and not exact then
			header("Other")
			item("GetService: " .. raw, raw, true, function() insertService(raw) end)
		end
	end
end

UI.pickerSearch:GetPropertyChangedSignal("Text"):Connect(function() if UI.picker.Visible then fillPicker() end end)
UI.pickerSearch.FocusLost:Connect(function(enter)
	if enter and UI.picker.Visible and State.pickerFirst then State.pickerFirst() end
end)

openPicker = function(mode, targets, ax, ay, leftX, focus)
	State.pickerMode = mode
	State.pickerTargets = {}
	for _, t in ipairs(targets or {}) do State.pickerTargets[#State.pickerTargets + 1] = t end
	if #State.pickerTargets == 0 then State.pickerTargets = { workspace } end
	UI.pickerSearch.Text = ""
	fillPicker()
	UI.pickerList.CanvasPosition = Vector2.zero
	UI.picker.Visible = true
	local s = screenSize()
	local pw, ph = math.min(UI.pickW, s.X - 8), math.min(UI.pickH, s.Y - 8)
	UI.picker.Size = UDim2.fromOffset(pw, ph)
	local x = ax or mousePos().X
	if x + pw > s.X then x = (leftX or x) - pw end
	x = math.clamp(x, 0, math.max(0, s.X - pw))
	local y = math.clamp(ay or mousePos().Y, 0, math.max(0, s.Y - ph))
	UI.picker.Position = UDim2.fromOffset(x, y)
	K.popIn(UI.picker, -6)
	if not Services.UserInputService.TouchEnabled then
		task.defer(function() UI.pickerSearch:CaptureFocus() end)
	end
end

UI.menu = new("Frame", {
	Name = "ctx", BackgroundColor3 = Configuration.Theme.Header, BorderSizePixel = 0,
	Visible = false, ZIndex = 50, Size = UDim2.fromOffset(UI.menuW, 0), Active = true,
}, UI.gui)
stroke(UI.menu)
new("UICorner", { CornerRadius = UDim.new(0, 6) }, UI.menu)
new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }, UI.menu)
new("UIPadding", { PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4) }, UI.menu)
UI.itemH = touchH(Services.UserInputService.TouchEnabled and 30 or 22)
local function hideMenu() UI.menu.Visible = false end
local function clearMenu()
	for _, c in ipairs(UI.menu:GetChildren()) do
		if c:IsA("GuiObject") then c:Destroy() end
	end
	State.menuH, State.menuOrder = 8, 0
end
local function mItem(text, shortcut, enabled, fn, hasArrow)
	State.menuOrder += 1
	local b = new("TextButton", {
		Size = UDim2.new(1, 0, 0, UI.itemH), BackgroundColor3 = Configuration.Theme.MenuHover, BackgroundTransparency = 1,
		BorderSizePixel = 0, AutoButtonColor = false, Text = "", LayoutOrder = State.menuOrder,
	}, UI.menu)
	new("TextLabel", {
		BackgroundTransparency = 1, Position = UDim2.fromOffset(22, 0), Size = UDim2.new(1, -110, 1, 0),
		Font = Enum.Font.SourceSans, TextSize = 14, Text = text, TextColor3 = Configuration.Theme.Text,
		TextTransparency = enabled and 0 or 0.55, TextXAlignment = Enum.TextXAlignment.Left,
	}, b)
	if shortcut then
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.new(1, -96, 0, 0), Size = UDim2.new(0, 84, 1, 0),
			Font = Enum.Font.SourceSans, TextSize = 13, Text = shortcut, TextColor3 = Configuration.Theme.Dim,
			TextTransparency = enabled and 0 or 0.4, TextXAlignment = Enum.TextXAlignment.Right,
		}, b)
	end
	if hasArrow then
		uiImage({ Size = UDim2.fromOffset(16, 16), Position = UDim2.new(1, -22, 0.5, -8) }, b, "chevron_right", Configuration.Theme.Text)
	end
	if enabled and fn then
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		b.MouseButton1Click:Connect(function()
			local ax = UI.menu.AbsolutePosition.X - UI.gui.AbsolutePosition.X + UI.menu.AbsoluteSize.X
			local ay = b.AbsolutePosition.Y - UI.gui.AbsolutePosition.Y
			local lx = UI.menu.AbsolutePosition.X - UI.gui.AbsolutePosition.X
			hideMenu()
			task.spawn(fn, ax, ay, lx)
		end)
	end
	State.menuH += UI.itemH
end
local function mSep()
	State.menuOrder += 1
	local f = new("Frame", { Size = UDim2.new(1, 0, 0, 7), BackgroundTransparency = 1, LayoutOrder = State.menuOrder }, UI.menu)
	new("Frame", {
		Size = UDim2.new(1, -16, 0, 1), Position = UDim2.fromOffset(8, 3),
		BackgroundColor3 = Configuration.Theme.Border, BorderSizePixel = 0,
	}, f)
	State.menuH += 7
end

local FileTools = {}
do
	local Http = game:GetService("HttpService")
	local decompileFn = envFn("decompile")
	local appendFn = envFn("appendfile")
	local readFn = envFn("readfile")
	local getNil = envFn("getnilinstances")
	local getScripts = envFn("getscripts", "getrunningscripts")
	local getLoaded = envFn("getloadedmodules")
	local getBytecode = envFn("getscriptbytecode", "dumpstring")
	local getHash = envFn("getscripthash")
	local getConns = envFn("getconnections")
	local ROOT = "LX/Exports"

	local function stamp() return os.date("%Y-%m-%d_%H-%M-%S") end
	local function gameTag() return K.sanitizeFileName(("%s_%d"):format(game.Name ~= "" and game.Name or "Game", game.PlaceId)) end
	local function fullName(i) local ok, n = pcall(function() return i:GetFullName() end) return ok and n or tostring(i) end
	local function write(path, data)
		local dir = path:match("^(.*)/[^/]+$")
		if dir then K.ensureFolder(dir) end
		local ok, err = pcall(Services.writeFile, path, data)
		if not ok then notify("Write failed: " .. tostring(err)) end
		return ok
	end
	FileTools.write = write

	local function str(v)
		local t = typeof(v)
		if t == "Instance" then return fullName(v) end
		if t == "string" then return v end
		return tostring(v)
	end
	local COMMON = { "Name", "ClassName", "Parent", "Archivable", "Anchored", "CanCollide", "CanTouch", "CanQuery",
		"Transparency", "Color", "BrickColor", "Material", "Size", "Position", "CFrame", "Orientation", "Massless",
		"Value", "Text", "TextColor3", "TextSize", "Font", "Image", "ImageColor3", "Visible", "Enabled",
		"BackgroundColor3", "BackgroundTransparency", "ZIndex", "AnchorPoint", "SoundId", "Volume", "Playing",
		"Looped", "MeshId", "TextureID", "Texture", "Health", "MaxHealth", "WalkSpeed", "JumpPower", "Disabled",
		"RunContext", "Brightness", "Range", "Shadows", "Locked", "PrimaryPart", "Adornee", "Rotation",
		"TextWrapped", "TextXAlignment", "TextYAlignment", "BorderSizePixel", "ClipsDescendants", "LayoutOrder",
		"CornerRadius", "Thickness", "ResetOnSpawn", "DisplayOrder", "IgnoreGuiInset", "ZIndexBehavior" }
	local function props(inst)
		local out = {}
		for _, p in ipairs(COMMON) do
			local ok, v = pcall(function() return inst[p] end)
			if ok and v ~= nil then out[p] = str(v) end
		end
		if K.extraProps then
			local ok, extra = pcall(K.extraProps, inst)
			if ok and type(extra) == "table" then
				for k, v in pairs(extra) do
					local name = type(k) == "string" and k or (type(v) == "table" and v.Name) or (type(v) == "string" and v)
					if type(name) == "string" and K.allowProperty(name) and out[name] == nil then
						local ok2, val = pcall(function() return inst[name] end)
						if ok2 and val ~= nil then out[name] = str(val) end
					end
				end
			end
		end
		local okA, attrs = pcall(function() return inst:GetAttributes() end)
		if okA and next(attrs) then
			local a = {}
			for k, v in pairs(attrs) do a[k] = str(v) end
			out["@Attributes"] = a
		end
		local okT, tags = pcall(function() return inst:GetTags() end)
		if okT and #tags > 0 then out["@Tags"] = tags end
		return out
	end
	FileTools.props = props

	local function decompile(s)
		if not decompileFn then return "-- decompile() not supported by this executor" end
		local ok, src = pcall(decompileFn, s)
		if ok and type(src) == "string" then return src end
		return "-- failed to decompile: " .. tostring(src)
	end
	local function header(s)
		local h = { "-- " .. fullName(s), "-- Class: " .. s.ClassName, "-- Dumped by LX on " .. os.date("%c") }
		if getHash then local ok, hh = pcall(getHash, s) if ok and hh then h[#h + 1] = "-- Hash: " .. tostring(hh) end end
		return table.concat(h, "\n") .. "\n\n"
	end

	function FileTools.dumpScripts(root)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		local list = {}
		local function add(i) if i:IsA("LuaSourceContainer") then list[#list + 1] = i end end
		pcall(add, root)
		for _, d in ipairs(root:GetDescendants()) do pcall(add, d) end
		if #list == 0 then notify("No scripts under " .. root.Name) return end
		local base = ("%s/%s/Scripts_%s_%s"):format(ROOT, gameTag(), K.sanitizeFileName(root.Name), stamp())
		notify(("Dumping %d scripts..."):format(#list))
		local n, index = 0, {}
		for i, s in ipairs(list) do
			local rel = fullName(s):gsub("%.", "/"):gsub("[^%w_/%-]", "_")
			local path = base .. "/" .. rel .. "." .. s.ClassName .. ".lua"
			if write(path, header(s) .. decompile(s)) then n += 1; index[#index + 1] = fullName(s) .. "  ->  " .. path end
			if i % 5 == 0 then wait() end
		end
		write(base .. "/_index.txt", table.concat(index, "\n"))
		notify(("Saved %d scripts to %s"):format(n, base))
	end

	function FileTools.dumpRunning()
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		local list, seen = {}, {}
		local function addAll(fn)
			if not fn then return end
			local ok, r = pcall(fn)
			if ok and type(r) == "table" then
				for _, s in ipairs(r) do if typeof(s) == "Instance" and not seen[s] then seen[s] = true; list[#list + 1] = s end end
			end
		end
		addAll(getScripts); addAll(getLoaded)
		if #list == 0 then notify("getscripts/getloadedmodules not supported") return end
		local base = ("%s/%s/Running_%s"):format(ROOT, gameTag(), stamp())
		local n = 0
		for i, s in ipairs(list) do
			local path = ("%s/%04d_%s.lua"):format(base, i, K.sanitizeFileName(fullName(s)))
			if write(path, header(s) .. decompile(s)) then n += 1 end
			if i % 5 == 0 then wait() end
		end
		notify(("Saved %d running scripts/modules"):format(n))
	end

	function FileTools.saveBytecode(s)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		if not getBytecode then notify("getscriptbytecode not supported") return end
		local ok, bc = pcall(getBytecode, s)
		if not ok or type(bc) ~= "string" then notify("Could not read bytecode") return end
		local path = ("%s/%s/Bytecode/%s_%s.luac"):format(ROOT, gameTag(), K.sanitizeFileName(fullName(s)), stamp())
		if write(path, bc) then notify("Saved bytecode to " .. path) end
	end

	function FileTools.exportProps(list)
		local out = {}
		for _, i in ipairs(list) do out[#out + 1] = { Path = fullName(i), Properties = props(i) } end
		local okJ, json = pcall(Http.JSONEncode, Http, #out == 1 and out[1] or out)
		if not okJ then notify("JSON encode failed") return end
		local path = ("%s/%s/Properties/%s_%s.json"):format(ROOT, gameTag(), K.sanitizeFileName(list[1].Name), stamp())
		if write(path, json) then notify("Saved properties to " .. path) end
	end

	function FileTools.exportTree(root)
		local lines, count = {}, 0
		local function walk(i, d)
			count += 1
			lines[#lines + 1] = string.rep("  ", d) .. i.Name .. "  [" .. i.ClassName .. "]"
			if count % 400 == 0 then wait() end
			local ok, kids = pcall(function() return i:GetChildren() end)
			if ok then for _, c in ipairs(kids) do walk(c, d + 1) end end
		end
		walk(root, 0)
		local path = ("%s/%s/Trees/%s_%s.txt"):format(ROOT, gameTag(), K.sanitizeFileName(root.Name), stamp())
		if write(path, ("-- %s (%d instances)\n"):format(fullName(root), count) .. table.concat(lines, "\n")) then
			notify(("Saved tree (%d instances)"):format(count))
		end
	end

	local function lit(v)
		local t = typeof(v)
		if t == "string" then return ("%q"):format(v)
		elseif t == "number" or t == "boolean" then return tostring(v)
		elseif t == "Color3" then return ("Color3.fromRGB(%d, %d, %d)"):format(v.R * 255, v.G * 255, v.B * 255)
		elseif t == "Vector3" then return ("Vector3.new(%s, %s, %s)"):format(v.X, v.Y, v.Z)
		elseif t == "Vector2" then return ("Vector2.new(%s, %s)"):format(v.X, v.Y)
		elseif t == "UDim2" then return ("UDim2.new(%s, %d, %s, %d)"):format(v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset)
		elseif t == "UDim" then return ("UDim.new(%s, %d)"):format(v.Scale, v.Offset)
		elseif t == "CFrame" then return "CFrame.new(" .. table.concat({ v:GetComponents() }, ", ") .. ")"
		elseif t == "EnumItem" then return tostring(v)
		elseif t == "BrickColor" then return ("BrickColor.new(%q)"):format(v.Name)
		end
		return nil
	end
	function FileTools.exportCode(root)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		local out = { "-- Generated by LX from " .. fullName(root), "local I = {}" }
		local id = 0
		local function emit(i, parentVar)
			id += 1
			local var = ("I[%d]"):format(id)
			out[#out + 1] = ("%s = Instance.new(%q)"):format(var, i.ClassName)
			for k in pairs(props(i)) do
				if k ~= "Parent" and k ~= "ClassName" and k:sub(1, 1) ~= "@" then
					local ok, v = pcall(function() return i[k] end)
					local l = ok and lit(v)
					if l then out[#out + 1] = ("pcall(function() %s[%q] = %s end)"):format(var, k, l) end
				end
			end
			local okA, attrs = pcall(function() return i:GetAttributes() end)
			if okA then for k, v in pairs(attrs) do local l = lit(v) if l then out[#out + 1] = ("%s:SetAttribute(%q, %s)"):format(var, k, l) end end end
			if i:IsA("LuaSourceContainer") and decompileFn then
				out[#out + 1] = "--[==[ source:\n" .. decompile(i) .. "\n]==]"
			end
			if parentVar then out[#out + 1] = ("%s.Parent = %s"):format(var, parentVar) end
			if id % 200 == 0 then wait() end
			for _, c in ipairs(i:GetChildren()) do emit(c, var) end
		end
		emit(root, nil)
		out[#out + 1] = "I[1].Parent = " .. (root:IsA("LayerCollector") and 'game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")' or "workspace")
		out[#out + 1] = "return I[1]"
		local path = ("%s/%s/Code/%s_%s.lua"):format(ROOT, gameTag(), K.sanitizeFileName(root.Name), stamp())
		if write(path, table.concat(out, "\n")) then notify(("Saved %d instances as code"):format(id)) end
	end

	function FileTools.exportRemotes()
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		local lines = {}
		local classes = { RemoteEvent = true, RemoteFunction = true, UnreliableRemoteEvent = true, BindableEvent = true, BindableFunction = true }
		for n, d in ipairs(game:GetDescendants()) do
			if classes[d.ClassName] then
				local line = ("[%s] %s"):format(d.ClassName, fullName(d))
				if getConns and d:IsA("RemoteEvent") then
					local ok, c = pcall(getConns, d.OnClientEvent)
					if ok and type(c) == "table" then line ..= ("  (%d client listeners)"):format(#c) end
				end
				lines[#lines + 1] = line
			end
			if n % 2000 == 0 then wait() end
		end
		table.sort(lines)
		local path = ("%s/%s/Remotes_%s.txt"):format(ROOT, gameTag(), stamp())
		if write(path, ("-- %d remotes/bindables\n"):format(#lines) .. table.concat(lines, "\n")) then notify(("Saved %d remotes"):format(#lines)) end
	end

	function FileTools.exportNil()
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		if not getNil then notify("getnilinstances not supported") return end
		local ok, list = pcall(getNil)
		if not ok then return end
		local lines = {}
		for _, i in ipairs(list) do lines[#lines + 1] = ("[%s] %s"):format(i.ClassName, i.Name) end
		local path = ("%s/%s/NilInstances_%s.txt"):format(ROOT, gameTag(), stamp())
		if write(path, table.concat(lines, "\n")) then notify(("Saved %d nil instances"):format(#lines)) end
	end

	function FileTools.exportGameInfo()
		local info = { PlaceId = game.PlaceId, GameId = game.GameId, JobId = game.JobId, PlaceVersion = game.PlaceVersion,
			Name = game.Name, Players = #game:GetService("Players"):GetPlayers(), Time = os.date("%c"), Support = K.Support }
		pcall(function()
			local mi = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
			info.Title, info.Creator = mi.Name, mi.Creator and mi.Creator.Name
		end)
		local okJ, json = pcall(Http.JSONEncode, Http, info)
		local path = ("%s/%s/GameInfo_%s.json"):format(ROOT, gameTag(), stamp())
		if okJ and write(path, json) then notify("Saved game info") end
	end

	function FileTools.saveGame()
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		if not Services.saveInstanceFn then notify("saveinstance not supported") return end
		notify("Saving full game... this can take a while")
		local ok = pcall(Services.saveInstanceFn, { FilePath = gameTag(), mode = "optimized", noscripts = false })
		if not ok then ok = pcall(Services.saveInstanceFn) end
		notify(ok and "Game saved to your workspace folder" or "saveinstance failed")
	end

	function FileTools.log(msg)
		local line = os.date("[%H:%M:%S] ") .. tostring(msg) .. "\n"
		local path = "LX/log.txt"
		if appendFn and pcall(appendFn, path, line) then return end
		local prev = ""
		if readFn then local ok, r = pcall(readFn, path) if ok and type(r) == "string" then prev = r end end
		write(path, prev .. line)
	end
end
Delve.FileTools = FileTools

openContextMenu = function(p, onRow)
	clearMenu()
	hidePicker()
	local clip = #State.clipboard > 0
	if onRow and State.selected then
		local sel = State.selected
		local list = #State.selection > 0 and State.selection or { sel }
		local multi = #list > 1
		local anyService, anyDeletable, anyGroup, anyKids, groupable = false, false, false, false, true
		for _, i in ipairs(list) do
			if isService(i) then anyService = true end
			if canDelete(i) then anyDeletable = true end
			if isGroup(i) then anyGroup = true end
			if not anyKids and #Cache.getChildren(i) > 0 then anyKids = true end
			if not (i.Parent and i.Parent ~= game) then groupable = false end
		end
		local service = isService(sel)
		mItem("Cut", "Ctrl+X", not anyService, Actions.cut)
		mItem("Copy", "Ctrl+C", true, Actions.copy)
		mItem("Paste", "Ctrl+V", clip, function() Actions.paste(false) end)
		mItem("Paste Into", "Ctrl+Shift+V", clip, function() Actions.paste(true) end)
		mItem("Duplicate", "Ctrl+D", not anyService, Actions.duplicate)
		mItem("Delete", "Del", anyDeletable, Actions.delete)
		mItem("Rename", "F2", not multi and not service, function() beginRename(sel) end)
		mSep()
		mItem("Group as Model", "Ctrl+G", groupable, function() Actions.group("Model") end)
		mItem("Group as Folder", "Ctrl+Alt+G", groupable, function() Actions.group("Folder") end)
		mItem("Ungroup", "Ctrl+U", anyGroup, Actions.ungroup)
		mItem("Select Children", nil, anyKids, Actions.selectChildren)
		mItem("Select All", "Ctrl+A", true, Actions.selectAll)
		mSep()
		mItem("Insert Object", nil, true, function(ax, ay, lx) openPicker("object", State.selection, ax, ay, lx) end, true)
		mItem("New Instance...", nil, true, function(ax, ay, lx) openPicker("object", State.selection, ax, ay, lx, true) end)
		mSep()
		mItem("Zoom To", "F", boundsOf(sel) ~= nil, Actions.zoomTo)
		if not multi then
			mItem("Teleport To", nil, boundsOf(sel) ~= nil, Actions.teleportTo)
		end
		if not multi then
			mItem(State.viewing and "Stop Viewing" or "View Object", nil, true, Actions.viewObject)
			if K.viewable(sel) and Delve and Delve.open3DViewer then
				mItem("3D View", nil, true, function() Delve.open3DViewer(sel) end)
			end
			if ALL_KNOWING and sel:IsA("LuaSourceContainer") and Delve and Delve.openScriptViewer then
				mItem("View Script", "Dbl Click", true, function() Delve.openScriptViewer(sel) end)
				if Delve.editScript then mItem("Edit Script", nil, true, function() Delve.editScript(sel) end) end
			end
		elseif State.viewing then
			mItem("Stop Viewing", nil, true, Actions.viewObject)
		end
		mItem(multi and "Copy Paths" or "Copy Path", nil, true, Actions.copyPath)
		mSep()
		mItem("Save to File...", nil, not multi and not service, Actions.saveToFile)
		mItem("Export Properties (JSON)", nil, true, function() FileTools.exportProps(list) end)
		if ALL_KNOWING then mItem("Export as Instance.new Code", nil, not multi and not service, function() FileTools.exportCode(sel) end) end
		mItem("Export Tree (TXT)", nil, not multi, function() FileTools.exportTree(sel) end)
		if ALL_KNOWING then mItem("Dump Scripts Inside", nil, not multi, function() FileTools.dumpScripts(sel) end) end
		if not multi and sel:IsA("LuaSourceContainer") then
			if ALL_KNOWING then mItem("Save Bytecode", nil, true, function() FileTools.saveBytecode(sel) end) end
		end
		if Delve.extraMenu then pcall(Delve.extraMenu, sel, list, mItem, mSep) end
	else
		mItem("Paste", "Ctrl+V", clip, function() Actions.paste(true, workspace) end)
		mItem("Insert Object", nil, true, function(ax, ay, lx) openPicker("object", { workspace }, ax, ay, lx) end, true)
		mItem("New Instance...", nil, true, function(ax, ay, lx) openPicker("object", { workspace }, ax, ay, lx, true) end)
		if State.viewing then mItem("Stop Viewing", nil, true, Actions.viewObject) end
		mSep()
		mItem("Collapse All", nil, true, function()
			table.clear(State.expanded); State.expanded[workspace] = true
			afterChange()
		end)
		mItem("Refresh", nil, true, function() table.clear(Cache.children); afterChange() end)
		mSep()
		if ALL_KNOWING then mItem("Save Whole Game", nil, Services.saveInstanceFn ~= nil, FileTools.saveGame) end
		if ALL_KNOWING then mItem("Dump All Scripts", nil, true, function() FileTools.dumpScripts(game) end) end
		if ALL_KNOWING then mItem("Dump Running Scripts", nil, true, FileTools.dumpRunning) end
		if ALL_KNOWING then mItem("Export Remotes List", nil, true, FileTools.exportRemotes) end
		if ALL_KNOWING then mItem("Export Nil Instances", nil, true, FileTools.exportNil) end
		mItem("Export Game Info", nil, true, FileTools.exportGameInfo)
		mItem("Export Full Tree", nil, true, function() FileTools.exportTree(game) end)
	end
	local s = screenSize()
	if State.menuH > s.Y then State.menuH = s.Y end
	UI.menu.Size = UDim2.fromOffset(UI.menuW, State.menuH)
	local mx, my = p.X, p.Y
	if mx + UI.menuW > s.X then mx = math.max(0, mx - UI.menuW) end
	if my + State.menuH > s.Y then my = math.max(0, s.Y - State.menuH) end
	UI.menu.Position = UDim2.fromOffset(math.max(0, mx), math.max(0, my))
	UI.menu.Visible = true
	K.popIn(UI.menu, -4)
end

K.tweenInfo = TweenInfo.new(Options.LowEnd and 0.12 or 0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
K.menuInfo = TweenInfo.new(Options.LowEnd and 0.1 or 0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
function K.applyLowEnd()
	if Options.NoAnimations then return K.applyPerformance() end
	K.tweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	K.menuInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
end
function K.applyPerformance()
	if Options.ForceLowEnd then Options.LowEnd = true end
	if Options.NoAnimations then
		K.tweenInfo = TweenInfo.new(0)
		K.menuInfo = TweenInfo.new(0)
		K.fastTween = TweenInfo.new(0)
	else
		local low = Options.LowEnd
		K.tweenInfo = TweenInfo.new(low and 0.12 or 0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		K.menuInfo = TweenInfo.new(low and 0.1 or 0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		K.fastTween = TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	end
end
K.CURSORS = {
	ew = "rbxasset://SystemCursors/SizeEW", ns = "rbxasset://SystemCursors/SizeNS",
	nwse = "rbxasset://SystemCursors/SizeNWSE", nesw = "rbxasset://SystemCursors/SizeNESW",
	split = "rbxasset://SystemCursors/SplitNS",
}
K.cursorHeld = nil
function K.setCursor(icon)
	pcall(function() Services.UserInputService.MouseIcon = icon or "" end)
end
function K.cursorHandle(btn, kind)
	local icon = K.CURSORS[kind]
	btn.MouseEnter:Connect(function() if not K.cursorHeld then K.setCursor(icon) end end)
	btn.MouseLeave:Connect(function() if not K.cursorHeld then K.setCursor(nil) end end)
	btn.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then K.cursorHeld = btn; K.setCursor(icon) end
	end)
	Services.UserInputService.InputEnded:Connect(function(i)
		if K.cursorHeld == btn and i.UserInputType == Enum.UserInputType.MouseButton1 then
			K.cursorHeld = nil
			local m = Services.UserInputService:GetMouseLocation() - Services.GuiService:GetGuiInset()
			local p, sz = btn.AbsolutePosition, btn.AbsoluteSize
			local over = btn.Visible and m.X >= p.X and m.X <= p.X + sz.X and m.Y >= p.Y and m.Y <= p.Y + sz.Y
			K.setCursor(over and icon or nil)
		end
	end)
end
K.TAB_H = touchH(26) + (Delve_IsMobile and 8 or 0)
local Windows = {}
local refreshDocks, beginDrag, endDrag, placeRestoreButtons

local function localPos(f) return absToLocal(f.AbsolutePosition) end
local wireWindow
local function createWindow(name, isTool)
	local frame = new("Frame", {
		Name = name:lower(), Size = UDim2.fromOffset(300, 620), Position = UDim2.fromOffset(0, 0),
		Visible = false, BackgroundColor3 = Configuration.Theme.Surface, BorderSizePixel = 0, Active = true, ZIndex = 1,
	}, UI.gui)
	stroke(frame)
	if isTool then new("UICorner", { CornerRadius = UDim.new(0, 6) }, frame) end
	local w = {
		name = name, frame = frame, panes = {}, mode = "stack", active = nil,
		ratio = 0.55, lastRatio = 0.55, snapped = nil, snapWidth = nil, bottomH = nil,
		floatSize = UDim2.fromOffset(300, 620), minimized = false, tween = nil, tabs = {},
		tool = isTool or false, closed = false,
	}
	w.splitter = new("TextButton", {
		Name = "split", BackgroundColor3 = Configuration.Theme.Border, BorderSizePixel = 0,
		AutoButtonColor = false, Text = "", ZIndex = 4, Visible = false,
	}, frame)
	w.tabBar = new("Frame", {
		Name = "tabs", BackgroundColor3 = Configuration.Theme.Main, BorderSizePixel = 0, Visible = false,
		ZIndex = 4, Size = UDim2.new(1, 0, 0, K.TAB_H), Position = UDim2.new(0, 0, 1, -K.TAB_H),
	}, frame)
	divider(w.tabBar, UDim2.fromOffset(0, 0))
	w.tabHolder = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, -18, 1, 0), ZIndex = 4 }, w.tabBar)
	w.grip = uiImage({
		ClassName = "ImageButton", Size = UDim2.fromOffset(14, 14),
		Position = UDim2.new(1, -15, 1, -15), AutoButtonColor = false, ZIndex = 8,
	}, frame, "grip")
	w.grip.ImageTransparency = 1
	w.grip.BackgroundTransparency = 1
	w.grip.Size = UDim2.fromOffset(10, 10)
	w.grip.Position = UDim2.new(1, -8, 1, -8)
	local function edge(n, pos, size)
		return new("TextButton", {
			Name = n, BackgroundTransparency = 1, Text = "", AutoButtonColor = false,
			Position = pos, Size = size, ZIndex = 7,
		}, frame)
	end
	w.leftEdge = edge("LeftEdge", UDim2.fromOffset(-3, K.TITLE_H), UDim2.new(0, 6, 1, -K.TITLE_H))
	w.rightEdge = edge("RightEdge", UDim2.new(1, -3, 0, K.TITLE_H), UDim2.new(0, 6, 1, -(K.TITLE_H + 16)))
	w.bottomEdge = edge("BottomEdge", UDim2.new(0, 0, 1, -3), UDim2.new(1, -16, 0, 6))
	w.topEdge = edge("TopEdge", UDim2.fromOffset(0, -3), UDim2.new(1, 0, 0, 5))
	w.minBtn = windowButton(frame, "min")
	if isTool then
		w.closeBtn = windowButton(frame, "close")
		w.closeBtn.Position = UDim2.new(1, -31, 0, 2)
	end
	w.restore = new("TextButton", { BackgroundTransparency = 0, BackgroundColor3 = Configuration.Theme.Header, Visible = false, ZIndex = 45, AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(20, 44), Text = "◀", Font = Enum.Font.SourceSansBold, TextSize = 10, TextColor3 = Configuration.Theme.Dim }, UI.gui)
	new("UICorner", { CornerRadius = UDim.new(0, 4) }, w.restore)
	stroke(w.restore)
	w.restore.MouseEnter:Connect(function() w.restore.BackgroundColor3 = Configuration.Theme.Panel end)
	w.restore.MouseLeave:Connect(function() w.restore.BackgroundColor3 = Configuration.Theme.Header end)
	Windows[#Windows + 1] = w
	if wireWindow then wireWindow(w) end
	return w
end

local mainWin = createWindow("DelveWindow")
mainWin.frame.Size = UDim2.fromOffset(250, 620)
mainWin.floatSize = UDim2.fromOffset(250, 620)
local sideWin = createWindow("DelveWindow2")

local function otherWin(w) if w.tool then return nil end return Windows[1] == w and Windows[2] or Windows[1] end
local function isOpen(w) return #w.panes > 0 and not w.minimized and not w.closed and w.frame.Visible end
local function ownerOf(pane)
	for _, w in ipairs(Windows) do if table.find(w.panes, pane) then return w end end
end
local zCounter = 1
K.WINDOW_Z_MAX = 25
local function bringToFront(w)
	zCounter += 1
	if zCounter > K.WINDOW_Z_MAX then
		local order = {}
		for _, o in ipairs(Windows) do if o ~= w then order[#order + 1] = o end end
		table.sort(order, function(a, b) return a.frame.ZIndex < b.frame.ZIndex end)
		for i, o in ipairs(order) do o.frame.ZIndex = i end
		zCounter = #order + 1
	end
	w.frame.ZIndex = zCounter
end
local function anyWindowAt(m)
	for _, w in ipairs(Windows) do if isOpen(w) and inside(w.frame, m) then return w end end
end
local function topWindowAt(m)
	local best
	for _, w in ipairs(Windows) do
		if isOpen(w) and inside(w.frame, m) and (not best or w.frame.ZIndex >= best.frame.ZIndex) then best = w end
	end
	return best
end

local function sideOf(w)
	if w.snapped == "left" then return "left" end
	if w.snapped == "bottom" then return "bottom" end
	if w.snapped == "right" or w.snapped == "max" then return "right" end
	local s = screenSize()
	local c = localPos(w.frame).X + w.frame.AbsoluteSize.X / 2
	return c < s.X / 2 and "left" or "right"
end

local function placeMin(w)
	local b = w.minBtn
	b.Visible = #w.panes > 0
	if w.tool then b.Position = UDim2.new(1, -61, 0, 2) return end
	if sideOf(w) == "left" then b.Position = UDim2.fromOffset(1, 2)
	else b.Position = UDim2.new(1, -31, 0, 2) end
end

local function paintTabs(w, animate)
	for _, t in ipairs(w.tabs) do
		local sel = t.pane == w.active
		local goal = {
			Size = UDim2.new(t.scaleW, -4, 0, sel and K.TAB_H - 3 or K.TAB_H - 8),
			BackgroundColor3 = sel and Configuration.Theme.TabActive or Configuration.Theme.Header,
			TextColor3 = sel and Configuration.Theme.TabText or Configuration.Theme.Dim,
		}
		t.button.TextSize = sel and 15 or 14
		t.button.Font = sel and Enum.Font.SourceSansBold or Enum.Font.SourceSans
		if animate then
			Services.TweenService:Create(t.button, TweenInfo.new(0.12, Enum.EasingStyle.Quad), goal):Play()
		else for k, v in pairs(goal) do t.button[k] = v end end
	end
end
local function clearTabs(w)
	for _, t in ipairs(w.tabs) do t.button:Destroy() end
	table.clear(w.tabs)
end
local function rebuildTabs(w)
	clearTabs(w)
	local n = #w.panes
	for i, p in ipairs(w.panes) do
		local b = new("TextButton", {
			AnchorPoint = Vector2.new(0, 1), Position = UDim2.new((i - 1) / n, 2, 1, 0),
			Size = UDim2.new(1 / n, -4, 0, K.TAB_H - 8), BorderSizePixel = 0, AutoButtonColor = false,
			Font = Enum.Font.SourceSans, TextSize = 14, Text = p.title, BackgroundColor3 = Configuration.Theme.Header,
			TextColor3 = Configuration.Theme.Dim, ZIndex = 5,
		}, w.tabHolder)
		new("UICorner", { CornerRadius = UDim.new(0, 3) }, b)
		w.tabs[#w.tabs + 1] = { button = b, pane = p, scaleW = 1 / n }
		b.MouseEnter:Connect(function() if w.active ~= p then b.BackgroundColor3 = Configuration.Theme.Hover end end)
		b.MouseLeave:Connect(function() if w.active ~= p then b.BackgroundColor3 = Configuration.Theme.Header end end)
		b.InputBegan:Connect(function(i) if isMouse(i) then beginDrag(w, i, "tab", p) end end)
	end
	paintTabs(w, false)
end
local function placePaneButtons(w)
	local minOnRight = #w.panes > 0 and (w.tool or sideOf(w) ~= "left")
	for idx, p in ipairs(w.panes) do
		if p.buttons then
			local onTop = idx == 1 or w.mode == "tabs"
			local x = (minOnRight and onTop) and (w.tool and 62 or 32) or 2
			for _, b in ipairs(p.buttons) do
				x += b.Size.X.Offset
				b.Position = UDim2.new(1, -x, 0, 2)
				x += 2
			end
		end
	end
end
local function layoutWindow(w)
	local n = #w.panes
	w.splitter.Visible = false
	w.tabBar.Visible = false
	if n == 0 then placeMin(w) return end
	if n == 1 then
		local p = w.panes[1].frame
		p.Visible = true; p.Position = UDim2.new(); p.Size = UDim2.fromScale(1, 1)
	elseif w.mode == "tabs" then
		w.tabBar.Visible = true
		for _, p in ipairs(w.panes) do
			p.frame.Visible = (p == w.active)
			p.frame.Position = UDim2.new()
			p.frame.Size = UDim2.new(1, 0, 1, -K.TAB_H)
		end
	else
		local h = w.frame.AbsoluteSize.Y
		local top = math.clamp(math.floor(h * w.ratio), K.TITLE_H + 60, math.max(K.TITLE_H + 60, h - K.TITLE_H - 60))
		local a, b = w.panes[1].frame, w.panes[2].frame
		a.Visible, b.Visible = true, true
		a.Position = UDim2.new(); a.Size = UDim2.new(1, 0, 0, top)
		w.splitter.Visible = true
		w.splitter.Position = UDim2.fromOffset(0, top)
		w.splitter.Size = UDim2.new(1, 0, 0, 4)
		b.Position = UDim2.fromOffset(0, top + 4)
		b.Size = UDim2.new(1, 0, 1, -(top + 4))
	end
	placeMin(w)
	placePaneButtons(w)
end
local function setPanes(w, list, mode, active)
	w.panes = list
	w.mode = mode or "stack"
	w.active = active or list[1]
	for _, p in ipairs(list) do p.frame.Parent = w.frame end
	if #list == 2 and w.mode == "tabs" then rebuildTabs(w) else clearTabs(w) end
	layoutWindow(w)
end

local function bottomHeight(w, s)
	local v = w.bottomH or math.floor(s.Y * 0.32)
	return math.min(math.max(v, 120), math.max(120, s.Y - 160))
end
local function reservedBottom(except)
	local s, h = screenSize(), 0
	for _, o in ipairs(Windows) do
		if o ~= except and o.snapped == "bottom" and isOpen(o) then
			h = math.max(h, bottomHeight(o, s))
		end
	end
	return h
end
local function sideWidth(w, s) return math.min(s.X, math.max(220, w.snapWidth or math.floor(s.X * 0.25))) end
local function snapRect(w, zone)
	local s = screenSize()
	local avail = s.Y - reservedBottom(w)
	if zone == "left" then
		return UDim2.fromOffset(0, 0), UDim2.fromOffset(sideWidth(w, s), avail)
	elseif zone == "right" then
		local sw = sideWidth(w, s)
		return UDim2.fromOffset(s.X - sw, 0), UDim2.fromOffset(sw, avail)
	elseif zone == "max" then
		return UDim2.fromOffset(0, 0), UDim2.fromOffset(s.X, avail)
	elseif zone == "bottom" then
		local bh = bottomHeight(w, s)
		return UDim2.fromOffset(0, s.Y - bh), UDim2.fromOffset(s.X, bh)
	end
end
local function tweenWindow(w, pos, size, instant)
	if w.tween then w.tween:Cancel(); w.tween = nil end
	if instant then w.frame.Position, w.frame.Size = pos, size; layoutWindow(w); return end
	local t = Services.TweenService:Create(w.frame, K.tweenInfo, { Position = pos, Size = size })
	w.tween = t
	t.Completed:Connect(function()
		if w.tween == t then w.tween = nil end
		layoutWindow(w); renderTree()
	end)
	t:Play()
end
refreshDocks = function(animate)
	for _, w in ipairs(Windows) do
		if w.snapped and isOpen(w) then
			local pos, size = snapRect(w, w.snapped)
			tweenWindow(w, pos, size, not animate)
		end
		placeMin(w)
	end
	placeRestoreButtons()
end
local function hiddenPos(w, side)
	local s = screenSize()
	local p, sz = localPos(w.frame), w.frame.AbsoluteSize
	if side == "left" then return UDim2.fromOffset(-sz.X - 6, p.Y) end
	if side == "bottom" then return UDim2.fromOffset(p.X, s.Y + 6) end
	return UDim2.fromOffset(s.X + 6, p.Y)
end
placeRestoreButtons = function()
	local s = screenSize()
	local used = {}
	for _, w in ipairs(Windows) do
		local r = w.restore
		if w.minimized and #w.panes > 0 then
			local side = w.minSide or "right"
			local shift = used[side] or 0
			used[side] = shift + 1
			if side == "bottom" then
				r.Size = UDim2.fromOffset(44, 20)
				r.Position = UDim2.fromOffset(s.X / 2 + shift * 52, s.Y - 10)
				r.Text = "▲"
			else
				r.Size = UDim2.fromOffset(20, 44)
				local y = math.clamp((w.minY or s.Y / 2) + shift * 52, 30, math.max(30, s.Y - 30))
				r.Position = side == "left" and UDim2.fromOffset(10, y) or UDim2.fromOffset(s.X - 10, y)
				r.Text = side == "left" and "▶" or "◀"
			end
			r.Visible = true
		else
			r.Visible = false
		end
	end
end
local function setCollapsed(w, on, instant)
	if (w.collapsed or false) == on then return end
	if w.tween then w.tween:Cancel(); w.tween = nil end
	local width = w.frame.AbsoluteSize.X
	if on then
		if w.snapped then
			local p = localPos(w.frame)
			local s = screenSize()
			w.snapped = nil
			width = math.max(220, w.floatSize.X.Offset)
			w.expandedH = math.max(260, w.floatSize.Y.Offset)
			w.frame.Position = UDim2.fromOffset(math.clamp(p.X, 0, math.max(0, s.X - width)), math.max(0, p.Y))
		else
			w.expandedH = w.frame.AbsoluteSize.Y
		end
	end
	w.collapsed = on
	for _, h in ipairs({ w.grip, w.leftEdge, w.rightEdge, w.bottomEdge, w.topEdge }) do h.Visible = not on end
	local goal = on and UDim2.fromOffset(width, K.TITLE_H)
		or UDim2.fromOffset(width, math.max(260, w.expandedH or w.floatSize.Y.Offset))
	if not on then w.floatSize = goal end
	if instant then
		w.frame.Size = goal; layoutWindow(w)
	else
		tweenWindow(w, w.frame.Position, goal)
	end
	refreshDocks(false)
end
local function minimize(w)
	if w.tool then setCollapsed(w, not w.collapsed) return end
	if w.minimized or #w.panes == 0 then return end
	local side = sideOf(w)
	w.minSide = side
	w.minY = localPos(w.frame).Y + w.frame.AbsoluteSize.Y / 2
	if not w.snapped then w.restorePos = w.frame.Position end
	w.minimized = true
	hideMenu(); hidePicker()
	if w.tween then w.tween:Cancel(); w.tween = nil end
	local t = Services.TweenService:Create(w.frame, K.tweenInfo, { Position = hiddenPos(w, side) })
	w.tween = t
	t.Completed:Connect(function(state)
		if w.tween == t then w.tween = nil end
		if state == Enum.PlaybackState.Completed and w.minimized then w.frame.Visible = false end
	end)
	t:Play()
	refreshDocks(true)
end
local function restore(w)
	if not w.minimized then return end
	w.minimized = false
	w.frame.Visible = true
	bringToFront(w)
	if not w.snapped then tweenWindow(w, w.restorePos or w.frame.Position, w.frame.Size) end
	refreshDocks(true)
end
local function detach(w, pane)
	local o = otherWin(w)
	if not o or #o.panes > 0 or #w.panes < 2 then return nil end
	local pos, size = localPos(pane.frame), pane.frame.AbsoluteSize
	if w.mode == "stack" then
		w.lastRatio = (w.panes[2] == pane) and w.ratio or (1 - w.ratio)
	end
	local rest = {}
	for _, p in ipairs(w.panes) do if p ~= pane then rest[#rest + 1] = p end end
	setPanes(w, rest, "stack")
	local sz = Vector2.new(math.max(220, size.X), math.max(260, size.Y))
	if o.tween then o.tween:Cancel(); o.tween = nil end
	o.snapped, o.minimized = nil, false
	o.frame.Size = UDim2.fromOffset(sz.X, sz.Y)
	o.floatSize = o.frame.Size
	o.frame.Position = UDim2.fromOffset(pos.X, pos.Y)
	o.frame.Visible = true
	setPanes(o, { pane }, "stack")
	bringToFront(o)
	return o, pos
end
local function merge(host, w, where)
	local pane, hostPane = w.panes[1], host.panes[1]
	w.snapped = nil
	if w.tween then w.tween:Cancel(); w.tween = nil end
	setPanes(w, {}, "stack")
	w.frame.Visible = false
	if where == "tabs" then
		setPanes(host, { hostPane, pane }, "tabs", pane)
	elseif where == "top" then
		host.ratio = 1 - host.lastRatio
		setPanes(host, { pane, hostPane }, "stack")
	else
		host.ratio = host.lastRatio
		setPanes(host, { hostPane, pane }, "stack")
	end
	bringToFront(host)
	if not host.snapped and where ~= "tabs" and not Delve_IsMobile then
		local s = screenSize()
		local p, sz = localPos(host.frame), host.frame.AbsoluteSize
		local want = math.min(s.Y, math.max(sz.Y, 560))
		if want > sz.Y then
			local y = math.max(0, math.min(p.Y, s.Y - want))
			host.floatSize = UDim2.fromOffset(sz.X, want)
			tweenWindow(host, UDim2.fromOffset(p.X, y), host.floatSize)
		end
	end
	refreshDocks(true); renderTree()
end

UI.previewLabel = new("TextLabel", {
	BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Font = Enum.Font.SourceSansBold, TextSize = 16,
	TextColor3 = Configuration.Theme.TabText, Text = "", ZIndex = 31,
}, UI.snapPreview)
local function zoneAt(w, m)
	if Delve_IsMobile then return nil end
	local s = screenSize()
	if m.Y <= 10 then return "max" end
	if m.X <= 10 then return "left" end
	if m.X >= s.X - 10 then return "right" end
	if m.Y >= s.Y - 10 then
		local o = otherWin(w)
		if not (o and o.snapped == "bottom" and isOpen(o)) then return "bottom" end
	end
	return nil
end
local function targetAt(w, m)
	if Delve_IsMobile then return nil end
	local o = otherWin(w)
	if o and #w.panes == 1 and #o.panes == 1 and isOpen(o) then
		local a, s = localPos(o.frame), o.frame.AbsoluteSize
		if m.X >= a.X and m.X <= a.X + s.X and m.Y >= a.Y and m.Y <= a.Y + s.Y then
			local ry = (m.Y - a.Y) / math.max(1, s.Y)
			local where = ry >= 0.62 and "bottom" or (ry <= 0.22 and "top" or "tabs")
			return { kind = "dock", host = o, where = where, key = "dock:" .. where }
		end
	end
	local z = zoneAt(w, m)
	if z then return { kind = "snap", zone = z, key = z } end
	return nil
end
local function showPreview(w, target)
	local key = target and target.key or nil
	if key == State.currentPreview then return end
	State.currentPreview = key
	if not target then UI.snapPreview.Visible = false return end
	local pos, size
	if target.kind == "snap" then
		pos, size = snapRect(w, target.zone)
	else
		local h = target.host
		local a, s = localPos(h.frame), h.frame.AbsoluteSize
		if target.where == "tabs" then
			pos, size = UDim2.fromOffset(a.X, a.Y), UDim2.fromOffset(s.X, s.Y)
		elseif target.where == "top" then
			local th = math.floor(s.Y * (1 - h.lastRatio))
			pos, size = UDim2.fromOffset(a.X, a.Y), UDim2.fromOffset(s.X, th)
		else
			local th = math.floor(s.Y * h.lastRatio)
			pos, size = UDim2.fromOffset(a.X, a.Y + th), UDim2.fromOffset(s.X, s.Y - th)
		end
	end
	if not UI.snapPreview.Visible then
		local m = mousePos()
		UI.snapPreview.Position = UDim2.fromOffset(m.X, m.Y)
		UI.snapPreview.Size = UDim2.fromOffset(0, 0)
	end
	UI.previewLabel.Text = K.PREVIEW_TEXT[key] or ""
	UI.snapPreview.Visible = true
	Services.TweenService:Create(UI.snapPreview, K.tweenInfo, { Position = pos, Size = size }):Play()
end

local function stepDrag()
	local d = State.drag
	if not d then return end
	if not d.touch and not Services.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		endDrag(); return
	end
	local m = mousePos()
	local w = d.win
	if not d.moved then
		if (m - d.start).Magnitude < 4 then return end
		d.moved = true
		if (d.kind == "detach" or d.kind == "tab") and #w.panes > 1 then
			local nw, pos = detach(w, d.pane)
			if nw then
				w = nw; d.win = nw
				d.grab = Vector2.new(
					math.clamp(m.X - pos.X, 8, math.max(8, nw.frame.Size.X.Offset - 30)),
					math.clamp(m.Y - pos.Y, 4, K.TITLE_H - 4))
			end
		elseif w.snapped then
			local rel = d.grab.X / math.max(1, w.frame.AbsoluteSize.X)
			w.snapped = nil
			if w.tween then w.tween:Cancel(); w.tween = nil end
			w.frame.Size = w.floatSize
			d.grab = Vector2.new(w.floatSize.X.Offset * rel, math.clamp(d.grab.Y, 4, K.TITLE_H - 4))
			layoutWindow(w)
			refreshDocks(false)
		end
		d.kind = "move"
	end
	if w.tween then w.tween:Cancel(); w.tween = nil end
	local s = screenSize()
	local ww = w.frame.AbsoluteSize.X
	local x = math.clamp(m.X - d.grab.X, 60 - ww, s.X - 60)
	local y = math.clamp(m.Y - d.grab.Y, 0, math.max(0, s.Y - K.TITLE_H))
	w.frame.Position = UDim2.fromOffset(x, y)
	showPreview(w, targetAt(w, m))
end
beginDrag = function(w, input, kind, pane)
	if State.drag or w.minimized then return end
	local m = mousePos()
	if inside(w.minBtn, m) or (w.closeBtn and inside(w.closeBtn, m)) then return end
	if pane and pane.buttons then
		for _, b in ipairs(pane.buttons) do if b.Visible and inside(b, m) then return end end
	end
	State.drag = {
		win = w, kind = kind, pane = pane, start = m, moved = false,
		grab = m - localPos(w.frame),
		touch = input.UserInputType == Enum.UserInputType.Touch,
	}
	bringToFront(w); hideMenu(); hidePicker()
	State.dragConn = Services.RunService.RenderStepped:Connect(stepDrag)
end
endDrag = function()
	local d = State.drag
	State.drag = nil
	if State.dragConn then State.dragConn:Disconnect(); State.dragConn = nil end
	if not d then return end
	local w = d.win
	if not d.moved then
		showPreview(w, nil)
		if d.kind == "tab" and w.active ~= d.pane then
			w.active = d.pane
			layoutWindow(w); paintTabs(w, true); renderTree()
		end
		return
	end
	local target = targetAt(w, mousePos())
	showPreview(w, nil)
	if target and target.kind == "dock" then
		merge(target.host, w, target.where)
	elseif target and target.kind == "snap" then
		if w.collapsed then setCollapsed(w, false, true) end
		w.floatSize = w.frame.Size
		w.snapped = target.zone
		refreshDocks(true)
	else
		if not w.collapsed then w.floatSize = w.frame.Size end
		placeMin(w); renderTree()
	end
end
Services.UserInputService.InputEnded:Connect(function(i) if State.drag and isMouse(i) then endDrag() end end)

for _, p in pairs(Panes) do
	p.header.InputBegan:Connect(function(i)
		if not isMouse(i) then return end
		local w = ownerOf(p)
		if not w then return end
		local kind = "move"
		if #w.panes == 2 and w.mode == "stack" and w.panes[2] == p then kind = "detach" end
		beginDrag(w, i, kind, p)
	end)
end

local function makeResizer(w, handle, edges)
	local active, startM, startPos, startSize = false, nil, nil, nil
	handle.InputBegan:Connect(function(i)
		if not isMouse(i) or w.minimized or w.collapsed or State.drag then return end
		if edges.top and w.snapped and w.snapped ~= "bottom" then return end
		if edges.bottom and w.snapped == "bottom" then return end
		if w.tween then w.tween:Cancel(); w.tween = nil end
		active = true
		startM = mousePos()
		startPos = localPos(w.frame)
		startSize = w.frame.AbsoluteSize
		local keep = (w.snapped == "right" and edges.left and not edges.bottom)
			or (w.snapped == "left" and edges.right and not edges.bottom)
			or (w.snapped == "bottom" and edges.top)
		if w.snapped and not keep then
			local was = w.snapped
			w.snapped = nil
			w.frame.Position = UDim2.fromOffset(startPos.X, startPos.Y)
			w.frame.Size = UDim2.fromOffset(startSize.X, startSize.Y)
			if was == "bottom" then refreshDocks(false) end
		end
	end)
	Services.UserInputService.InputChanged:Connect(function(i)
		if not (active and isMove(i)) then return end
		local dl = mousePos() - startM
		local s = screenSize()
		local x, y, wd, h = startPos.X, startPos.Y, startSize.X, startSize.Y
		if edges.right then wd = math.max(220, startSize.X + dl.X) end
		if edges.left then
			wd = math.max(220, startSize.X - dl.X)
			x = startPos.X + startSize.X - wd
		end
		if edges.bottom then h = math.max(260, startSize.Y + dl.Y) end
		if edges.top then
			h = math.max(w.snapped == "bottom" and 120 or 260, startSize.Y - dl.Y)
			y = startPos.Y + startSize.Y - h
		end
		wd = math.min(wd, s.X)
		if w.snapped == "bottom" then
			w.bottomH = h
			refreshDocks(false)
		elseif w.snapped then
			w.snapWidth = wd
			refreshDocks(false)
		else
			w.frame.Position = UDim2.fromOffset(x, y)
			w.frame.Size = UDim2.fromOffset(wd, h)
			w.floatSize = w.frame.Size
		end
	end)
	Services.UserInputService.InputEnded:Connect(function(i)
		if active and isMouse(i) then active = false; renderTree() end
	end)
end
local function makeSplitter(w)
	local sp = w.splitter
	local splitting, startY, startRatio = false, 0, 0.5
	sp.MouseEnter:Connect(function() sp.BackgroundColor3 = Configuration.Theme.Accent end)
	sp.MouseLeave:Connect(function() if not splitting then sp.BackgroundColor3 = Configuration.Theme.Border end end)
	sp.InputBegan:Connect(function(i)
		if not isMouse(i) then return end
		splitting = true; startY = mousePos().Y; startRatio = w.ratio
	end)
	Services.UserInputService.InputChanged:Connect(function(i)
		if splitting and isMove(i) then
			local h = math.max(1, w.frame.AbsoluteSize.Y)
			w.ratio = math.clamp(startRatio + (mousePos().Y - startY) / h, 0.15, 0.85)
			layoutWindow(w)
		end
	end)
	Services.UserInputService.InputEnded:Connect(function(i)
		if splitting and isMouse(i) then splitting = false; sp.BackgroundColor3 = Configuration.Theme.Border; renderTree() end
	end)
end
local function closeWindow(w)
	if w.tween then w.tween:Cancel(); w.tween = nil end
	w.closed = true
	w.minimized = false
	w.snapped = nil
	w.frame.Visible = false
	if w.onClose then pcall(w.onClose) end
	refreshDocks(false)
end
wireWindow = function(w)
	if w.wired then return end
	w.wired = true
	makeResizer(w, w.grip, { right = true, bottom = true })
	makeResizer(w, w.leftEdge, { left = true })
	makeResizer(w, w.rightEdge, { right = true })
	makeResizer(w, w.bottomEdge, { bottom = true })
	makeResizer(w, w.topEdge, { top = true })
	makeSplitter(w)
	w.splitter.BackgroundTransparency = 1
	K.cursorHandle(w.grip, "nwse")
	K.cursorHandle(w.leftEdge, "ew")
	K.cursorHandle(w.rightEdge, "ew")
	K.cursorHandle(w.bottomEdge, "ns")
	K.cursorHandle(w.topEdge, "ns")
	K.cursorHandle(w.splitter, "split")
	w.frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() layoutWindow(w) end)
	w.minBtn.MouseButton1Click:Connect(function() minimize(w) end)
	w.restore.MouseButton1Click:Connect(function() restore(w) end)
	if w.closeBtn then w.closeBtn.MouseButton1Click:Connect(function() closeWindow(w) end) end
	w.frame.InputBegan:Connect(function(i) if isMouse(i) or i.UserInputType == Enum.UserInputType.MouseButton2 then bringToFront(w) end end)
end
for _, w in ipairs(Windows) do wireWindow(w) end

local function slideTween(obj, goal) return Services.TweenService:Create(obj, K.tweenInfo, goal) end
local function closePane(pane)
	local w = ownerOf(pane)
	if not w or pane.closing then return end
	hideMenu(); hidePicker()
	local rest = {}
	for _, p in ipairs(w.panes) do if p ~= pane then rest[#rest + 1] = p end end
	pane.closing = true
	local function finish()
		pane.closing = nil
		pane.tween = nil
		pane.frame.Parent = nil
		pane.frame.Visible = false
		if #rest == 0 then
			setPanes(w, {}, "stack")
			w.frame.Visible = false
			w.closed = true
		else
			setPanes(w, rest, "stack")
		end
		refreshDocks(false); renderTree()
	end
	if w.tween then w.tween:Cancel(); w.tween = nil end
	local t
	if #rest == 0 then
		if not w.snapped then w.restorePos = w.frame.Position end
		t = slideTween(w.frame, { Position = hiddenPos(w, sideOf(w)) })
		w.tween = t
	else
		w.splitter.Visible = false
		w.tabBar.Visible = false
		local isTop = w.panes[1] == pane
		t = slideTween(pane.frame, isTop and { Size = UDim2.new(1, 0, 0, 0) }
			or { Position = UDim2.new(0, 0, 1, 0), Size = UDim2.new(1, 0, 0, 0) })
		rest[1].frame.Visible = true
		slideTween(rest[1].frame, { Position = UDim2.new(), Size = UDim2.fromScale(1, 1) }):Play()
	end
	pane.tween = t
	t.Completed:Connect(function(state)
		if w.tween == t then w.tween = nil end
		if state == Enum.PlaybackState.Completed then finish() else pane.closing = nil end
	end)
	t:Play()
end

local function openPane(pane)
	UI.gui.Enabled = true
	if pane.tween then pane.tween:Cancel(); pane.tween = nil end
	pane.closing = nil
	local w = ownerOf(pane)
	if w and not w.closed then
		if w.minimized then restore(w) end
		if w.mode == "tabs" then w.active = pane; paintTabs(w, true) end
		w.frame.Visible = true
		bringToFront(w); layoutWindow(w); refreshDocks(false)
		return
	end
	local host
	for _, o in ipairs({ mainWin, sideWin }) do
		if #o.panes == 1 and not o.closed and o.panes[1] ~= pane then host = o break end
	end
	host = host or mainWin
	local wasHidden = #host.panes == 0 or host.closed or not host.frame.Visible
	local list = table.clone(host.panes)
	if pane == Panes.explorer then table.insert(list, 1, pane) else list[#list + 1] = pane end
	if host.tween then host.tween:Cancel(); host.tween = nil end
	host.closed, host.minimized = false, false
	if Delve_IsMobile then host.snapped = nil end
	setPanes(host, list, "stack")
	host.frame.Visible = true
	bringToFront(host)
	local s = screenSize()
	local pos, size
	if host.snapped then
		pos, size = snapRect(host, host.snapped)
	else
		local fs = host.floatSize
		size = UDim2.fromOffset(math.min(fs.X.Offset, s.X), math.min(fs.Y.Offset, s.Y))
		local rp = host.restorePos or host.frame.Position
		pos = UDim2.fromOffset(math.clamp(rp.X.Offset, 0, math.max(0, s.X - size.X.Offset)),
			math.clamp(rp.Y.Offset, 0, math.max(0, s.Y - size.Y.Offset)))
	end
	host.frame.Size = size
	refreshDocks(false)
	layoutWindow(host)
	if wasHidden then
		local side = host.snapped == "left" and "left" or (host.snapped == "bottom" and "bottom")
			or ((pos.X.Offset + size.X.Offset / 2 < s.X / 2) and "left" or "right")
		local from
		if side == "left" then from = UDim2.fromOffset(-size.X.Offset - 6, pos.Y.Offset)
		elseif side == "bottom" then from = UDim2.fromOffset(pos.X.Offset, s.Y + 6)
		else from = UDim2.fromOffset(s.X + 6, pos.Y.Offset) end
		host.frame.Position = from
		local t = slideTween(host.frame, { Position = pos })
		host.tween = t
		t.Completed:Connect(function() if host.tween == t then host.tween = nil end; layoutWindow(host) end)
		t:Play()
	elseif #host.panes == 2 then
		host.frame.Position = pos
		local f, other = pane.frame, (host.panes[1] == pane and host.panes[2] or host.panes[1]).frame
		local gp, gs, op, os_ = f.Position, f.Size, other.Position, other.Size
		host.splitter.Visible = false
		other.Position, other.Size = UDim2.new(), UDim2.fromScale(1, 1)
		if host.panes[1] == pane then f.Position, f.Size = UDim2.new(), UDim2.new(1, 0, 0, 0)
		else f.Position, f.Size = UDim2.new(0, 0, 1, 0), UDim2.new(1, 0, 0, 0) end
		slideTween(other, { Position = op, Size = os_ }):Play()
		local t = slideTween(f, { Position = gp, Size = gs })
		pane.tween = t
		t.Completed:Connect(function() pane.tween = nil; layoutWindow(host) end)
		t:Play()
	end
	markDirty(); renderTree()
end
local function togglePane(pane)
	local w = ownerOf(pane)
	if w and isOpen(w) and not pane.closing then closePane(pane) else openPane(pane) end
end
Delve.closePane, Delve.openPane, Delve.togglePane = closePane, openPane, togglePane

UI.gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() refreshDocks(false) end)

setPanes(mainWin, { Panes.explorer, Panes.props }, "stack")

Delve.Theme = Configuration.Theme
Delve.Windows = Windows
Delve.new = new
Delve.stroke = stroke
Delve.divider = divider
Delve.createWindow = createWindow
Delve.setPanes = setPanes
Delve.screenSize = screenSize
Delve.inside = inside
Delve.mousePos = function() return mousePos() end
Delve.gui = UI.gui
Delve.FONT = Enum.Font.SourceSans
Delve.FONT_BOLD = Enum.Font.SourceSansBold
Delve.FONT_CODE = Enum.Font.RobotoMono
Delve.TITLE_H = K.TITLE_H

local function newPane(name, title, font)
	local frame = new("Frame", { Name = name:lower(), BackgroundTransparency = 1, ClipsDescendants = true }, nil)
	local header = paneHeader(frame, title, font)
	local body = new("Frame", { BackgroundTransparency = 1, Position = UDim2.fromOffset(0, K.TITLE_H), Size = UDim2.new(1, 0, 1, -K.TITLE_H) }, frame)
	local label = header:FindFirstChildOfClass("TextLabel")
	if label then
		label.Size = UDim2.new(1, -110, 1, 0)
		label.Position = UDim2.fromOffset(55, 0)
		label.TextTruncate = Enum.TextTruncate.AtEnd
	end
	local pane = { id = name, title = title, frame = frame, header = header, body = body, label = label }
	header.InputBegan:Connect(function(i)
		if not isMouse(i) then return end
		local w = ownerOf(pane)
		if w then beginDrag(w, i, "move", pane) end
	end)
	return pane
end
Delve.newPane = newPane

K.LUA_KEYWORDS = {}
for _, kw in ipairs({
	"and", "break", "do", "else", "elseif", "end", "for", "function", "if", "in",
	"local", "not", "or", "repeat", "return", "then", "until", "while",
}) do K.LUA_KEYWORDS[kw] = true end

K.BUILTINS = {}
for _, w in ipairs({
	"assert", "collectgarbage", "error", "gcinfo", "getfenv", "getmetatable", "ipairs", "loadstring",
	"newproxy", "next", "pairs", "pcall", "print", "rawequal", "rawget", "rawlen", "rawset", "select",
	"setfenv", "setmetatable", "tonumber", "tostring", "type", "typeof", "unpack", "xpcall", "require",
	"delay", "elapsedTime", "settings", "spawn", "stats", "tick", "time", "UserSettings", "version", "wait",
	"warn", "game", "workspace", "Workspace", "script", "plugin", "shared", "_G", "_VERSION",
	"math", "string", "table", "task", "coroutine", "os", "debug", "utf8", "bit32", "buffer",
	"Axes", "BrickColor", "CatalogSearchParams", "CFrame", "Color3", "ColorSequence", "ColorSequenceKeypoint",
	"DateTime", "DockWidgetPluginGuiInfo", "Enum", "Faces", "FloatCurveKey", "Font", "Instance",
	"NumberRange", "NumberSequence", "NumberSequenceKeypoint", "OverlapParams", "Path2DControlPoint",
	"PathWaypoint", "PhysicalProperties", "Random", "Ray", "RaycastParams", "Rect", "Region3",
	"Region3int16", "RotationCurveKey", "SharedTable", "TweenInfo", "UDim", "UDim2", "Vector2",
	"Vector2int16", "Vector3", "Vector3int16", "Content",
}) do K.BUILTINS[w] = true end

K.BUILTIN_LIBS = {
	math = true, string = true, table = true, task = true, coroutine = true, os = true,
	debug = true, utf8 = true, bit32 = true, buffer = true,
}

K.OPS2 = {}
for _, o in ipairs({ "==", "~=", "<=", ">=", "..", "::", "->", "+=", "-=", "*=", "/=", "%=", "^=", "//" }) do K.OPS2[o] = true end

function K.scanTokens(src, out, alive)
	local find, sub, byte = string.find, string.sub, string.byte
	local i, n = 1, #src
	local steps = 0
	while i <= n do
		steps += 1
		if alive and steps % 3000 == 0 then
			wait()
			if not alive() then return false end
		end
		local c = byte(src, i)
		local s, e = find(src, "^%s+", i)
		if s then
			out[#out + 1] = { "ws", sub(src, s, e) }
			i = e + 1
		elseif c == 45 and byte(src, i + 1) == 45 then
			local _, le, eq = find(src, "^%[(=*)%[", i + 2)
			local j
			if le then
				local _, ce = find(src, "]" .. eq .. "]", le + 1, true)
				j = ce or n
			else
				j = (find(src, "\n", i, true) or (n + 1)) - 1
			end
			out[#out + 1] = { "comment", sub(src, i, j) }
			i = j + 1
		elseif c == 91 and find(src, "^%[=*%[", i) then
			local _, le, eq = find(src, "^%[(=*)%[", i)
			local _, ce = find(src, "]" .. eq .. "]", le + 1, true)
			local j = ce or n
			out[#out + 1] = { "string", sub(src, i, j) }
			i = j + 1
		elseif c == 34 or c == 39 then
			local j = i + 1
			while j <= n do
				local d = byte(src, j)
				if d == 92 then j += 2
				elseif d == c then break
				elseif d == 10 then j -= 1; break
				else j += 1 end
			end
			if j > n then j = n end
			out[#out + 1] = { "string", sub(src, i, j) }
			i = j + 1
		elseif c == 96 then
			local j, segStart = i + 1, i
			while j <= n do
				local d = byte(src, j)
				if d == 92 then
					j += 2
				elseif d == 96 then
					break
				elseif d == 123 then
					if j > segStart then out[#out + 1] = { "string", sub(src, segStart, j - 1) } end
					out[#out + 1] = { "op", "{" }
					local depth, k = 1, j + 1
					while k <= n do
						local b = byte(src, k)
						if b == 123 then depth += 1
						elseif b == 125 then
							depth -= 1
							if depth == 0 then break end
						end
						k += 1
					end
					K.scanTokens(sub(src, j + 1, k - 1), out, nil)
					if k <= n then out[#out + 1] = { "op", "}" } end
					j = k + 1
					segStart = j
				else
					j += 1
				end
			end
			if j > n then j = n end
			if j >= segStart then out[#out + 1] = { "string", sub(src, segStart, j) } end
			i = j + 1
		elseif (c >= 48 and c <= 57) or (c == 46 and find(src, "^%.%d", i)) then
			s, e = find(src, "^0[xX][%x_]+", i)
			if not s then s, e = find(src, "^0[bB][01_]+", i) end
			if not s then
				s, e = find(src, "^[%d_]*%.?[%d_]*", i)
				local _, ee = find(src, "^[eE][%+%-]?[%d_]+", e + 1)
				if ee then e = ee end
			end
			out[#out + 1] = { "number", sub(src, i, e) }
			i = e + 1
		elseif (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or c == 95 then
			s, e = find(src, "^[%a_][%w_]*", i)
			out[#out + 1] = { "id", sub(src, s, e) }
			i = e + 1
		elseif c >= 128 then
			s, e = find(src, "^[\128-\255]+", i)
			out[#out + 1] = { "text", sub(src, s, e) }
			i = e + 1
		else
			local three = sub(src, i, i + 2)
			if three == "..." or three == "..=" or three == "//=" then
				out[#out + 1] = { "op", three }; i += 3
			else
				local two = sub(src, i, i + 1)
				if K.OPS2[two] then
					out[#out + 1] = { "op", two }; i += 2
				else
					out[#out + 1] = { "op", sub(src, i, i) }; i += 1
				end
			end
		end
	end
	return true
end

function K.classifyTokens(tokens)
	local count = #tokens
	local function nextSig(k)
		local j = k + 1
		while j <= count do
			local kind = tokens[j][1]
			if kind ~= "ws" and kind ~= "comment" then return tokens[j] end
			j += 1
		end
		return nil
	end
	local prev, prev2
	for k = 1, count do
		local tok = tokens[k]
		if tok[1] == "id" then
			local w = tok[2]
			local nx = nextSig(k)
			local nk, nt = nx and nx[1], nx and nx[2]
			local afterDot = prev ~= nil and prev[1] == "op" and (prev[2] == "." or prev[2] == ":")
			local isCall = nx ~= nil and ((nk == "op" and (nt == "(" or nt == "{")) or nk == "string")
			if not afterDot and K.LUA_KEYWORDS[w] then
				tok[1] = "keyword"
			elseif not afterDot and (w == "true" or w == "false") then
				tok[1] = "bool"
			elseif not afterDot and w == "nil" then
				tok[1] = "nil"
			elseif not afterDot and w == "self" then
				tok[1] = "self"
			elseif not afterDot and w == "continue"
				and not (nk == "op" and (nt == "(" or nt == "=" or nt == "." or nt == ":" or nt == "[")) then
				tok[1] = "keyword"
			elseif not afterDot and w == "export" and nk == "id" and nt == "type" then
				tok[1] = "keyword"
			elseif not afterDot and w == "type" and nk == "id" then
				tok[1] = "keyword"
			elseif prev and prev[1] == "keyword" and prev[2] == "function" then
				tok[1] = "fn"
			elseif afterDot and prev[2] == ":" and not isCall then
				tok[1] = "id"
			elseif afterDot then
				if prev2 and prev2[1] == "builtin" and K.BUILTIN_LIBS[prev2[2]] then
					tok[1] = "builtin"
				elseif isCall then
					tok[1] = "method"
				else
					tok[1] = "property"
				end
			elseif K.BUILTINS[w] then
				tok[1] = "builtin"
			elseif isCall then
				tok[1] = "fn"
			end
		end
		local kind = tok[1]
		if kind ~= "ws" and kind ~= "comment" then prev2 = prev; prev = tok end
	end
end

function K.escapeRich(s)
	return (s:gsub("[<>&\"']", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;", ['"'] = "&quot;", ["'"] = "&apos;" }))
end

function K.cleanSource(s)
	s = s:gsub("[%z\1-\8\11-\31\127]", "?")
	if utf8.len(s) then return s end
	local out, i, n = {}, 1, #s
	while i <= n do
		local count, bad = utf8.len(s, i)
		if count then
			out[#out + 1] = s:sub(i)
			break
		end
		if bad > i then out[#out + 1] = s:sub(i, bad - 1) end
		out[#out + 1] = "?"
		i = bad + 1
	end
	return table.concat(out)
end

function K.colorHex(c)
	return string.format("#%02X%02X%02X",
		math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
end

function K.highlightLines(source, alive)
	local tokens = {}
	if not K.scanTokens(source, tokens, alive) then return nil end
	K.classifyTokens(tokens)
	local T = Configuration.Theme
	local hex = {
		keyword = K.colorHex(T.CodeKeyword), bool = K.colorHex(T.CodeBool), ["nil"] = K.colorHex(T.CodeNil),
		self = K.colorHex(T.CodeSelf), builtin = K.colorHex(T.CodeBuiltin), fn = K.colorHex(T.CodeFn),
		method = K.colorHex(T.CodeMethod), property = K.colorHex(T.CodeProperty), string = K.colorHex(T.CodeString),
		comment = K.colorHex(T.CodeComment), number = K.colorHex(T.CodeNumber), op = K.colorHex(T.CodeOp),
		id = K.colorHex(T.CodeText), text = K.colorHex(T.CodeText),
	}
	local plain = hex.id
	local lines, cur, runBuf = {}, {}, {}
	local runHex = plain
	local find, sub = string.find, string.sub
	local function flush()
		if #runBuf == 0 then return end
		local text = K.escapeRich(table.concat(runBuf))
		table.clear(runBuf)
		if runHex ~= plain then
			cur[#cur + 1] = '<font color="' .. runHex .. '">' .. text .. "</font>"
		else
			cur[#cur + 1] = text
		end
	end
	local function endLine()
		flush()
		lines[#lines + 1] = table.concat(cur)
		table.clear(cur)
	end
	for k, tok in ipairs(tokens) do
		if alive and k % 20000 == 0 then
			wait()
			if not alive() then return nil end
		end
		local kind, text = tok[1], tok[2]
		local h = kind == "ws" and runHex or hex[kind] or plain
		if h ~= runHex then flush(); runHex = h end
		local pos = 1
		while true do
			local nl = find(text, "\n", pos, true)
			if not nl then
				if pos <= #text then runBuf[#runBuf + 1] = sub(text, pos) end
				break
			end
			if nl > pos then runBuf[#runBuf + 1] = sub(text, pos, nl - 1) end
			endLine()
			pos = nl + 1
		end
	end
	endLine()
	return lines
end

local function getScriptSource(script)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	local decomp = envFn("decompile")
	if decomp then
		local ok, res = pcall(decomp, script)
		if ok and type(res) == "string" and #res > 0 then return res end
	end
	local ok, src = pcall(function() return script.Source end)
	if ok and type(src) == "string" and #src > 0 then return src end
	local gsb = envFn("getscriptbytecode", "get_script_bytecode")
	if not gsb then return nil, "No decompiler available" end
	local okB, bytecode = pcall(gsb, script)
	if not (okB and type(bytecode) == "string" and #bytecode > 0) then
		return nil, "Could not get bytecode"
	end
	local httpReq = Services.httpRequest or envFn("http_request", "request")
	if type(httpReq) ~= "function" then return nil, "No HTTP library" end
	local endpoints = {
		"https://lua.expert/api/v1/decompile",
		"https://api.lua.expert/decompile",
	}
	for _, url in ipairs(endpoints) do
		local okR, res = pcall(httpReq, {
			Url = url, Method = "POST", Body = bytecode,
			Headers = { ["Content-Type"] = "application/octet-stream" },
		})
		if okR and res then
			local body = res.Body or res.body
			if type(body) == "string" and #body > 0 then
				local src2 = body:match('"source"%s*:%s*"(.-)"') or body:match('"decompiled"%s*:%s*"(.-)"')
				if src2 then
					src2 = src2:gsub("\\n", "\n"):gsub('\\"', '"'):gsub("\\\\", "\\"):gsub("\\t", "\t"):gsub("\\r", "")
					return src2
				end
				if not body:match("^%s*{") then return body end
			end
		end
	end
	return nil, "Decompilation failed"
end

local function toolButton(parent, text, order)
	local ts = Services.TextService
	local okS, sz = pcall(ts.GetTextSize, ts, text, 14, Enum.Font.SourceSansBold, Vector2.new(1000, 24))
	local b = new("TextButton", {
		Name = text, Size = UDim2.fromOffset((okS and math.ceil(sz.X) or #text * 7) + 24, touchH(24)), LayoutOrder = order,
		BackgroundColor3 = Configuration.Theme.Accent, BorderSizePixel = 0, AutoButtonColor = false, ZIndex = 4,
		Font = Enum.Font.SourceSansBold, TextSize = 14, TextColor3 = Configuration.Theme.AccentText, Text = text,
	}, parent)
	new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
	local st = stroke(b, Configuration.Theme.AccentText)
	st.Transparency = 1
	local hover, down = false, false
	local tween
	local function paint()
		local on = b:GetAttribute("On") == true
		local goal = K.accentShade(down and "down" or (on and "on") or (hover and "hover") or nil)
		b.TextColor3 = Configuration.Theme.AccentText
		st.Color = Configuration.Theme.AccentText
		st.Transparency = on and 0.4 or 1
		if tween then tween:Cancel() end
		if Options.LowEnd then b.BackgroundColor3 = goal return end
		tween = Services.TweenService:Create(b, K.fastTween, { BackgroundColor3 = goal })
		tween:Play()
	end
	b.MouseEnter:Connect(function() hover = true; paint() end)
	b.MouseLeave:Connect(function() hover = false; down = false; paint() end)
	b.MouseButton1Down:Connect(function() down = true; paint() end)
	b.MouseButton1Up:Connect(function() down = false; paint() end)
	b:GetAttributeChangedSignal("On"):Connect(paint)
	return b
end

K.TOOLBAR_H = 34
local function bottomBar(body)
	local bar = new("Frame", {
		Name = "toolbar", BackgroundColor3 = Configuration.Theme.Main, BorderSizePixel = 0, ZIndex = 3,
		Size = UDim2.new(1, 0, 0, K.TOOLBAR_H), Position = UDim2.new(1, 0, 1, -K.TOOLBAR_H), AnchorPoint = Vector2.new(1, 0),
		ClipsDescendants = true,
	}, body)
	divider(bar, UDim2.fromOffset(0, 0))
	local holder = new("Frame", {
		BackgroundTransparency = 1, Size = UDim2.new(1, -12, 1, 0), Position = UDim2.fromOffset(6, 0), ZIndex = 3,
	}, bar)
	new("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder,
	}, holder)
	return bar, holder
end

local function showToolWindow(w, offset)
	if w.tween then w.tween:Cancel(); w.tween = nil end
	if w.collapsed then setCollapsed(w, false, true) end
	UI.gui.Enabled = true
	w.closed = false
	w.minimized = false
	w.snapped = nil
	if w.frame.Parent ~= UI.gui then w.frame.Parent = UI.gui end
	local s = screenSize()
	if not w.placed then
		w.placed = true
		local wd = math.clamp(math.floor(s.X * 0.5), 220, math.max(220, s.X - 40))
		local ht = math.clamp(math.floor(s.Y * 0.7), 260, math.max(260, s.Y - 40))
		w.floatSize = UDim2.fromOffset(wd, ht)
		w.frame.Position = UDim2.fromOffset(
			math.floor((s.X - wd) / 2) + (offset or 0),
			math.floor((s.Y - ht) / 2) + (offset or 0))
	end
	local fs = w.floatSize or w.frame.Size
	local wd = math.min(math.max(fs.X.Offset, math.min(220, s.X)), s.X)
	local ht = math.min(math.max(fs.Y.Offset, math.min(260, s.Y)), s.Y)
	w.floatSize = UDim2.fromOffset(wd, ht)
	local p = w.frame.Position
	local x = math.clamp(p.X.Offset, 0, math.max(0, s.X - wd))
	local y = math.clamp(p.Y.Offset, 0, math.max(0, s.Y - ht))
	w.frame.Position = UDim2.fromOffset(x, y)
	w.frame.Size = UDim2.fromOffset(wd, math.floor(ht * 0.94))
	w.frame.Visible = true
	for _, pane in ipairs(w.panes) do pane.frame.Parent = w.frame end
	bringToFront(w)
	layoutWindow(w)
	refreshDocks(false)
	local t = Services.TweenService:Create(w.frame, K.tweenInfo, { Size = w.floatSize })
	w.tween = t
	t.Completed:Connect(function()
		if w.tween == t then w.tween = nil end
		w.frame.Size = w.floatSize
		layoutWindow(w)
	end)
	t:Play()
end

function K.setCorners(corner, tl, tr, bl, br)
	if not corner then return false end
	local sets = {
		{ "TopLeftRadius", "TopRightRadius", "BottomLeftRadius", "BottomRightRadius" },
		{ "TopLeft", "TopRight", "BottomLeft", "BottomRight" },
	}
	for _, n in ipairs(sets) do
		local ok = pcall(function()
			local probe = corner[n[1]]
			local kind = typeof(probe)
			local function v(px)
				if kind == "UDim" then return UDim.new(0, px) end
				if kind == "UDim2" then return UDim2.fromOffset(px, px) end
				if kind == "Vector2" then return Vector2.new(px, px) end
				return px
			end
			corner.CornerRadius = UDim.new(0, math.max(tl, tr, bl, br))
			corner[n[1]] = v(tl)
			corner[n[2]] = v(tr)
			corner[n[3]] = v(bl)
			corner[n[4]] = v(br)
		end)
		if ok then return true end
	end
	return false
end

function K.window(name, title, font)
	local win = createWindow(name, true)
	win.pane = newPane(name, title or name, font or Enum.Font.SourceSans)
	win.body = win.pane.body
	win.frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	do
		local header = win.pane.header
		header.Size = UDim2.new(1, 0, 0, K.TITLE_H - 1)
		header.ZIndex = 2
		win.body.Position = UDim2.fromOffset(0, K.TITLE_H)
		win.body.Size = UDim2.new(1, 0, 1, -K.TITLE_H)
		local headerCorner = new("UICorner", { CornerRadius = UDim.new(0, 6) }, header)
		local cornerFill = new("Frame", {
			Name = "cornerfill", BackgroundColor3 = header.BackgroundColor3, BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 8), Position = UDim2.new(0, 0, 1, -8), ZIndex = 0, Active = false,
		}, header)
		if K.setCorners(headerCorner, 6, 6, 0, 0) then cornerFill.Visible = false end
		local R = 6
		local function roundChild(c)
			if not c:IsA("GuiObject") or c:FindFirstChildOfClass("UICorner") then return end
			local corner = new("UICorner", { CornerRadius = UDim.new(0, 0) }, c)
			local fill
			local function update()
				if not c.Parent then return end
				local body = win.body
				local bp, bs = body.AbsolutePosition, body.AbsoluteSize
				local cp, cs = c.AbsolutePosition, c.AbsoluteSize
				local bottom = cp.Y + cs.Y >= bp.Y + bs.Y - 1
				local left = bottom and cp.X <= bp.X + 1
				local right = bottom and cp.X + cs.X >= bp.X + bs.X - 1
				if K.setCorners(corner, 0, 0, left and R or 0, right and R or 0) then
					if fill then fill.Visible = false end
					return
				end
				corner.CornerRadius = UDim.new(0, (left and right) and R or 0)
				if left and right and c.BackgroundTransparency < 1 then
					if not fill then
						fill = new("Frame", {
							Name = "topflat", BackgroundColor3 = c.BackgroundColor3, BackgroundTransparency = c.BackgroundTransparency,
							BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, R + 1), ZIndex = c.ZIndex, Active = false,
						}, c)
						c:GetPropertyChangedSignal("BackgroundColor3"):Connect(function() fill.BackgroundColor3 = c.BackgroundColor3 end)
						c:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function() fill.BackgroundTransparency = c.BackgroundTransparency end)
					end
					fill.Visible = true
				elseif fill then
					fill.Visible = false
				end
			end
			update()
			c:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
			c:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
			win.body:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		end
		for _, c in ipairs(win.body:GetChildren()) do roundChild(c) end
		win.body.ChildAdded:Connect(roundChild)
	end
	setPanes(win, { win.pane }, "stack")
	function win.show(offset)
		showToolWindow(win, offset or 60)
	end
	return win
end

local function setPaneTitle(pane, text)
	pane.title = text
	if pane.label then pane.label.Text = text end
end

K.LINES_PER_CHUNK = 120

function K.sanitizeFileName(s)
	s = tostring(s or "script"):gsub("[^%w_%.%-]", "_"):gsub("_+", "_")
	if #s > 120 then s = s:sub(-120) end
	return s
end

function K.ensureFolder(path)
	local acc = ""
	for part in path:gmatch("[^/]+") do
		acc = (acc == "" and part) or (acc .. "/" .. part)
		local ok, exists = pcall(Services.isFolder, acc)
		if not (ok and exists) then pcall(Services.makeFolder, acc) end
	end
end

K.edits = setmetatable({}, { __mode = "k" })

function K.editPath(script)
	local okN, full = pcall(function() return script:GetFullName() end)
	return "LX/Edits/" .. K.sanitizeFileName(okN and full or script.Name) .. ".lua"
end

function K.loadEdit(script)
	if not script then return nil end
	local path = K.editPath(script)
	if not isfile(path) then return nil end
	local ok, data = pcall(readfile, path)
	if ok and type(data) == "string" and #data > 0 then return data end
	return nil
end

function K.saveEdit(script, source)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	if not script then return false end
	K.ensureFolder("LX/Edits")
	return pcall(Services.writeFile, K.editPath(script), source)
end

function K.forgetEdit(script)
	pcall(delfile, K.editPath(script))
end

function K.setScriptEnabled(script, on)
	if not pcall(function() script.Enabled = on end) then
		pcall(function() script.Disabled = not on end)
	end
end

function K.stopEdit(script)
	local e = K.edits[script]
	if not e then return end
	if e.thread then pcall(task.cancel, e.thread) end
	if e.live and e.orig then
		local sro = envFn("setreadonly")
		if sro and table.isfrozen and table.isfrozen(e.live) then pcall(sro, e.live, false) end
		for k, v in pairs(e.orig) do pcall(function() e.live[k] = v.value end) end
	end
	K.edits[script] = nil
end

function K.isEdited(script)
	return script ~= nil and K.edits[script] ~= nil
end

function K.runEdited(script, source)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	if not script then return false, "No script" end
	local ls = envFn("loadstring") or loadstring
	if typeof(ls) ~= "function" then return false, "Your executor has no loadstring" end
	local fn, err = ls(source, "=" .. script.Name)
	if not fn then return false, tostring(err) end
	local senv = setmetatable({ script = script }, { __index = env })
	pcall(setfenv, fn, senv)

	if script:IsA("ModuleScript") then
		K.stopEdit(script)
		local ok, result = xpcall(fn, debug.traceback)
		if not ok then return false, tostring(result) end
		local okR, live = pcall(require, script)
		if okR and type(live) == "table" and type(result) == "table" and live ~= result then
			local sro = envFn("setreadonly")
			if sro and table.isfrozen and table.isfrozen(live) then pcall(sro, live, false) end
			local orig = {}
			for k, v in pairs(result) do
				orig[k] = { value = rawget(live, k) }
				pcall(function() live[k] = v end)
			end
			K.edits[script] = { live = live, orig = orig }
			return true, "Module patched"
		end
		K.edits[script] = { result = result }
		return true, "Module ran"
	end

	K.stopEdit(script)
	K.setScriptEnabled(script, false)
	local failed
	local thread = task.spawn(function()
		local ok, e = xpcall(fn, debug.traceback)
		if not ok then
			failed = tostring(e)
			warn("[LX] " .. script.Name .. ": " .. failed)
		end
	end)
	K.edits[script] = { thread = thread }
	if failed then return false, (failed:match("^[^\n]*")) end
	return true, "Running edited " .. script.Name
end

function K.revertEdit(script)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	K.stopEdit(script)
	K.forgetEdit(script)
	if not script:IsA("ModuleScript") then K.setScriptEnabled(script, true) end
end

local function buildScriptWindow()
	local sw = K.window("scriptviewer", "Script Viewer")
	sw.token = 0
	sw.boxes = {}
	local body = sw.pane.body

	sw.status = new("TextLabel", {
		BackgroundColor3 = Configuration.Theme.CodeBackground, BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, -K.TOOLBAR_H), ZIndex = 2,
		Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = Configuration.Theme.Dim,
		Text = "", TextWrapped = true,
	}, body)

	sw.scroll = scroller(body)
	sw.scroll.Size = UDim2.new(1, 0, 1, -K.TOOLBAR_H)
	sw.scroll.BackgroundColor3 = Configuration.Theme.CodeBackground
	sw.scroll.ScrollingDirection = Enum.ScrollingDirection.XY
	sw.scroll.CanvasSize = UDim2.new()
	sw.scroll.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	sw.scroll.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	sw.scroll.ScrollBarThickness = 10
	sw.scroll.ScrollBarImageColor3 = Configuration.Theme.Scrollbar
	sw.scroll.Visible = false

	sw.gutter = new("Frame", {
		Name = "gutter", BackgroundColor3 = Configuration.Theme.CodeGutter, BorderSizePixel = 0, ZIndex = 2,
	}, sw.scroll)
	sw.fold = new("Frame", { Name = "fold", BorderSizePixel = 0, ZIndex = 2 }, sw.scroll)
	sw.edge = new("Frame", { Name = "edge", BorderSizePixel = 0, ZIndex = 2 }, sw.scroll)
	sw.code = new("Frame", { Name = "code", BackgroundTransparency = 1, ZIndex = 2 }, sw.scroll)

	sw.editor = scroller(body)
	sw.editor.Size = UDim2.new(1, 0, 1, -K.TOOLBAR_H)
	sw.editor.BackgroundColor3 = Configuration.Theme.CodeBackground
	sw.editor.ScrollingDirection = Enum.ScrollingDirection.XY
	sw.editor.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	sw.editor.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	sw.editor.ScrollBarThickness = 10
	sw.editor.Visible = false
	sw.editGutter = new("TextLabel", {
		Name = "gutter", BackgroundColor3 = Configuration.Theme.CodeGutter, BorderSizePixel = 0, ZIndex = 2,
		Font = Enum.Font.RobotoMono, TextSize = 14, TextColor3 = Configuration.Theme.CodeLineNumber,
		TextXAlignment = Enum.TextXAlignment.Right, TextYAlignment = Enum.TextYAlignment.Top, Text = "1",
	}, sw.editor)
	new("UIPadding", { PaddingTop = UDim.new(0, 4), PaddingRight = UDim.new(0, 12) }, sw.editGutter)
	sw.editBox = new("TextBox", {
		Name = "edit", BackgroundTransparency = 1, ZIndex = 3,
		Font = Enum.Font.RobotoMono, TextSize = 14, TextColor3 = Configuration.Theme.CodeText,
		TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
		MultiLine = true, ClearTextOnFocus = false, TextEditable = true, TextWrapped = false, RichText = false,
		ShowNativeInput = true, Text = "",
	}, sw.editor)
	sw.editLines = 0
	function sw.layoutEditor()
		local text = sw.editBox.Text
		local _, breaks = text:gsub("\n", "")
		local n = breaks + 1
		if n ~= sw.editLines then
			sw.editLines = n
			local nums = table.create(n)
			for i = 1, n do nums[i] = tostring(i) end
			sw.editGutter.Text = table.concat(nums, "\n")
		end
		sw.charW = sw.charW or select(2, K.codeMetrics())
		local gw = math.max(3, #tostring(n)) * math.ceil(sw.charW) + 24
		local tb = sw.editBox.TextBounds
		local view = sw.editor.AbsoluteWindowSize
		local w = math.max(math.ceil(tb.X) + 40, view.X - gw - 12)
		local h = math.max(math.ceil(tb.Y) + 40, view.Y)
		sw.editGutter.Position = UDim2.fromOffset(0, 0)
		sw.editGutter.Size = UDim2.fromOffset(gw, h)
		sw.editBox.Position = UDim2.fromOffset(gw + 12, 4)
		sw.editBox.Size = UDim2.fromOffset(w, h - 4)
		sw.editor.CanvasSize = UDim2.fromOffset(gw + 12 + w, h)
	end
	sw.editBox:GetPropertyChangedSignal("TextBounds"):Connect(function() pcall(sw.layoutEditor) end)
	sw.editBox:GetPropertyChangedSignal("Text"):Connect(function()
		local t = sw.editBox.Text
		if t:find("\t", 1, true) then sw.editBox.Text = t:gsub("\t", "    ") end
	end)
	sw.editor:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() if sw.editing then pcall(sw.layoutEditor) end end)

	local _, holder = bottomBar(body)
	sw.copyBtn = toolButton(holder, "Copy", 1)
	sw.saveBtn = toolButton(holder, "Save", 2)
	sw.refreshBtn = toolButton(holder, "Refresh", 3)
	sw.editBtn = toolButton(holder, "Edit", 4)
	sw.runBtn = toolButton(holder, "Save", 5)
	sw.revertBtn = toolButton(holder, "Discard Changes", 6)
	sw.runBtn.Visible = false
	sw.revertBtn.Visible = false

	local function currentText()
		if sw.editing then return sw.editBox.Text end
		return sw.source
	end

	function sw.setEditing(on)
		sw.editing = on == true
		sw.editBtn.Visible = not sw.editing
		sw.saveBtn.Visible = not sw.editing
		sw.runBtn.Visible = sw.editing
		sw.revertBtn.Visible = sw.editing
		if sw.editing then
			if sw.editTarget ~= sw.target then
				sw.editTarget = sw.target
				sw.editBox.Text = K.loadEdit(sw.target) or sw.source or ""
				sw.editor.CanvasPosition = Vector2.zero
			end
			sw.status.Visible = false
			sw.scroll.Visible = false
			sw.editor.Visible = true
			task.defer(function() pcall(sw.layoutEditor) end)
		else
			sw.editor.Visible = false
			if sw.source then
				sw.status.Visible = false
				sw.scroll.Visible = true
			else
				sw.status.Visible = true
			end
		end
	end

	sw.editBtn.MouseButton1Click:Connect(function()
		if not sw.target then return end
		sw.setEditing(true)
	end)

	local function showSource(text)
		sw.source = text
		sw.token += 1
		local token = sw.token
		sw.setEditing(false)
		sw.scroll.Visible = false
		sw.status.Text = "Loading..."
		sw.status.Visible = true
		task.spawn(function()
			local okR, done = pcall(K.renderSource, sw, text, token)
			if sw.token ~= token then return end
			if not (okR and done) then
				sw.status.Text = "Unable to display this script."
				return
			end
			sw.scroll.CanvasPosition = Vector2.zero
			sw.status.Visible = false
			sw.scroll.Visible = true
			pcall(K.paintVisible, sw)
		end)
	end

	sw.runBtn.MouseButton1Click:Connect(function()
		local target = sw.target
		if not target then return end
		local text = sw.editBox.Text
		sw.editTarget = nil
		sw.setEditing(false)
		local okC, ok, msg = pcall(K.runEdited, target, text)
		if not okC then ok, msg = false, ok end
		pcall(K.saveEdit, target, text)
		local okS, errS = pcall(showSource, text)
		if not okS then warn("[LX] couldn't show saved script: " .. tostring(errS)) end
		notify(ok and ("Saved " .. target.Name) or ("Saved, but it errored: " .. tostring(msg)))
	end)

	sw.revertBtn.MouseButton1Click:Connect(function()
		local target = sw.target
		if not target then return end
		K.revertEdit(target)
		sw.editTarget = nil
		sw.setEditing(false)
		notify("Discarded changes to " .. target.Name)
		Delve.openScriptViewer(target)
	end)

	sw.copyBtn.MouseButton1Click:Connect(function()
		local text = currentText()
		if text and Services.setClipboard then pcall(Services.setClipboard, text) end
	end)

	sw.saveBtn.MouseButton1Click:Connect(function()
		local text = currentText()
		if not text then return end
		local folder = "LX/Scripts"
		K.ensureFolder(folder)
		local name = "script"
		if sw.target then
			local okN, full = pcall(function() return sw.target:GetFullName() end)
			name = okN and full or sw.target.Name
		end
		local path = folder .. "/" .. K.sanitizeFileName(name) .. ".lua"
		pcall(writefile, path, text)
	end)

	sw.refreshBtn.MouseButton1Click:Connect(function()
		if sw.target then Delve.openScriptViewer(sw.target) end
	end)

	return sw
end

function K.codeMetrics()
	local big = Vector2.new(100000, 100000)
	local ts = Services.TextService
	local ok1, one = pcall(ts.GetTextSize, ts, "Ag", 14, Enum.Font.RobotoMono, big)
	local ok2, two = pcall(ts.GetTextSize, ts, "Ag\nAg", 14, Enum.Font.RobotoMono, big)
	local ok3, ten = pcall(ts.GetTextSize, ts, string.rep("M", 20), 14, Enum.Font.RobotoMono, big)
	local lh = (ok1 and ok2) and (two.Y - one.Y) or 14
	if lh <= 0 then lh = 14 end
	local cw = ok3 and ten.X / 20 or 14 * 0.6
	return lh, cw
end

K.SELECT_LINES = 1500

function K.paintVisible(sw)
	local rich, plain = sw.richLines, sw.plainLines
	if not (rich and plain) then return end
	local lh, top, count = sw.lineH, sw.lineTop, #rich
	local k = uiK()
	if k <= 0 then k = 1 end
	local viewH = sw.scroll.AbsoluteWindowSize.Y / k
	local need = math.ceil(viewH / lh) + 24
	sw.pool = sw.pool or {}
	if #sw.pool < need then
		for _, s in ipairs(sw.pool) do s.num:Destroy(); s.code:Destroy() end
		sw.pool = {}
		local T = Configuration.Theme
		for i = 1, need + 16 do
			sw.pool[i] = {
				num = new("TextLabel", {
					Name = "ln", BackgroundTransparency = 1, ZIndex = 3, Visible = false,
					Size = UDim2.new(1, -12, 0, lh), Font = Enum.Font.RobotoMono, TextSize = 14,
					TextColor3 = T.CodeLineNumber, TextXAlignment = Enum.TextXAlignment.Right,
					TextYAlignment = Enum.TextYAlignment.Top, Text = "",
				}, sw.gutter),
				code = new("TextLabel", {
					Name = "line", BackgroundTransparency = 1, ZIndex = 3, Visible = false,
					Size = UDim2.new(1, 0, 0, lh), Font = Enum.Font.RobotoMono, TextSize = 14,
					TextColor3 = T.CodeText, TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = false, RichText = true, Text = "",
				}, sw.code),
			}
		end
	end
	local N = #sw.pool
	local y0 = sw.scroll.CanvasPosition.Y
	local first = math.max(1, math.floor((y0 - top) / lh) + 1 - 8)
	local last = math.min(count, first + N - 1)
	for ln = first, last do
		local slot = sw.pool[(ln - 1) % N + 1]
		if slot.line ~= ln then
			slot.line = ln
			local y = (ln - 1) * lh
			slot.num.Position = UDim2.fromOffset(0, top + y)
			slot.num.Text = tostring(ln)
			slot.code.Position = UDim2.fromOffset(0, y)
			local r = rich[ln] or ""
			slot.code.RichText = true
			slot.code.Text = r
			if r ~= plain[ln] then
				local okC, content = pcall(function() return slot.code.ContentText end)
				if okC and type(content) == "string" and content:find("<font", 1, true) then
					slot.code.RichText = false
					slot.code.Text = plain[ln] or ""
				end
			end
		end
		slot.num.Visible = true
		slot.code.Visible = true
	end
	for _, slot in ipairs(sw.pool) do
		if not slot.line or slot.line < first or slot.line > last then
			slot.line = nil
			slot.num.Visible = false
			slot.code.Visible = false
		end
	end
end

function K.renderSource(sw, source, token)
	for _, c in ipairs(sw.code:GetChildren()) do c:Destroy() end
	for _, c in ipairs(sw.gutter:GetChildren()) do c:Destroy() end
	table.clear(sw.boxes)
	sw.pool = {}
	sw.richLines, sw.plainLines = nil, nil
	local alive = function() return sw.token == token end
	local rich = K.highlightLines(source, alive)
	if not rich or not alive() then return false end
	local lines = string.split(source, "\n")
	local count = #lines
	local lh, cw = K.codeMetrics()
	local maxLen = 0
	for _, l in ipairs(lines) do
		local len = utf8.len(l) or #l
		if len > maxLen then maxLen = len end
	end
	local codeW = math.ceil(maxLen * cw) + 32
	local gutterW = math.max(3, #tostring(count)) * math.ceil(cw) + 24
	local totalH = count * lh
	local top = 4
	sw.gutter.Position = UDim2.fromOffset(0, 0)
	local fullH = totalH + top + 12
	local g, bg = Configuration.Theme.CodeGutter, Configuration.Theme.CodeBackground
	local light = (0.299 * bg.R + 0.587 * bg.G + 0.114 * bg.B) > 0.5
	local tone = light and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
	sw.fold.BackgroundColor3 = g:Lerp(tone, 0.035)
	sw.fold.Position = UDim2.fromOffset(gutterW, 0)
	sw.fold.Size = UDim2.fromOffset(12, fullH)
	sw.edge.BackgroundColor3 = g:Lerp(tone, 0.08)
	sw.edge.Position = UDim2.fromOffset(gutterW + 12, 0)
	sw.edge.Size = UDim2.fromOffset(2, fullH)
	sw.code.Position = UDim2.fromOffset(gutterW + 20, top)
	sw.code.Size = UDim2.fromOffset(codeW, totalH)
	sw.scroll.CanvasSize = UDim2.fromOffset(gutterW + 20 + codeW + 12, fullH)
	sw.gutter.Size = UDim2.fromOffset(gutterW, fullH)
	local function fill()
		local h = math.max(fullH, sw.scroll.AbsoluteWindowSize.Y)
		sw.gutter.Size = UDim2.fromOffset(gutterW, h)
		sw.fold.Size = UDim2.fromOffset(12, h)
		sw.edge.Size = UDim2.fromOffset(2, h)
	end
	fill()
	if sw.fillConn then sw.fillConn:Disconnect() end
	sw.fillConn = sw.scroll:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(fill)

	sw.richLines, sw.plainLines = rich, lines
	sw.lineH, sw.lineTop = lh, top
	if sw.paintConn then sw.paintConn:Disconnect() end
	if sw.paintConn2 then sw.paintConn2:Disconnect() end
	sw.paintConn = sw.scroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function() pcall(K.paintVisible, sw) end)
	sw.paintConn2 = sw.scroll:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() pcall(K.paintVisible, sw) end)
	K.paintVisible(sw)
	task.defer(function() if alive() then pcall(K.paintVisible, sw) end end)

	for start = 1, count, K.SELECT_LINES do
		if not alive() then return false end
		local stop = math.min(count, start + K.SELECT_LINES - 1)
		local box = new("TextBox", {
			Name = "sel" .. start, BackgroundTransparency = 1, ZIndex = 4,
			Position = UDim2.fromOffset(0, (start - 1) * lh), Size = UDim2.new(1, 0, 0, (stop - start + 1) * lh),
			Font = Enum.Font.RobotoMono, TextSize = 14, TextColor3 = Configuration.Theme.CodeText,
			TextTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
			MultiLine = true, ClearTextOnFocus = false, TextEditable = false, TextWrapped = false, RichText = false,
			Text = table.concat(lines, "\n", start, stop),
		}, sw.code)
		local function checkFull()
			local a, b = box.SelectionStart, box.CursorPosition
			local full = #box.Text + 1
			if not ((a == 1 and b == full) or (b == 1 and a == full)) then sw.allSelected = false end
		end
		box:GetPropertyChangedSignal("SelectionStart"):Connect(checkFull)
		box:GetPropertyChangedSignal("CursorPosition"):Connect(checkFull)
		sw.boxes[#sw.boxes + 1] = box
	end
	return true
end

function Delve.openScriptViewer(script)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	if not script or not script:IsA("LuaSourceContainer") then return end
	if not UI.scriptWin then UI.scriptWin = buildScriptWindow() end
	local sw = UI.scriptWin
	for _, b in ipairs(sw.boxes) do pcall(function() b:ReleaseFocus() end) end
	if sw.editing and sw.target ~= script then sw.setEditing(false) end
	sw.target = script
	sw.source = nil
	sw.allSelected = false
	sw.token += 1
	local token = sw.token
	showToolWindow(sw, 0)
	sw.status.Text = "Decompiling..."
	sw.status.Visible = not sw.editing
	sw.scroll.Visible = false

	task.spawn(function()
		local ok, source = pcall(getScriptSource, script)
		if sw.token ~= token then return end
		if not ok or type(source) ~= "string" then
			sw.status.Text = "Unable to decompile this script."
			return
		end
		source = source:gsub("\r\n", "\n"):gsub("\r", "\n"):gsub("\t", "    ")
		source = K.cleanSource(source)
		if K.edits[script] then source = K.loadEdit(script) or source end
		sw.source = source
		sw.status.Text = "Loading..."
		local okR, done = pcall(K.renderSource, sw, source, token)
		if sw.token ~= token then return end
		if not (okR and done) then
			sw.status.Text = "Unable to display this script."
			return
		end
		sw.scroll.CanvasPosition = Vector2.zero
		sw.status.Visible = false
		sw.scroll.Visible = not sw.editing
		pcall(K.paintVisible, sw)
	end)
end

function Delve.editScript(script)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
	if not script or not script:IsA("LuaSourceContainer") then return end
	Delve.openScriptViewer(script)
	local sw = UI.scriptWin
	if not sw then return end
	local token = sw.token
	task.spawn(function()
		local started = os.clock()
		while sw.token == token and not sw.source and os.clock() - started < 20 do
			if sw.status.Text:find("Unable", 1, true) then break end
			wait(0.1)
		end
		if sw.token == token and sw.target == script then sw.setEditing(true) end
	end)
end

local View = {
	target = Vector3.zero, yaw = 0, pitch = -0.35, dist = 20, baseDist = 20,
	rotating = false, panning = false, last = nil, home = nil,
}

function K.applyView()
	if not State.viewCam then return end
	local rot = CFrame.fromEulerAnglesYXZ(View.pitch, View.yaw, 0)
	local pos = View.target + rot:VectorToWorldSpace(Vector3.new(0, 0, View.dist))
	State.viewCam.CFrame = CFrame.lookAt(pos, View.target)
end

function K.viewerHovered()
	local w = UI.view3DWin
	if not (w and w.viewport and isOpen(w) and UI.gui.Enabled) then return false end
	return over(w.viewport, mousePos())
end

function K.resetView()
	if not View.home then return end
	View.target, View.yaw, View.pitch, View.dist = View.home.target, View.home.yaw, View.home.pitch, View.home.dist
	K.applyView()
end

function K.wheelZoom(z)
	if z == 0 or not View.dist then return end
	local now = os.clock()
	if K.lastWheel and now - K.lastWheel < 0.01 then return end
	K.lastWheel = now
	View.dist = math.clamp(View.dist * math.exp(-z * 0.15), 0.5, math.max(50, (View.baseDist or 10) * 20))
	K.applyView()
end

Services.ContextActionService:BindActionAtPriority("DelveView3D", function(_, state, input)
	if input.UserInputType == Enum.UserInputType.MouseWheel then
		if not K.viewerHovered() then return Enum.ContextActionResult.Pass end
		if state == Enum.UserInputState.Change or state == Enum.UserInputState.Begin then K.wheelZoom(input.Position.Z) end
		return Enum.ContextActionResult.Sink
	end
	return Enum.ContextActionResult.Pass
end, false, 3000, Enum.UserInputType.MouseWheel)

Services.RunService.RenderStepped:Connect(function(dt)
	if not State.threeDeeActive and not View.rotating and not View.panning then
		local vw = UI.view3DWin
		if not (vw and vw.frame and vw.frame.Visible) then return end
	end
	local active = K.viewerHovered() or View.rotating or View.panning
	if State.threeDeeActive and not active then
		for k in pairs(State.viewKeys) do State.viewKeys[k] = false end
	end
	State.threeDeeActive = active
	if not active or not State.viewCam then return end
end)

Services.UserInputService.InputChanged:Connect(function(i)
	if not (View.rotating or View.panning) then return end
	if i.UserInputType ~= Enum.UserInputType.MouseMovement and i.UserInputType ~= Enum.UserInputType.Touch then return end
	local loc = Services.UserInputService:GetMouseLocation()
	local d = loc - (View.last or loc)
	View.last = loc
	if View.panning and State.viewCam then
		local cf = State.viewCam.CFrame
		local k = View.dist * 0.0018
		View.target += (-cf.RightVector * d.X + cf.UpVector * d.Y) * k
	else
		View.yaw -= d.X * 0.008
		View.pitch = math.clamp(View.pitch - d.Y * 0.008, -math.pi / 2 + 0.05, math.pi / 2 - 0.05)
	end
	K.applyView()
end)

Services.UserInputService.InputEnded:Connect(function(i)
	local t = i.UserInputType
	if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.MouseButton2
		or t == Enum.UserInputType.MouseButton3 or t == Enum.UserInputType.Touch then
		View.rotating, View.panning, View.last = false, false, nil
	end
end)

function K.pairParts(orig, cl, out)
	if #out >= 5000 then return end
	local okA, isPart = pcall(orig.IsA, orig, "BasePart")
	if okA and isPart and cl:IsA("BasePart") then out[#out + 1] = { orig, cl } end
	local oa, ca = safeChildren(orig), safeChildren(cl)
	if #oa == #ca then
		for i = 1, #oa do
			if oa[i].ClassName == ca[i].ClassName then K.pairParts(oa[i], ca[i], out) end
		end
	else
		local used = {}
		for _, x in ipairs(oa) do
			for j, y in ipairs(ca) do
				if not used[j] and y.ClassName == x.ClassName and y.Name == x.Name then
					used[j] = true
					K.pairParts(x, y, out)
					break
				end
			end
		end
	end
end

function K.cloneForView(inst)
	local flipped = {}
	local list = { inst }
	pcall(function() for _, d in ipairs(inst:GetDescendants()) do list[#list + 1] = d end end)
	for _, d in ipairs(list) do
		pcall(function() if not d.Archivable then d.Archivable = true; flipped[#flipped + 1] = d end end)
	end
	local ok, clone = pcall(inst.Clone, inst)
	for _, d in ipairs(flipped) do pcall(function() d.Archivable = false end) end
	if not (ok and clone) then return nil, {} end
	local linked = {}
	pcall(K.pairParts, inst, clone, linked)
	pcall(function()
		for _, d in ipairs(clone:GetDescendants()) do
			if d:IsA("LuaSourceContainer") or d:IsA("Sound") or d:IsA("ParticleEmitter") then d:Destroy() end
		end
	end)
	if not clone:IsA("Model") then
		local m = Instance.new("Model")
		m.Name = clone.Name
		clone.Parent = m
		return m, linked
	end
	return clone, linked
end

local Live = { on = false, parts = {}, root = nil, home = nil }

function K.liveRoot(model)
	if model:IsA("BasePart") then return model end
	local ok, r = pcall(function()
		local pp = model:IsA("Model") and model.PrimaryPart or nil
		return pp or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Handle") or model:FindFirstChildWhichIsA("BasePart", true)
	end)
	return ok and r or nil
end

Services.RunService.RenderStepped:Connect(function()
	if not Live.on or #Live.parts == 0 then return end
	local vw = UI.view3DWin
	if not (vw and isOpen(vw) and not vw.collapsed and UI.gui.Enabled) then return end
	pcall(function()
		local offset = Vector3.zero
		local root = Live.root
		if root and root.Parent and Live.home then offset = Live.home - root.Position end
		for _, p in ipairs(Live.parts) do
			local o, c = p[1], p[2]
			if o.Parent and c.Parent then
				c.CFrame = o.CFrame + offset
				local tr = o.Transparency
				if c.Transparency ~= tr then c.Transparency = tr end
			end
		end
	end)
end)

local function buildViewerWindow()
	local vw = K.window("3dviewer", "3D Viewer")
	local body = vw.pane.body
	local vp = new("ViewportFrame", {
		Name = "view", BackgroundColor3 = Configuration.Theme.CodeBackground, BorderSizePixel = 0, Active = true,
		Size = UDim2.new(1, 0, 1, -K.TOOLBAR_H),
		Ambient = Color3.fromRGB(165, 168, 178), LightColor = Color3.fromRGB(255, 255, 255),
		LightDirection = Vector3.new(-1, -1.5, -0.8),
	}, body)
	State.viewCam = new("Camera", { FieldOfView = 50 }, vp)
	vp.CurrentCamera = State.viewCam
	vw.viewport = vp
	vw.empty = new("TextLabel", {
		BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Visible = false, ZIndex = 2,
		Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = Configuration.Theme.Dim, Text = "Nothing to render",
	}, vp)
	vp.InputChanged:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseWheel then K.wheelZoom(i.Position.Z) end
	end)
	vp.InputBegan:Connect(function(i)
		local t = i.UserInputType
		if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.MouseButton2 or t == Enum.UserInputType.Touch then
			bringToFront(vw)
			View.last = Services.UserInputService:GetMouseLocation()
			if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then View.panning = true else View.rotating = true end
		elseif t == Enum.UserInputType.MouseButton3 then
			View.last = Services.UserInputService:GetMouseLocation()
			View.panning = true
		end
	end)
	local _, holder = bottomBar(body)
	local resetBtn = toolButton(holder, "Reset View", 1)
	resetBtn.MouseButton1Click:Connect(K.resetView)
	local liveBtn = toolButton(holder, "Live Animation", 2)
	liveBtn:SetAttribute("On", Live.on)
	liveBtn.MouseButton1Click:Connect(function()
		Live.on = not Live.on
		liveBtn:SetAttribute("On", Live.on)
	end)
	vw.onClose = function()
		View.rotating, View.panning = false, false
		for _, c in ipairs(vp:GetChildren()) do
			if c:IsA("Model") then c:Destroy() end
		end
		State.viewModelClone = nil
		Live.parts, Live.root, Live.home = {}, nil, nil
	end
	return vw
end

function Delve.open3DViewer(model)
	if not model or not K.viewable(model) then return end
	if not UI.view3DWin then UI.view3DWin = buildViewerWindow() end
	local vw = UI.view3DWin
	for _, c in ipairs(vw.viewport:GetChildren()) do
		if c:IsA("Model") then c:Destroy() end
	end
	local clone, linked = K.cloneForView(model)
	vw.empty.Visible = clone == nil
	Live.parts, Live.root, Live.home = {}, nil, nil
	if clone then
		clone.Parent = vw.viewport
		State.viewModelClone = clone
		Live.parts = linked or {}
		Live.root = K.liveRoot(model)
		local okP, pos = pcall(function() return Live.root.Position end)
		Live.home = okP and pos or nil
	end
	setPaneTitle(vw.pane, "3D Viewer")
	local okB, cf, size = pcall(function()
		if model:IsA("BasePart") then return model.CFrame, model.Size end
		if model:IsA("Model") then return model:GetBoundingBox() end
		return clone:GetBoundingBox()
	end)
	if not okB or not cf then cf, size = CFrame.new(), Vector3.one * 5 end
	local radius = math.max(size.Magnitude * 0.5, 1)
	View.baseDist = math.max(radius * 2.6, 6)
	View.home = { target = cf.Position, yaw = math.rad(35), pitch = -0.35, dist = View.baseDist }
	K.resetView()
	showToolWindow(vw, 30)
end

Services.UserInputService.InputBegan:Connect(function(i, processed)
	local t = i.UserInputType
	local mb1 = t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch
	local mb2 = t == Enum.UserInputType.MouseButton2
	if mb1 or mb2 then
		local m = mousePos()
		local overPopup = (UI.menu.Visible and over(UI.menu, m)) or (UI.picker.Visible and over(UI.picker, m))
		if mb1 and UI.gui.Enabled then
			local ew = ownerOf(Panes.explorer)
			State.treeFocused = not overPopup and ew ~= nil and topWindowAt(m) == ew and inside(UI.explorerPane, m)
			if State.treeFocused and inside(UI.tree, m) and not UI.renameBox.Visible then
				local tp = localPos(UI.tree)
				if m.X < tp.X + UI.tree.AbsoluteSize.X - UI.tree.ScrollBarThickness - 2 then
					local localY = m.Y - tp.Y + UI.tree.CanvasPosition.Y
					if not State.flat[math.floor(localY / K.ROW_HEIGHT) + 1] then
						local ctrl, shift = modifiers()
						if not ctrl and not shift and #State.selection > 0 then setSelection({}) end
					end
				end
			end
		end
		if UI.menu.Visible and not over(UI.menu, m) then hideMenu() end
		if UI.picker.Visible and not over(UI.picker, m) and not over(UI.menu, m) then hidePicker() end
		if mb2 and UI.gui.Enabled and inside(UI.tree, m) then
			local recentRowClick = false
			for _, r in ipairs(rowPool) do
				if r.handledRight and os.clock() - r.handledRight < 0.1 then
					recentRowClick = true
					break
				end
			end
			if not recentRowClick then
				openContextMenu(m, false)
			end
		end
		return
	end

	if not UI.gui.Enabled or processed then return end
	if i.KeyCode == Enum.KeyCode.Escape then hideMenu(); hidePicker()
		if UI.colorPicker then pcall(function() UI.colorPicker:Destroy() end); UI.colorPicker = nil end
		return
	end

	local ctrl, shift, alt = modifiers()
	local k = i.KeyCode
	if ctrl and shift and k == Enum.KeyCode.X then
		task.defer(function() UI.explorerFilter:CaptureFocus() end); return
	elseif ctrl and shift and k == Enum.KeyCode.P then
		task.defer(function() UI.propsFilter:CaptureFocus() end); return
	end
	if not anyWindowAt(mousePos()) then return end
	if k == Enum.KeyCode.Delete and State.selected then Actions.delete()
	elseif k == Enum.KeyCode.F2 and State.selected then beginRename(State.selected)
	elseif k == Enum.KeyCode.F and not ctrl and State.selected then Actions.zoomTo()
	elseif ctrl then
		if k == Enum.KeyCode.A and inside(UI.explorerPane, mousePos()) and topWindowAt(mousePos()) == ownerOf(Panes.explorer) then Actions.selectAll()
		elseif k == Enum.KeyCode.C and State.selected then Actions.copy()
		elseif k == Enum.KeyCode.X and State.selected then Actions.cut()
		elseif k == Enum.KeyCode.V then Actions.paste(shift)
		elseif k == Enum.KeyCode.D and State.selected then Actions.duplicate()
		elseif k == Enum.KeyCode.G and State.selected then Actions.group(alt and "Folder" or "Model")
		elseif k == Enum.KeyCode.U and State.selected then Actions.ungroup()
		end
	end
end)
do
	local navToken = 0
	local function explorerActive()
		if not (UI.gui.Enabled and State.treeFocused) then return false end
		if Services.UserInputService:GetFocusedTextBox() then return false end
		local w = ownerOf(Panes.explorer)
		return w ~= nil and isOpen(w) and topWindowAt(mousePos()) == w
	end
	Services.ContextActionService:BindActionAtPriority("DelveExplorerNav", function(_, state, input)
		if state ~= Enum.UserInputState.Begin then return Enum.ContextActionResult.Pass end
		if not explorerActive() then return Enum.ContextActionResult.Pass end
		local key = input.KeyCode
		navToken += 1
		local token = navToken
		Actions.navigate(key)
		task.spawn(function()
			wait(0.4)
			while navToken == token and Services.UserInputService:IsKeyDown(key) and explorerActive() do
				Actions.navigate(key)
				wait(0.045)
			end
		end)
		return Enum.ContextActionResult.Sink
	end, false, 3001, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right)
end

Services.UserInputService.InputBegan:Connect(function(i)
	local sw = UI.scriptWin
	if not (sw and sw.source and sw.boxes and #sw.boxes > 0 and UI.gui.Enabled and isOpen(sw)) then return end
	if i.KeyCode ~= Enum.KeyCode.A and i.KeyCode ~= Enum.KeyCode.C then return end
	local ctrl = modifiers()
	if not ctrl then return end
	local focused = Services.UserInputService:GetFocusedTextBox()
	local ours = focused and table.find(sw.boxes, focused) ~= nil
	if i.KeyCode == Enum.KeyCode.A then
		if ours then
			task.defer(function() sw.allSelected = true end)
		elseif not focused and sw.scroll.Visible and inside(sw.scroll, mousePos()) and topWindowAt(mousePos()) == sw then
			local box = sw.boxes[1]
			box:CaptureFocus()
			task.defer(function()
				box.SelectionStart = 1
				box.CursorPosition = #box.Text + 1
				task.defer(function() sw.allSelected = true end)
			end)
		end
	elseif i.KeyCode == Enum.KeyCode.C and ours and sw.allSelected and #sw.boxes > 1 and Services.setClipboard then
		local src = sw.source
		delay(0.05, function() pcall(Services.setClipboard, src) end)
	end
end)

do
	local T = Configuration.Theme
	UI.explorerFilter.FocusLost:Connect(function()
		local text = UI.explorerFilter.Text
		if text == "" then return end
		local i = table.find(State.searchHistory, text)
		if i then table.remove(State.searchHistory, i) end
		table.insert(State.searchHistory, 1, text)
		while #State.searchHistory > 10 do table.remove(State.searchHistory) end
	end)

	local function showMenuBelow(anchor, width)
		local s = screenSize()
		local a = localPos(anchor)
		local mh = math.min(State.menuH, s.Y)
		UI.menu.Size = UDim2.fromOffset(width, mh)
		local x = math.clamp(a.X + anchor.AbsoluteSize.X - width, 0, math.max(0, s.X - width))
		local y = a.Y + anchor.AbsoluteSize.Y + 4
		if y + mh > s.Y then y = math.max(0, a.Y - mh - 4) end
		UI.menu.Position = UDim2.fromOffset(x, y)
		UI.menu.Visible = true
		K.popIn(UI.menu, -4)
	end

	if UI.explorerHistoryBtn then
		UI.explorerHistoryBtn.MouseEnter:Connect(function() UI.explorerHistoryBtn.ImageColor3 = T.TabText end)
		UI.explorerHistoryBtn.MouseLeave:Connect(function() UI.explorerHistoryBtn.ImageColor3 = T.Text end)
		UI.explorerHistoryBtn.MouseButton1Click:Connect(function()
			if UI.menu.Visible then hideMenu() return end
			clearMenu(); hidePicker()
			if #State.searchHistory == 0 then
				mItem("No recent searches", nil, false, nil)
			else
				for _, entry in ipairs(State.searchHistory) do
					mItem(entry, nil, true, function() UI.explorerFilter.Text = entry end)
				end
				mSep()
				mItem("Clear History", nil, true, function() table.clear(State.searchHistory) end)
			end
			showMenuBelow(UI.explorerHistoryBtn, UI.menuW)
		end)
	end

	UI.options = new("Frame", {
		Name = "exopts", Visible = false, ZIndex = 55, Active = true,
		BackgroundColor3 = T.Header, BorderSizePixel = 0, Size = UDim2.fromOffset(290, 8 + 3 * touchH(28)),
	}, UI.gui)
	new("UICorner", { CornerRadius = UDim.new(0, 6) }, UI.options)
	stroke(UI.options)

	local function optionRow(index, text, get, set)
		local b = new("TextButton", {
			Size = UDim2.new(1, -8, 0, touchH(28)), Position = UDim2.fromOffset(4, 4 + (index - 1) * touchH(28)),
			BackgroundColor3 = T.MenuHover, BackgroundTransparency = 1, BorderSizePixel = 0,
			Text = "", AutoButtonColor = false, ZIndex = 56,
		}, UI.options)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
		local boxF = new("Frame", {
			Size = UDim2.fromOffset(16, 16), Position = UDim2.fromOffset(8, 6),
			BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 57,
		}, b)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, boxF)
		local boxStroke = stroke(boxF, T.Text, 1)
		local chk = uiImage({ Size = UDim2.fromScale(1, 1), ZIndex = 58 }, boxF, "check", T.TabText)
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(32, 0), Size = UDim2.new(1, -40, 1, 0),
			Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = T.Text, Text = text,
			TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 57,
		}, b)
		local function paint(forced)
			local on
			if forced ~= nil then on = forced else on = get() and true or false end
			boxF.BackgroundTransparency = on and 0 or 1
			boxStroke.Color = on and T.Accent or T.Text
			chk.Visible = on
		end
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		b.MouseButton1Click:Connect(function()
			local want = not get()
			paint(want)
			task.defer(function()
				local ok = pcall(set, want)
				if not ok then markDirty() end
				paint()
			end)
		end)
		paint()
	end
	optionRow(1, "Increment names for new instances",
		function() return Options.IncrementNames end, function(v) Options.IncrementNames = v end)
	optionRow(2, "Expand hierarchy when selecting",
		function() return Options.ExpandOnSelect end, function(v) Options.ExpandOnSelect = v end)
	optionRow(3, "Show hidden services",
		function() return Options.ShowHiddenServices end,
		function(v)
				Delve.setHiddenServices(v)
				task.spawn(function()
				UI.options.Visible = true
				if UI.syncMoreBtn then UI.syncMoreBtn() end
			end)
		end)

	if UI.explorerMoreBtn then
		UI.explorerMoreBtn.MouseButton1Click:Connect(function()
			if UI.options.Visible then UI.options.Visible = false return end
			hideMenu(); hidePicker()
			local s = screenSize()
			local a = localPos(UI.explorerMoreBtn)
			local w, h = UI.options.AbsoluteSize.X, UI.options.AbsoluteSize.Y
			local x = math.clamp(a.X + UI.explorerMoreBtn.AbsoluteSize.X - w, 0, math.max(0, s.X - w))
			local y = a.Y + UI.explorerMoreBtn.AbsoluteSize.Y + 4
			if y + h > s.Y then y = math.max(0, a.Y - h - 4) end
			UI.options.Position = UDim2.fromOffset(x, y)
			UI.options.Visible = true
			K.popIn(UI.options, -4)
		end)
		UI.syncMoreBtn = function()
			local open = UI.options.Visible
			UI.explorerMoreBtn.BackgroundColor3 = open and Configuration.Theme.Panel or Configuration.Theme.Input
		end
		UI.options:GetPropertyChangedSignal("Visible"):Connect(UI.syncMoreBtn)
	end

	Services.UserInputService.InputBegan:Connect(function(i)
		local t = i.UserInputType
		if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.MouseButton2 and t ~= Enum.UserInputType.Touch then
			if i.KeyCode == Enum.KeyCode.Escape then UI.options.Visible = false end
			return
		end
		if not UI.options.Visible then return end
		local m = mousePos()
		if over(UI.options, m) or (UI.explorerMoreBtn and over(UI.explorerMoreBtn, m)) then return end
		UI.options.Visible = false
	end)
end

K.booting = true
UI.gui.Enabled = false
UI.gui:GetPropertyChangedSignal("Enabled"):Connect(function()
	if K.booting and UI.gui.Enabled then UI.gui.Enabled = false end
end)

UI.introGui = new("ScreenGui", {
	Name = "delveintro", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 2000,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, UI.guiParent)
do
	local old = UI.guiParent:FindFirstChild("delveintro")
	if old and old ~= UI.introGui then old:Destroy() end
end

-- Frame stepper used by the intro (no TweenService). step(alpha 0..1)
do
	local RS = game:GetService("RunService")
	function K.easeOut(t) return 1 - (1 - t) ^ 4 end
	function K.easeIn(t) return t ^ 3 end
	function K.animate(dur, step)
		if Options.NoAnimations or dur <= 0 then step(1) return end
		local t0 = os.clock()
		while true do
			local a = math.min((os.clock() - t0) / dur, 1)
			step(a)
			if a >= 1 then break end
			RS.Heartbeat:Wait()
		end
	end
	-- Transparency curve for a fold: opaque band of width p centred at 0.5, soft edges.
	function K.foldSeq(p, soft)
		if p <= 0 then return NumberSequence.new(1) end
		if p >= 1 then return NumberSequence.new(0) end
		soft = soft or 0.09
		local h, pts = p / 2, {}
		for n = 0, 19 do
			local t = n / 19
			local v = math.clamp((math.abs(t - 0.5) - h) / soft + 0.5, 0, 1)
			pts[#pts + 1] = NumberSequenceKeypoint.new(t, v)
		end
		return NumberSequence.new(pts)
	end
end

-- Sprite sheets / GIF support. Load from url (cached with writefile), file path, or asset id,
-- then play frames through ImageRectOffset.
K.Sprite = {}
function K.Sprite.load(src, file)
	if type(src) ~= "string" or src == "" then return nil end
	if src:match("^rbxasset") then return src end
	if src:match("^%d+$") then return "rbxassetid://" .. src end
	local path = file
	if src:match("^https?://") then
		path = path or ("LX/sprites/" .. src:gsub("^https?://", ""):gsub("[^%w%.%-]", "_"):sub(-80))
		if not path:match("%.%w+$") then path = path .. ".png" end
		local have = false
		pcall(function() have = isfile(path) end)
		if not have then
			local ok, body = pcall(function() return game:HttpGet(src) end)
			if not ok or type(body) ~= "string" or #body == 0 then return nil end
			pcall(function()
				if not isfolder("LX") then makefolder("LX") end
				if not isfolder("LX/sprites") then makefolder("LX/sprites") end
			end)
			if not pcall(writefile, path, body) then return nil end
		end
	else
		path = src
	end
	local ok, id = pcall(getcustomasset, path)
	return ok and type(id) == "string" and id or nil
end
-- opt = { Image = url/path/id, FrameSize = Vector2, Columns = n, Frames = n, FPS = n, Loop = bool }
function K.Sprite.play(img, opt)
	local id = K.Sprite.load(opt.Image, opt.File)
	if not id then return function() end end
	local fs = opt.FrameSize or Vector2.new(64, 64)
	local cols = math.max(1, opt.Columns or 1)
	local frames = math.max(1, opt.Frames or cols)
	local fps = opt.FPS or 20
	img.Image = id
	img.ImageRectSize = fs
	img.ImageRectOffset = Vector2.zero
	local RS = game:GetService("RunService")
	local t, last, conn = 0, -1, nil
	conn = RS.Heartbeat:Connect(function(dt)
		if not img.Parent then conn:Disconnect() return end
		t += dt
		local f = math.floor(t * fps)
		if opt.Loop == false then f = math.min(f, frames - 1) else f %= frames end
		if f ~= last then
			last = f
			img.ImageRectOffset = Vector2.new((f % cols) * fs.X, math.floor(f / cols) * fs.Y)
		end
	end)
	return function() if conn then conn:Disconnect() end end
end

do
	local RS = game:GetService("RunService")
	local FAMILY = "rbxasset://fonts/families/SourceSansPro.json"
	local function nFont(w) return Font.new(FAMILY, w, Enum.FontStyle.Normal) end
	UI.introPaint = {}
	local function paint(o, prop, key) UI.introPaint[#UI.introPaint + 1] = { o, prop, key } return o end

	function K.paintIntro()
		if not (UI.introGui and UI.introGui.Parent) then return end
		local T = Configuration.Theme
		for _, p in ipairs(UI.introPaint) do
			local c = type(p[3]) == "function" and p[3](T) or T[p[3]]
			if typeof(c) == "Color3" and p[1] then pcall(function() p[1][p[2]] = c end) end
		end
		if UI.barGrad and UI.barGrad.Parent then
			local a = T.Accent
			UI.barGrad.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, a),
				ColorSequenceKeypoint.new(0.5, a:Lerp(Color3.new(1, 1, 1), 0.35)),
				ColorSequenceKeypoint.new(1, a),
			})
		end
	end

	local function card(name, w, h)
		local c = new("CanvasGroup", {
			Name = name, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(w, h), BorderSizePixel = 0, GroupTransparency = 0, Visible = false,
		}, UI.introGui)
		paint(c, "BackgroundColor3", "Main")
		new("UICorner", { CornerRadius = UDim.new(0, 6) }, c)
		paint(new("UIStroke", { Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, c), "Color", "Border")
		new("UIScale", { Scale = 1 }, c)
		new("UIGradient", { Name = "fold", Rotation = 90, Transparency = NumberSequence.new(1) }, c)
		paint(new("Frame", { Size = UDim2.new(1, 0, 0, 2), BorderSizePixel = 0 }, c), "BackgroundColor3", "Accent")
		return c
	end
	local function label(parent, text, weight, pos, size, ts, key, align)
		local l = new("TextLabel", {
			BackgroundTransparency = 1, Position = pos, Size = size, TextSize = ts,
			Text = text, TextWrapped = true, TextXAlignment = align or Enum.TextXAlignment.Left,
		}, parent)
		l.FontFace = nFont(weight)
		paint(l, "TextColor3", key or "Text")
		return l
	end

	local sprite = Configuration.IntroSprite
	local tx = sprite and 58 or 20
	UI.intro = card("intro", 340, 112)
	if sprite then
		local img = new("ImageLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(18, 12), Size = UDim2.fromOffset(32, 32),
			ScaleType = Enum.ScaleType.Fit,
		}, UI.intro)
		task.spawn(function() pcall(K.Sprite.play, img, sprite) end)
	end
	label(UI.intro, "LX · " .. K.Edition, Enum.FontWeight.Bold, UDim2.fromOffset(tx, 16), UDim2.new(1, -tx - 20, 0, 26), 24, "TabText")

	UI.introStatus = label(UI.intro, "Starting...", Enum.FontWeight.Regular,
		UDim2.fromOffset(20, 52), UDim2.new(1, -90, 0, 20), 15, "Dim")
	UI.introStatus.TextWrapped = false
	UI.introStatus.TextTruncate = Enum.TextTruncate.AtEnd
	UI.introPct = label(UI.intro, "0%", Enum.FontWeight.SemiBold,
		UDim2.new(1, -80, 0, 52), UDim2.fromOffset(60, 20), 15, "Text", Enum.TextXAlignment.Right)

	UI.barBg = paint(new("Frame", {
		Position = UDim2.fromOffset(20, 80), Size = UDim2.new(1, -40, 0, 8),
		BorderSizePixel = 0, ClipsDescendants = true,
	}, UI.intro), "BackgroundColor3", "Input")
	new("UICorner", { CornerRadius = UDim.new(1, 0) }, UI.barBg)
	UI.barFill = new("Frame", {
		Size = UDim2.new(0, 0, 1, 0), BorderSizePixel = 0, BackgroundColor3 = Color3.new(1, 1, 1),
	}, UI.barBg)
	new("UICorner", { CornerRadius = UDim.new(1, 0) }, UI.barFill)
	UI.barGrad = new("UIGradient", {}, UI.barFill)

	-- progress bar: eased fill + moving gradient shine, stepped per frame (no tweens)
	K.introTarget = 0
	task.spawn(function()
		local cur, shine = 0, -1
		while UI.barFill.Parent do
			local dt = RS.Heartbeat:Wait()
			cur += (K.introTarget - cur) * math.min(dt * 10, 1)
			UI.barFill.Size = UDim2.new(cur, 0, 1, 0)
			shine += dt * 1.2
			if shine > 1 then shine = -1 end
			UI.barGrad.Offset = Vector2.new(shine, 0)
		end
	end)

	UI.lowFps = card("lowfps", 340, 176)
	label(UI.lowFps, "Low FPS detected", Enum.FontWeight.Bold, UDim2.fromOffset(20, 16), UDim2.new(1, -40, 0, 26), 22, "TabText")
	label(UI.lowFps, "Enable Low Performance Mode?",
		Enum.FontWeight.Regular, UDim2.fromOffset(20, 52), UDim2.new(1, -40, 0, 40), 16, "Text")
	local function btn(text, x, primary)
		local b = new("TextButton", {
			Position = UDim2.new(x, x == 0 and 20 or 6, 1, -56), Size = UDim2.new(0.5, -26, 0, 34),
			BorderSizePixel = 0, TextSize = 16, Text = text, AutoButtonColor = false,
		}, UI.lowFps)
		b.FontFace = nFont(Enum.FontWeight.SemiBold)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
		local bgKey = primary and "Accent" or "Input"
		paint(b, "BackgroundColor3", bgKey)
		paint(b, "TextColor3", primary and "AccentText" or "Text")
		if not primary then paint(new("UIStroke", { ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, b), "Color", "Border") end
		b.MouseEnter:Connect(function() b.BackgroundColor3 = Configuration.Theme[bgKey]:Lerp(Color3.new(1, 1, 1), 0.1) end)
		b.MouseLeave:Connect(function() b.BackgroundColor3 = Configuration.Theme[bgKey] end)
		return b
	end
	UI.lowFpsNo = btn("No", 0, false)
	UI.lowFpsYes = btn("Yes", 0.5, true)
	K.paintIntro()
end

-- Cards unfold from the centre line via UIGradient transparency, and fold back shut.
function K.showCard(c)
	local g, sc = c:FindFirstChild("fold"), c:FindFirstChildOfClass("UIScale")
	c.Visible = true
	K.animate(0.42, function(a)
		local e = K.easeOut(a)
		if g then g.Transparency = K.foldSeq(e) end
		if sc then sc.Scale = 0.97 + 0.03 * e end
	end)
end
function K.hideCard(c)
	local g, sc = c:FindFirstChild("fold"), c:FindFirstChildOfClass("UIScale")
	K.animate(0.3, function(a)
		local e = 1 - K.easeIn(a)
		if g then g.Transparency = K.foldSeq(e) end
		if sc then sc.Scale = 0.97 + 0.03 * e end
	end)
	c:Destroy()
end

function K.setProgress(a, text)
	a = math.clamp(a, 0, 1)
	K.introTarget = a
	UI.introPct.Text = string.format("%d%%", math.floor(a * 100 + 0.5))
	if text then UI.introStatus.Text = text end
end

function K.askLowPerformance()
	local choice
	K.showCard(UI.lowFps)
	local c1 = UI.lowFpsYes.MouseButton1Click:Connect(function() choice = true end)
	local c2 = UI.lowFpsNo.MouseButton1Click:Connect(function() choice = false end)
	while choice == nil and UI.lowFps.Parent do wait() end
	c1:Disconnect(); c2:Disconnect()
	if choice then
		Options.LowEnd = true
	elseif not Options.ForceLowEnd then
		Options.LowEnd = false
	end
	pcall(K.applyPerformance)
	K.hideCard(UI.lowFps)
end

UI.toggleGui = new("ScreenGui", {
	Name = "delvetoggle", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 1000,
	Enabled = false,
}, UI.guiParent)
UI.previousToggle = UI.guiParent:FindFirstChild("delvetoggle")
if UI.previousToggle and UI.previousToggle ~= UI.toggleGui then UI.previousToggle:Destroy() end
UI.toggleBtn = new("TextButton", {
	Size = UDim2.fromOffset(44, 44), Position = UDim2.new(0, 12, 0.5, -22), BackgroundColor3 = Configuration.Theme.Header,
	AutoButtonColor = false, Font = Enum.Font.SourceSansBold, TextSize = 13, TextColor3 = Configuration.Theme.Text, Text = "LX",
}, UI.toggleGui)
new("UICorner", { CornerRadius = UDim.new(0, 8) }, UI.toggleBtn)
stroke(UI.toggleBtn)
UI.toggleBtn.MouseButton1Click:Connect(function()
	UI.gui.Enabled = not UI.gui.Enabled
	if not UI.gui.Enabled then hideMenu(); hidePicker() end
end)

do
	local holdToken = 0
	UI.tree.InputBegan:Connect(function(i)
		if i.UserInputType ~= Enum.UserInputType.Touch then return end
		holdToken += 1
		local token = holdToken
		local startPos = mousePos()
		delay(0.5, function()
			if token ~= holdToken or UI.menu.Visible then return end
			local m = mousePos()
			if (m - startPos).Magnitude > 12 or not inside(UI.tree, m) then return end
			local localY = m.Y - localPos(UI.tree).Y + UI.tree.CanvasPosition.Y
			if not State.flat[math.floor(localY / K.ROW_HEIGHT) + 1] then openContextMenu(m, false) end
		end)
	end)
	UI.tree.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch then holdToken += 1 end
	end)
end

task.spawn(function()
	local waitedAt = os.clock()
	while not K.themeReady and os.clock() - waitedAt < 3 do wait() end
	pcall(K.paintIntro)
	task.spawn(K.showCard, UI.intro)
	local ok, err = pcall(Cache.preload, K.setProgress)
	if not ok then
		K.setProgress(1, "Ready (partial index)")
	end
	Cache.ready = true
	K.setProgress(1, "Done")
	wait(0.45)
	K.hideCard(UI.intro)

	if K.lowFpsDetected and not Options.ForceLowEnd then
		pcall(K.askLowPerformance)
	end
	if UI.lowFps and UI.lowFps.Parent then UI.lowFps:Destroy() end

	UI.introGui:Destroy()

	K.booting = false
	UI.gui.Enabled = true
	UI.toggleGui.Enabled = Services.UserInputService.TouchEnabled

	State.expanded[workspace] = true
	if #mainWin.panes > 0 and not mainWin.closed then
		if Delve_IsMobile then
			local s = screenSize()
			mainWin.snapped = nil
			mainWin.floatSize = UDim2.fromOffset(math.min(320, s.X - 20), math.max(200, s.Y - 60))
			mainWin.frame.Size = mainWin.floatSize
			mainWin.frame.Position = UDim2.fromOffset(10, 44)
		else
			mainWin.snapped = "right"
		end
		mainWin.frame.Visible = true
	end
	refreshDocks(false)
	layoutWindow(mainWin)
	State.dirty = true
	renderTree()
end)

local function bootApps()
	local Http = game:GetService("HttpService")
	local readFile, isFile, listFiles, customAsset = readfile, isfile, listfiles, getcustomasset

	local THEME_KEYS = {}
	for k in pairs(Configuration.Theme) do THEME_KEYS[#THEME_KEYS + 1] = k end
	table.sort(THEME_KEYS)

	local function rgb(r, g, b) return Color3.fromRGB(r, g, b) end

	local function cloneTheme(src)
		local t = {}
		for k, v in pairs(src) do t[k] = v end
		return t
	end

	local function derive(base, over)
		local t = cloneTheme(base)
		for k, v in pairs(over) do t[k] = v end
		return t
	end

	local Themes = { order = { "Next Generation Studio", "2021 Studio" }, list = {} }
	Themes.list["Next Generation Studio"] = cloneTheme(Configuration.Theme)
	Themes.list["2021 Studio"] = derive(Configuration.Theme, {
		Main = rgb(46, 46, 46), Surface = rgb(37, 37, 37), Header = rgb(53, 53, 53), Input = rgb(31, 31, 31),
		Panel = rgb(60, 60, 60), Border = rgb(34, 34, 34), Text = rgb(204, 204, 204), Dim = rgb(130, 130, 130),
		Hover = rgb(66, 66, 66), Selected = rgb(11, 90, 175), Accent = rgb(53, 181, 255), Scrollbar = rgb(85, 85, 85),
		PropName = rgb(204, 204, 205), PropValue = rgb(204, 204, 206), PropBool = rgb(204, 204, 207),
		PropNumber = rgb(204, 204, 208), PropString = rgb(204, 204, 209), TabActive = rgb(46, 46, 47),
		TabText = rgb(230, 230, 230), MenuHover = rgb(70, 70, 70), CodeBackground = rgb(37, 37, 38),
		CodeGutter = rgb(42, 42, 42), CodeText = rgb(205, 205, 205), CodeOp = rgb(206, 206, 206),
		CodeLineNumber = rgb(133, 133, 133), CodeComment = rgb(102, 102, 102), SelectionBox = rgb(53, 181, 254),
		CodeKeyword = rgb(248, 109, 124), CodeString = rgb(173, 241, 149), CodeNumber = rgb(255, 198, 0),
		CodeBool = rgb(255, 198, 1), CodeNil = rgb(255, 198, 2), CodeSelf = rgb(248, 109, 125),
		CodeBuiltin = rgb(132, 214, 247), CodeFn = rgb(253, 251, 172), CodeMethod = rgb(253, 251, 173),
		CodeProperty = rgb(97, 161, 241),
	})

	-- Preset themes. Each palette is expanded to every theme key, then nudged so no two keys share
	-- an exact colour (the live re-theme swaps colours by value, so duplicates would bleed).
	local function hex(h) return Color3.fromHex(h) end
	local function preset(p)
		local bg, fg, ac = hex(p.bg), hex(p.fg), hex(p.accent)
		local light = p.light == true
		local function shade(c, amt) return amt >= 0 and c:Lerp(Color3.new(1, 1, 1), amt) or c:Lerp(Color3.new(0, 0, 0), -amt) end
		local d = light and -1 or 1
		local t = {
			Main = bg, Surface = p.surface and hex(p.surface) or shade(bg, -0.18 * d),
			Header = p.header and hex(p.header) or shade(bg, 0.05 * d), Input = p.input and hex(p.input) or shade(bg, -0.3 * d),
			Panel = p.panel and hex(p.panel) or shade(bg, 0.14 * d), Border = p.border and hex(p.border) or shade(bg, -0.4 * d),
			Text = fg, Dim = p.dim and hex(p.dim) or fg:Lerp(bg, 0.42),
			Hover = shade(bg, 0.09 * d), Selected = p.selected and hex(p.selected) or ac:Lerp(bg, 0.25),
			Accent = ac, Scrollbar = fg:Lerp(bg, 0.6), TabActive = shade(bg, 0.03 * d),
			TabText = light and shade(fg, -0.3) or shade(fg, 0.3), MenuHover = shade(bg, 0.16 * d),
			CloseHover = shade(bg, 0.13 * d), AccentText = p.accentText and hex(p.accentText) or Color3.new(1, 1, 1),
			SelectionBox = ac, PropName = fg, PropValue = fg, PropBool = fg, PropNumber = fg, PropString = fg,
			CodeBackground = p.code and hex(p.code) or shade(bg, -0.12 * d), CodeGutter = shade(bg, -0.05 * d),
			CodeText = fg, CodeOp = fg, CodeLineNumber = fg:Lerp(bg, 0.5),
			CodeKeyword = hex(p.keyword), CodeString = hex(p.string), CodeComment = hex(p.comment),
			CodeNumber = hex(p.number), CodeBool = hex(p.number), CodeNil = hex(p.number),
			CodeSelf = hex(p.keyword), CodeBuiltin = hex(p.builtin), CodeFn = hex(p.fn), CodeMethod = hex(p.fn),
			CodeProperty = hex(p.property or p.builtin),
		}
		local out, used = cloneTheme(Configuration.Theme), {}
		for _, k in ipairs(THEME_KEYS) do
			local c = t[k] or out[k]
			if typeof(c) == "Color3" then
				local r, g, b = math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5)
				local key = r .. "," .. g .. "," .. b
				local step = 0
				while used[key] or key == "255,255,255" or key == "0,0,0" do
					step += 1
					b = (b + (b < 128 and 1 or -1) * step) % 256
					key = r .. "," .. g .. "," .. b
				end
				used[key] = true
				out[k] = Color3.fromRGB(r, g, b)
			end
		end
		return out
	end
	local PRESETS = {
		{ "Dracula", { bg = "282a36", fg = "f8f8f2", accent = "bd93f9", keyword = "ff79c6", string = "f1fa8c", comment = "6272a4", number = "bd93f9", builtin = "8be9fd", fn = "50fa7b", property = "ffb86c" } },
		{ "Monokai", { bg = "272822", fg = "f8f8f2", accent = "a6e22e", accentText = "1e1f1c", keyword = "f92672", string = "e6db74", comment = "75715e", number = "ae81ff", builtin = "66d9ef", fn = "a6e22e", property = "fd971f" } },
		{ "One Dark", { bg = "282c34", fg = "abb2bf", accent = "61afef", keyword = "c678dd", string = "98c379", comment = "5c6370", number = "d19a66", builtin = "56b6c2", fn = "61afef", property = "e06c75" } },
		{ "Nord", { bg = "2e3440", fg = "d8dee9", accent = "88c0d0", accentText = "2e3440", keyword = "81a1c1", string = "a3be8c", comment = "616e88", number = "b48ead", builtin = "8fbcbb", fn = "88c0d0", property = "d08770" } },
		{ "Tokyo Night", { bg = "1a1b26", fg = "c0caf5", accent = "7aa2f7", keyword = "bb9af7", string = "9ece6a", comment = "565f89", number = "ff9e64", builtin = "7dcfff", fn = "7aa2f7", property = "73daca" } },
		{ "Catppuccin Mocha", { bg = "1e1e2e", fg = "cdd6f4", accent = "cba6f7", accentText = "1e1e2e", keyword = "cba6f7", string = "a6e3a1", comment = "6c7086", number = "fab387", builtin = "89dceb", fn = "89b4fa", property = "f38ba8" } },
		{ "Gruvbox Dark", { bg = "282828", fg = "ebdbb2", accent = "fe8019", keyword = "fb4934", string = "b8bb26", comment = "928374", number = "d3869b", builtin = "83a598", fn = "fabd2f", property = "8ec07c" } },
		{ "Solarized Dark", { bg = "002b36", fg = "93a1a1", accent = "268bd2", keyword = "859900", string = "2aa198", comment = "586e75", number = "d33682", builtin = "b58900", fn = "268bd2", property = "cb4b16" } },
		{ "GitHub Dark", { bg = "0d1117", fg = "c9d1d9", accent = "2f81f7", panel = "21262d", border = "30363d", keyword = "ff7b72", string = "a5d6ff", comment = "8b949e", number = "79c0ff", builtin = "ffa657", fn = "d2a8ff", property = "7ee787" } },
		{ "Rose Pine", { bg = "191724", fg = "e0def4", accent = "ebbcba", accentText = "191724", keyword = "31748f", string = "f6c177", comment = "6e6a86", number = "ebbcba", builtin = "9ccfd8", fn = "c4a7e7", property = "eb6f92" } },
		{ "Everforest", { bg = "2d353b", fg = "d3c6aa", accent = "a7c080", accentText = "2d353b", keyword = "e67e80", string = "a7c080", comment = "859289", number = "d699b6", builtin = "7fbbb3", fn = "dbbc7f", property = "83c092" } },
		{ "Synthwave", { bg = "262335", fg = "f0eff1", accent = "ff7edb", accentText = "262335", keyword = "fede5d", string = "ff8b39", comment = "848bbd", number = "f97e72", builtin = "36f9f6", fn = "72f1b8", property = "ff7edb" } },
		{ "Midnight", { bg = "121826", fg = "d6deeb", accent = "3b82f6", keyword = "c792ea", string = "addb67", comment = "637777", number = "f78c6c", builtin = "7fdbca", fn = "82aaff", property = "ffcb8b" } },
		{ "AMOLED", { bg = "080808", fg = "e6e6e6", accent = "00b4ff", surface = "030303", input = "010101", border = "1c1c1c", panel = "1f1f1f", keyword = "ff5f87", string = "afff87", comment = "6c6c6c", number = "ffd75f", builtin = "5fd7ff", fn = "ffff87", property = "87afff" } },
		{ "Studio Light", { light = true, bg = "f5f5f5", fg = "1b1b1b", accent = "0078d7", surface = "ffffff", input = "fefefe", header = "e9e9e9", panel = "dcdcdc", border = "c8c8c8", dim = "6e6e6e", keyword = "0000ff", string = "a31515", comment = "008000", number = "098658", builtin = "267f99", fn = "795e26", property = "001080" } },
		{ "Solarized Light", { light = true, bg = "fdf6e3", fg = "586e75", accent = "268bd2", surface = "fffbef", input = "fffdf6", panel = "eee8d5", border = "d9d2bf", keyword = "859900", string = "2aa198", comment = "93a1a1", number = "d33682", builtin = "b58900", fn = "268bd2", property = "cb4b16" } },
	}
	for _, p in ipairs(PRESETS) do
		local ok, th = pcall(preset, p[2])
		if ok and th then
			Themes.list[p[1]] = th
			table.insert(Themes.order, p[1])
		end
	end

	local Settings = {
		folder = "LX", file = "LX/settings.json", themeFolder = "LX/themes",
		data = { theme = "Next Generation Studio", image = "", imageTransparency = 0.6, panelTransparency = 0.25 },
	}

	local function encodeTheme(theme)
		local out = {}
		for k, v in pairs(theme) do
			if typeof(v) == "Color3" then
				out[k] = { math.floor(v.R * 255 + 0.5), math.floor(v.G * 255 + 0.5), math.floor(v.B * 255 + 0.5) }
			end
		end
		return out
	end

	local function decodeTheme(raw)
		if type(raw) ~= "table" then return nil end
		local theme = cloneTheme(Themes.list["Next Generation Studio"])
		local hits = 0
		for k, v in pairs(raw) do
			if theme[k] ~= nil then
				if type(v) == "table" and #v >= 3 then
					theme[k] = rgb(tonumber(v[1]) or 0, tonumber(v[2]) or 0, tonumber(v[3]) or 0)
					hits += 1
				elseif type(v) == "string" and v:match("^#?%x%x%x%x%x%x$") then
					local ok, c = pcall(Color3.fromHex, v)
					if ok then theme[k] = c; hits += 1 end
				end
			end
		end
		return hits > 0 and theme or nil
	end

	function Settings.save()
		K.ensureFolder(Settings.folder)
		local data = cloneTheme(Settings.data)
		data.options = {
			IncrementNames = Options.IncrementNames, ExpandOnSelect = Options.ExpandOnSelect,
			ShowHiddenServices = Options.ShowHiddenServices, SelectionBoxes = Options.SelectionBoxes ~= false,
			LauncherVisible = Options.LauncherVisible ~= false,
			NoAnimations = Options.NoAnimations == true, ForceLowEnd = Options.ForceLowEnd == true,
		}
		local ok, json = pcall(Http.JSONEncode, Http, data)
		if ok then pcall(Services.writeFile, Settings.file, json) end
	end

	function Settings.saveTheme(name, theme)
		K.ensureFolder(Settings.themeFolder)
		local ok, json = pcall(Http.JSONEncode, Http, encodeTheme(theme))
		return ok and pcall(Services.writeFile, Settings.themeFolder .. "/" .. K.sanitizeFileName(name) .. ".json", json)
	end

	local function readJson(path)
		if not isFile(path) then return nil end
		local ok, body = pcall(readFile, path)
		if not ok or type(body) ~= "string" then return nil end
		local okD, data = pcall(Http.JSONDecode, Http, body)
		return okD and data or nil
	end

	function Settings.load()
		do
			local ok, files = pcall(listFiles, Settings.themeFolder)
			if ok and type(files) == "table" then
				for _, path in ipairs(files) do
					local name = tostring(path):gsub("\\", "/"):match("([^/]+)%.json$")
					local theme = name and decodeTheme(readJson(path))
					if theme then
						if not Themes.list[name] then table.insert(Themes.order, name) end
						Themes.list[name] = theme
					end
				end
			end
		end
		local data = readJson(Settings.file)
		if type(data) ~= "table" then return end
		for k, v in pairs(data) do
			if k ~= "options" then Settings.data[k] = v end
		end
		if type(data.options) == "table" then
			for k, v in pairs(data.options) do
				if type(v) == "boolean" then Options[k] = v end
			end
		end
	end

	local function colorKey(c)
		return string.format("%d,%d,%d", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
	end

	local SWAP_PROPS = {
		GuiObject = { "BackgroundColor3", "BorderColor3" },
		TextLabel = { "TextColor3" }, TextButton = { "TextColor3" },
		TextBox = { "TextColor3", "PlaceholderColor3" },
		ImageLabel = { "ImageColor3" }, ImageButton = { "ImageColor3" },
		ScrollingFrame = { "ScrollBarImageColor3" },
		UIStroke = { "Color" }, SelectionBox = { "Color3" },
	}

	local function retheme(root, lookup)
		local function swap(o)
			for cls, props in pairs(SWAP_PROPS) do
				if o:IsA(cls) then
					for _, prop in ipairs(props) do
						local ok, cur = pcall(function() return o[prop] end)
						if ok and typeof(cur) == "Color3" then
							local nv = lookup[colorKey(cur)]
							if nv then pcall(function() o[prop] = nv end) end
						end
					end
				end
			end
		end
		swap(root)
		for _, d in ipairs(root:GetDescendants()) do swap(d) end
	end

	local applyBackdrop

	function K.styleTitles()
		for _, t in ipairs(K.paneTitles or {}) do
			local l = t.label
			if l and l.Parent then
				if K.classicTitles then
					l.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
					l.TextSize = 16
					l.TextColor3 = (Configuration.Theme.Text.R + Configuration.Theme.Text.G + Configuration.Theme.Text.B) > 1.5 and Color3.fromRGB(255, 255, 255) or Configuration.Theme.Text
				else
					l.FontFace = t.font
					l.TextSize = t.size
					l.TextColor3 = Configuration.Theme.Text
				end
			end
		end
	end

	local function applyTheme(name)
		local theme = Themes.list[name]
		if not theme then return end
		Settings.data.theme = name
		local lookup = {}
		for _, k in ipairs(THEME_KEYS) do
			local old, nv = Configuration.Theme[k], theme[k]
			if typeof(old) == "Color3" and typeof(nv) == "Color3" then
				local key = colorKey(old)
				if key ~= "255,255,255" and key ~= "0,0,0" and lookup[key] == nil then lookup[key] = nv end
			end
		end
		for _, root in ipairs({ UI.gui, UI.toggleGui, UI.colorPicker }) do
			if root and root.Parent then pcall(retheme, root, lookup) end
		end
		for _, w in ipairs(Windows) do
			for _, p in ipairs(w.panes) do
				if p.frame and not p.frame:IsDescendantOf(UI.gui) then retheme(p.frame, lookup) end
			end
		end
		for _, p in pairs(Panes) do
			if p.frame and not p.frame:IsDescendantOf(UI.gui) then retheme(p.frame, lookup) end
		end
		for k, v in pairs(theme) do Configuration.Theme[k] = v end
		Settings.data.theme = name
		if K.paintIntro then pcall(K.paintIntro) end
		K.classicTitles = name ~= "Next Generation Studio"
		K.styleTitles()
		pcall(refreshSelectionBoxes)
		pcall(repaintRows)
		pcall(renderProps)
		local sw = UI.scriptWin
		if sw and sw.target and isOpen(sw) then task.spawn(Delve.openScriptViewer, sw.target) end
		if applyBackdrop then applyBackdrop() end
	end

	local function resolveImage(text)
		text = tostring(text or ""):match("^%s*(.-)%s*$")
		if text == "" then return "" end
		if text:match("^%d+$") then return "rbxassetid://" .. text end
		if text:match("^rbxasset") or text:match("^https?://") then return text end
		local ok, asset = pcall(customAsset, text)
		if ok and type(asset) == "string" then return asset end
		return text
	end

	local blendTargets = function()
		local list = { UI.tree, UI.props }
		if UI.scriptWin then list[#list + 1] = UI.scriptWin.scroll; list[#list + 1] = UI.scriptWin.status end
		if UI.settingsWin then list[#list + 1] = UI.settingsWin.scroll end
		return list
	end

	applyBackdrop = function()
		local image = resolveImage(Settings.data.image)
		local on = image ~= ""
		for _, w in ipairs(Windows) do
			local img = w.frame:FindFirstChild("backdrop")
			if on then
				img = img or new("ImageLabel", {
					Name = "backdrop", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop, ZIndex = 0, Active = false,
				}, w.frame)
				img.Image = image
				img.ImageTransparency = math.clamp(tonumber(Settings.data.imageTransparency) or 0.6, 0, 1)
			elseif img then
				img:Destroy()
			end
		end
		local blend = on and math.clamp(tonumber(Settings.data.panelTransparency) or 0.25, 0, 1) or 0
		for _, f in ipairs(blendTargets()) do
			if f then f.BackgroundTransparency = blend end
		end
	end

	local function iconInto(img, studioName, fallbackClass)
		if StudioIcons.enabled and applyStudio(img, studioName) then return end
		applyClassIcon(img, fallbackClass)
		task.spawn(function()
			for _ = 1, 40 do
				wait(0.25)
				if not img.Parent then return end
				if StudioIcons.assets[studioName] then applyStudio(img, studioName) return end
			end
		end)
	end

	-- Toggle switch (kept under the old name so Apps.checkbox / plugins keep working)
	local function checkbox(parent, order, text, get, set)
		local T = Configuration.Theme
		local TW, TH, KN = 30, 16, 12
		local b = new("TextButton", {
			Size = UDim2.new(1, 0, 0, touchH(26)), BackgroundColor3 = T.Hover, BackgroundTransparency = 1,
			BorderSizePixel = 0, Text = "", AutoButtonColor = false, LayoutOrder = order, ZIndex = 3,
		}, parent)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(8, 0), Size = UDim2.new(1, -(TW + 20), 1, 0),
			Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = T.Text, Text = text,
			TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 4,
		}, b)
		local track = new("Frame", {
			AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.fromOffset(TW, TH),
			BackgroundColor3 = T.Input, BorderSizePixel = 0, ZIndex = 4,
		}, b)
		new("UICorner", { CornerRadius = UDim.new(1, 0) }, track)
		local trackStroke = stroke(track, T.Border, 1)
		local knob = new("Frame", {
			AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 2, 0.5, 0), Size = UDim2.fromOffset(KN, KN),
			BackgroundColor3 = T.Dim, BorderSizePixel = 0, ZIndex = 5,
		}, track)
		new("UICorner", { CornerRadius = UDim.new(1, 0) }, knob)
		local first = true
		local function paint()
			local Th = Configuration.Theme
			local on = get() and true or false
			local pos = on and UDim2.new(0, TW - KN - 2, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
			track.BackgroundColor3 = on and Th.Accent or Th.Input
			trackStroke.Color = on and Th.Accent or Th.Border
			knob.BackgroundColor3 = on and Th.AccentText or Th.Dim
			if first or Options.LowEnd or Options.NoAnimations then
				knob.Position = pos
			else
				Services.TweenService:Create(knob, TweenInfo.new(0.14, Enum.EasingStyle.Quint), { Position = pos }):Play()
			end
			first = false
		end
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		b.MouseButton1Click:Connect(function()
			local want = not get()
			pcall(set, want)
			paint()
			Settings.save()
		end)
		paint()
		return { button = b, paint = paint }
	end

	-- Theme picker row: name + palette preview + selected marker
	local function themeRow(parent, order, name, get, set)
		local T = Configuration.Theme
		local b = new("TextButton", {
			Size = UDim2.new(1, 0, 0, touchH(28)), BackgroundColor3 = T.Hover, BackgroundTransparency = 1,
			BorderSizePixel = 0, Text = "", AutoButtonColor = false, LayoutOrder = order, ZIndex = 3,
		}, parent)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
		local bar = new("Frame", {
			Position = UDim2.new(0, 0, 0.5, -7), Size = UDim2.fromOffset(3, 14), BackgroundColor3 = T.Accent,
			BorderSizePixel = 0, ZIndex = 4,
		}, b)
		new("UICorner", { CornerRadius = UDim.new(1, 0) }, bar)
		local lbl = new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -100, 1, 0),
			Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = T.Text, Text = name,
			TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 4,
		}, b)
		local sw = new("Frame", {
			AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -6, 0.5, 0), Size = UDim2.fromOffset(80, 14),
			BackgroundTransparency = 1, ZIndex = 4,
		}, b)
		new("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 2),
			HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder }, sw)
		local KEYS = { "Main", "Surface", "Panel", "Accent", "CodeKeyword", "CodeString" }
		local chips = {}
		for n in ipairs(KEYS) do
			local c = new("Frame", { Size = UDim2.fromOffset(12, 14), BorderSizePixel = 0, LayoutOrder = n, ZIndex = 5 }, sw)
			new("UICorner", { CornerRadius = UDim.new(0, 3) }, c)
			chips[n] = c
		end
		local function paint()
			local Th = Configuration.Theme
			local on = get() and true or false
			local th = Themes.list[name] or Th
			for n, k in ipairs(KEYS) do if typeof(th[k]) == "Color3" then chips[n].BackgroundColor3 = th[k] end end
			bar.Visible = on
			bar.BackgroundColor3 = Th.Accent
			lbl.TextColor3 = on and Th.TabText or Th.Text
			lbl.Font = on and Enum.Font.SourceSansBold or Enum.Font.SourceSans
		end
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		b.MouseButton1Click:Connect(function() pcall(set, true); paint(); Settings.save() end)
		paint()
		return { button = b, paint = paint }
	end

	local function sectionTitle(parent, order, text)
		return new("TextLabel", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 28), LayoutOrder = order, ZIndex = 3,
			Font = Enum.Font.SourceSansBold, TextSize = 15, TextColor3 = Configuration.Theme.TabText, Text = text,
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Bottom,
		}, parent)
	end

	local function inputField(parent, order, placeholder, height)
		local T = Configuration.Theme
		local holder = new("Frame", {
			Size = UDim2.new(1, 0, 0, height or touchH(26)), BackgroundColor3 = T.Input, BorderSizePixel = 0,
			LayoutOrder = order, ZIndex = 3,
		}, parent)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, holder)
		local st = stroke(holder, T.Border, 1)
		local box = new("TextBox", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(8, 4), Size = UDim2.new(1, -16, 1, -8),
			Font = height and Enum.Font.RobotoMono or Enum.Font.SourceSans, TextSize = height and 13 or 14, TextColor3 = T.Text,
			PlaceholderColor3 = T.Dim, PlaceholderText = placeholder, Text = "", ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = height and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
			MultiLine = height ~= nil, TextWrapped = height ~= nil, ClipsDescendants = true, ZIndex = 4,
		}, holder)
		box.Focused:Connect(function() st.Color = Configuration.Theme.Accent end)
		box.FocusLost:Connect(function() st.Color = Configuration.Theme.Border end)
		return box, holder
	end

	local function buttonRow(parent, order)
		local row = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, touchH(28) + 4), LayoutOrder = order, ZIndex = 3 }, parent)
		new("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder,
		}, row)
		return row
	end

	local function buildSettingsWindow()
		local win = K.window("settings", "Settings")
		local scroll = scroller(win.pane.body)
		scroll.Size = UDim2.fromScale(1, 1)
		scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
		win.scroll = scroll
		new("UIPadding", {
			PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 14),
			PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 14),
		}, scroll)
		new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, scroll)

		local order = 0
		local function nextOrder() order += 1 return order end
		local function safe(_, fn) pcall(fn) end

		safe("Performance", function()
		sectionTitle(scroll, nextOrder(), "Performance")
		checkbox(scroll, nextOrder(), "Disable animations",
			function() return Options.NoAnimations == true end,
			function(v) Options.NoAnimations = v; K.applyPerformance(); Settings.save() end)
		checkbox(scroll, nextOrder(), "Low-end mode",
			function() return Options.ForceLowEnd == true end,
			function(v) Options.ForceLowEnd = v; Options.LowEnd = v or Options.LowEnd; K.applyPerformance(); Settings.save() end)
		end)

		safe("General", function()
		sectionTitle(scroll, nextOrder(), "General")
		checkbox(scroll, nextOrder(), "Increment names for new instances",
			function() return Options.IncrementNames end, function(v) Options.IncrementNames = v end)
		checkbox(scroll, nextOrder(), "Expand hierarchy when selecting",
			function() return Options.ExpandOnSelect end, function(v) Options.ExpandOnSelect = v end)
		checkbox(scroll, nextOrder(), "Show hidden services",
			function() return Options.ShowHiddenServices end,
			function(v)
				Delve.setHiddenServices(v)
				task.spawn(function()
				end)
			end)
		checkbox(scroll, nextOrder(), "Selection outlines",
			function() return Options.SelectionBoxes ~= false end,
			function(v) Options.SelectionBoxes = v; refreshSelectionBoxes() end)
		checkbox(scroll, nextOrder(), "Show app dock beside Explorer",
			function() return Options.LauncherVisible ~= false end,
			function(v) Options.LauncherVisible = v end)
		end)

		safe("Themes", function()
		sectionTitle(scroll, nextOrder(), "Theme")
		local themeList = new("Frame", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = nextOrder(), ZIndex = 3,
		}, scroll)
		new("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, themeList)
		local themeRows = {}
		local function paintThemes() for _, r in ipairs(themeRows) do r.paint() end end
		local function addThemeRow(name)
			local row = themeRow(themeList, #themeRows + 1, name,
				function() return Settings.data.theme == name end,
				function() pcall(applyTheme, name) end)
			row.button.MouseButton1Click:Connect(function() task.defer(paintThemes) end)
			themeRows[#themeRows + 1] = row
		end
		for _, name in ipairs(Themes.order) do addThemeRow(name) end

		sectionTitle(scroll, nextOrder(), "Import Theme")
		local nameBox = inputField(scroll, nextOrder(), "Theme name")
		local jsonBox = inputField(scroll, nextOrder(), "Theme JSON", 96)
		local status = new("TextLabel", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 18), LayoutOrder = 0, ZIndex = 3,
			Font = Enum.Font.SourceSans, TextSize = 13, TextColor3 = Configuration.Theme.Dim, Text = "",
			TextXAlignment = Enum.TextXAlignment.Left,
		}, scroll)
		local actions = buttonRow(scroll, nextOrder())
		status.LayoutOrder = nextOrder()

		local importBtn = toolButton(actions, "Import", 1)
		importBtn.MouseButton1Click:Connect(function()
			local name = nameBox.Text:match("^%s*(.-)%s*$")
			if name == "" then status.Text = "Needs a name" return end
			local okD, raw = pcall(Http.JSONDecode, Http, jsonBox.Text)
			local theme = okD and decodeTheme(raw)
			if not theme then status.Text = "Invalid theme" return end
			local fresh = Themes.list[name] == nil
			Themes.list[name] = theme
			if fresh then table.insert(Themes.order, name); addThemeRow(name) end
			local saved = Settings.saveTheme(name, theme)
			applyTheme(name)
			paintThemes()
			Settings.save()
			status.Text = ""
		end)
		local exportBtn = toolButton(actions, "Copy Current Theme", 2)
		exportBtn.MouseButton1Click:Connect(function()
			local ok, json = pcall(Http.JSONEncode, Http, encodeTheme(Configuration.Theme))
			if ok and Services.setClipboard then
				pcall(Services.setClipboard, json)
				status.Text = ""
			elseif ok then
				jsonBox.Text = json
				status.Text = ""
			end
		end)
		end)

		safe("Background image", function()
		sectionTitle(scroll, nextOrder(), "Background Image")
		local imageBox = inputField(scroll, nextOrder(), "")
		imageBox.Text = tostring(Settings.data.image or "")
		local function numberRow(label, key)
			local row = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26), LayoutOrder = nextOrder(), ZIndex = 3 }, scroll)
			new("TextLabel", {
				BackgroundTransparency = 1, Size = UDim2.new(1, -90, 1, 0), ZIndex = 3,
				Font = Enum.Font.SourceSans, TextSize = 15, TextColor3 = Configuration.Theme.Text, Text = label,
				TextXAlignment = Enum.TextXAlignment.Left,
			}, row)
			local box, holder = inputField(row, 1, "")
			holder.Size = UDim2.fromOffset(80, 24)
			holder.Position = UDim2.new(1, -80, 0, 1)
			box.Text = tostring(Settings.data[key])
			box.FocusLost:Connect(function()
				local n = tonumber(box.Text)
				if n then Settings.data[key] = math.clamp(n, 0, 1) end
				box.Text = tostring(Settings.data[key])
				applyBackdrop()
				Settings.save()
			end)
		end
		numberRow("Image transparency", "imageTransparency")
		numberRow("Panel transparency", "panelTransparency")
		local imageActions = buttonRow(scroll, nextOrder())
		local applyImg = toolButton(imageActions, "Apply Image", 1)
		applyImg.MouseButton1Click:Connect(function()
			Settings.data.image = imageBox.Text
			applyBackdrop()
			Settings.save()
		end)
		local clearImg = toolButton(imageActions, "Remove Image", 2)
		clearImg.MouseButton1Click:Connect(function()
			imageBox.Text = ""
			Settings.data.image = ""
			applyBackdrop()
			Settings.save()
		end)
		end)


		return win
	end

	local Fishy = { lib = nil, loading = false }
	local FISH_URL = "https://raw.githubusercontent.com/Civilation/Fishilizer/main/Fishilizer.lua"
	local FISH_LOGO_URL = "https://files.catbox.moe/5uumgz.png"
	local FISH_LOGO_PATH = "LX/fishilizer.png"

	function Fishy.logo()
		if Fishy.logoAsset then return Fishy.logoAsset end
		if not isFile(FISH_LOGO_PATH) then
			local okGet, data = pcall(function() return game:HttpGet(FISH_LOGO_URL) end)
			if not okGet or type(data) ~= "string" or #data < 64 then return nil end
			K.ensureFolder("LX")
			writefile(FISH_LOGO_PATH, data)
		end
		local ok, id = pcall(customAsset, FISH_LOGO_PATH)
		if ok and type(id) == "string" and id ~= "" then Fishy.logoAsset = id return id end
		return nil
	end

	function Fishy.get(onStatus)
	if not ALL_KNOWING then return nil, "Available only in LX All Knowing" end
		if Fishy.lib then return Fishy.lib end
		while Fishy.loading do wait(0.1) end
		if Fishy.lib then return Fishy.lib end
		Fishy.loading = true
		onStatus("Grabbing Fishilizer...")
		local genv = (getgenv and getgenv()) or env
		local prior = genv.FISHILIZER_CONFIG
		genv.FISHILIZER_NO_AUTORUN = true
		genv.FISHILIZER_CONFIG = { AutoRun = false, Console = false, CloseConsole = false }
		local ok, lib = pcall(function()
			local src = game:HttpGet(FISH_URL)
			local fn = assert(loadstring(src), "loadstring failed")
			return fn()
		end)
		genv.FISHILIZER_CONFIG = prior
		if ok and type(lib) == "table" then
			onStatus("Loading API data...")
			pcall(lib.Init)
			Fishy.lib = lib
		else
			onStatus("Couldn't load Fishilizer: " .. tostring(lib):sub(1, 80))
		end
		Fishy.loading = false
		return Fishy.lib
	end

	Fishy.opts = {
		Decompile = true, SaveBytecode = false, EmitAttributes = true, EmitTags = true,
		IgnoreDefaultProps = true, IgnoreNotArchivable = true, RemovePlayerCharacters = true,
		IncludeBackpack = false, StripCoreScripts = true, AvoidFileOverwrite = true,
		Anonymous = false, ShowStatus = true, Notify = true,
	}

	local function buildFishWindow()
		local win = K.window("fishilizer", "Fishilizer")
		local scroll = scroller(win.pane.body)
		scroll.Size = UDim2.fromScale(1, 1)
		scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
		new("UIPadding", {
			PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 14),
			PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 14),
		}, scroll)
		new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, scroll)
		local order = 0
		local function nextOrder() order += 1 return order end

		local head = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 52), LayoutOrder = nextOrder(), ZIndex = 3 }, scroll)
		local logo = new("ImageLabel", {
			Size = UDim2.fromOffset(48, 48), BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Fit, ZIndex = 4,
		}, head)
		task.spawn(function()
			while not K.lxIcon do wait() end
			logo.Image = K.lxIcon("fishilizer") or Fishy.logo() or ""
		end)
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(58, 13), Size = UDim2.new(1, -58, 0, 22),
			Font = Enum.Font.SourceSansBold, TextSize = 18, TextColor3 = Configuration.Theme.TabText,
			Text = "Fishilizer", TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 4,
		}, head)

		sectionTitle(scroll, nextOrder(), "Selection")
		local target = new("TextLabel", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 20), LayoutOrder = nextOrder(), ZIndex = 3,
			Font = Enum.Font.SourceSans, TextSize = 14, TextColor3 = Configuration.Theme.Text, Text = "Nothing selected",
			TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
		}, scroll)
		local nameBox = inputField(scroll, nextOrder(), "File Name")

		local function picked()
			local list = {}
			for _, inst in ipairs(State.selection) do
				if inst and inst.Parent ~= nil then list[#list + 1] = inst end
			end
			return list
		end
		local function refreshTarget()
			local list = picked()
			if #list == 0 then target.Text = "Nothing selected"
			elseif #list == 1 then target.Text = list[1].ClassName .. "  " .. list[1]:GetFullName()
			else target.Text = #list .. " instances selected" end
		end
		task.spawn(function()
			while win.frame.Parent do
				if win.frame.Visible then pcall(refreshTarget) end
				wait(0.25)
			end
		end)

		sectionTitle(scroll, nextOrder(), "Options")
		local labels = {
			{ "Decompile", "Decompile scripts when possible" },
			{ "SaveBytecode", "Fall back to bytecode if decompiling fails" },
			{ "EmitAttributes", "Save attributes" },
			{ "EmitTags", "Save CollectionService tags" },
			{ "IgnoreDefaultProps", "Skip properties that match their defaults" },
			{ "IgnoreNotArchivable", "Skip non-archivable instances" },
			{ "RemovePlayerCharacters", "Leave out player characters" },
			{ "IncludeBackpack", "Include backpack tools" },
			{ "StripCoreScripts", "Strip core scripts" },
			{ "AvoidFileOverwrite", "Don't overwrite existing files" },
			{ "Anonymous", "Anonymous" },
		}
		for _, l in ipairs(labels) do
			local key = l[1]
			checkbox(scroll, nextOrder(), l[2], function() return Fishy.opts[key] end, function(v) Fishy.opts[key] = v end)
		end

		sectionTitle(scroll, nextOrder(), "Save")
		local row1 = buttonRow(scroll, nextOrder())
		local row2 = buttonRow(scroll, nextOrder())
		local status = new("TextLabel", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 36), LayoutOrder = nextOrder(), ZIndex = 3,
			Font = Enum.Font.SourceSans, TextSize = 13, TextColor3 = Configuration.Theme.Dim, TextWrapped = true,
			Text = "",
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
		}, scroll)

		local busy = false
		local function run(kind)
			if busy then return end
			local list = picked()
			if kind ~= "place" and #list == 0 then status.Text = "Select something in the Explorer first." return end
			busy = true
			task.spawn(function()
				local function say(t) status.Text = t end
				local Fish = Fishy.get(say)
				if not Fish then busy = false return end
				local opts = table.clone(Fishy.opts)
				local name = nameBox.Text:match("^%s*(.-)%s*$")
				if name == "" then
					name = kind == "place" and ("Place_" .. tostring(game.PlaceId)) or (#list == 1 and list[1].Name or "Selection")
				end
				name = name:gsub("[^%w%-_ ]", "_")
				local subject = #list == 1 and list[1] or list
				say("")
				local ok, res
				if kind == "place" then ok, res = pcall(Fish.SavePlace, name, opts)
				elseif kind == "scripts" then ok, res = pcall(Fish.SaveScripts, subject, name, opts)
				elseif kind == "models" then ok, res = pcall(Fish.SaveModels, subject, name, opts)
				elseif kind == "copy" then
					opts.Clipboard = true
					ok, res = pcall(Fish.Save, subject, name, opts)
				else ok, res = pcall(Fish.Save, subject, name, opts) end
				if ok and res then
					say("")
				else
					say("Save failed: " .. tostring(res or "no output"):sub(1, 100))
				end
				busy = false
			end)
		end

		toolButton(row1, "Save Selection", 1).MouseButton1Click:Connect(function() run("full") end)
		toolButton(row1, "Scripts Only", 2).MouseButton1Click:Connect(function() run("scripts") end)
		toolButton(row1, "No Scripts", 3).MouseButton1Click:Connect(function() run("models") end)
		toolButton(row2, "Save Whole Place", 1).MouseButton1Click:Connect(function() run("place") end)
		if Services.setClipboard then
			toolButton(row2, "Copy XML", 2).MouseButton1Click:Connect(function() run("copy") end)
		end

		return win
	end

	local Apps = {}
	-- Script tools have a dedicated launch icon only in All Knowing.


	local function showMain(pane)
		UI.gui.Enabled = true
		if not ownerOf(pane) then
			local list = table.clone(mainWin.panes)
			table.insert(list, pane)
			setPanes(mainWin, list, mainWin.mode)
		end
		local w = ownerOf(pane) or mainWin
		if w.minimized then restore(w) end
		if w.mode == "tabs" then w.active = pane end
		w.frame.Visible = true
		bringToFront(w)
		layoutWindow(w)
		refreshDocks(false)
	end

	Apps.list = {
		{ name = "Explorer", icon = "Workspace", fallback = "Workspace",
			url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/studio-svg-textures/Shared/Ribbon/Dark/Medium/RibbonExplorer@2x.png",
			cache = "LX/ui/explorer_48.png", open = function() togglePane(Panes.explorer) end },
		{ name = "Properties", icon = "Property", fallback = "Configuration",
			url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/studio-svg-textures/Shared/Ribbon/Dark/Medium/RibbonProperties@2x.png",
			cache = "LX/ui/properties_48.png", open = function() togglePane(Panes.props) end },
		{ name = "3D Viewer", icon = "ViewportFrame", fallback = "Model",
			url = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/studio-svg-textures/Shared/Ribbon/Dark/Medium/RibbonViewportFrame@2x.png",
			cache = "LX/ui/viewer3d_48.png", open = function()
			local sel = State.selected
			if sel and K.viewable(sel) then Delve.open3DViewer(sel) return end
			if not UI.view3DWin then UI.view3DWin = buildViewerWindow(); applyBackdrop() end
			UI.view3DWin.empty.Visible = #UI.view3DWin.viewport:GetChildren() <= 1
			showToolWindow(UI.view3DWin, 24)
		end },
		{ name = "Fishilizer", advanced = true, lx = "fishilizer", icon = "Model", fallback = "Model", open = function()
			if not UI.fishWin then
				local before = #Windows
				local ok, win = pcall(buildFishWindow)
				if not ok then
					for i = #Windows, before + 1, -1 do
						local dead = table.remove(Windows, i)
						pcall(function() dead.restore:Destroy(); dead.frame:Destroy() end)
					end
				end
				if not ok then warn("[delve] Fishilizer window failed to build: " .. tostring(win)) return end
				UI.fishWin = win
				pcall(applyBackdrop)
			end
			showToolWindow(UI.fishWin, 36)
		end },
		{ name = "Settings", lx = "settings", icon = "GlobalSettings", fallback = "Studio", open = function()
			if not UI.settingsWin then
				local before = #Windows
				local ok, win = pcall(buildSettingsWindow)
				if not ok then
					for i = #Windows, before + 1, -1 do
						local dead = table.remove(Windows, i)
						pcall(function() dead.restore:Destroy(); dead.frame:Destroy() end)
					end
				end
				if not ok then warn("[delve] Settings window failed to build: " .. tostring(win)) return end
				UI.settingsWin = win
				pcall(applyBackdrop)
			end
			showToolWindow(UI.settingsWin, 48)
		end },
	}

	if ALL_KNOWING then
		table.insert(Apps.list, 3, { name = "Script Editor", advanced = true, icon = "Script", fallback = "Script",
			open = function()
				local sel = State.selected
				if sel and sel:IsA("LuaSourceContainer") then Delve.editScript(sel)
				else Delve.openScriptViewer(nil) end
			end })
	end

	do
		local baseOpen = Delve.openScriptViewer
		Delve.openScriptViewer = function(script)
			if not ALL_KNOWING then return end
			if script == nil then
				if not UI.scriptWin then UI.scriptWin = buildScriptWindow() end
				local sw = UI.scriptWin
				showToolWindow(sw, 0)
				if sw.editing then sw.setEditing(false) end
				sw.target = nil
				sw.status.Text = "No script open"
				sw.status.Visible = true
				sw.scroll.Visible = false
				applyBackdrop()
				return
			end
			baseOpen(script)
			applyBackdrop()
		end
		local baseView = Delve.open3DViewer
		Delve.open3DViewer = function(model)
			baseView(model)
			applyBackdrop()
		end
	end

	do
		-- App dock: a vertical strip of stacked app icons attached to the side of the Explorer window.
		local T = Configuration.Theme
		local G = { BTN = Delve_IsMobile and 38 or 30, ICON = Delve_IsMobile and 24 or 20, PAD = 3, GAP = 3, OFF = 0 }
		G.W = G.BTN + G.PAD * 2

		local dock = new("Frame", {
			Name = "appdock", Size = UDim2.fromOffset(G.W, 100), BackgroundColor3 = T.Header,
			BorderSizePixel = 0, Visible = false, ZIndex = 10062, Active = true,
		}, UI.gui)
		UI.appMenu = dock
		UI.launcher = dock
		watchHover(dock)
		local dockCorner = new("UICorner", { CornerRadius = UDim.new(0, 4) }, dock)
		stroke(dock)
		local cornerSide

		G.grid = new("ScrollingFrame", {
			Name = "grid", Position = UDim2.fromOffset(G.PAD, G.PAD), Size = UDim2.new(1, -G.PAD * 2, 1, -G.PAD * 2),
			BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 10063, Active = true,
			ScrollBarThickness = 0, ScrollingDirection = Enum.ScrollingDirection.Y,
			CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		}, dock)
		UI.appGrid = G.grid
		watchHover(G.grid)
		local layout = new("UIListLayout", {
			Padding = UDim.new(0, G.GAP), FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder,
		}, G.grid)

		local tip = new("TextLabel", {
			Name = "apptip", AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.fromOffset(0, 22),
			BackgroundColor3 = T.Panel, BorderSizePixel = 0, Font = Enum.Font.SourceSans, TextSize = 14,
			TextColor3 = T.TabText, Text = "", Visible = false, ZIndex = 10070,
		}, UI.gui)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, tip)
		new("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }, tip)
		stroke(tip)

		local side = "left"
		local function place()
			local ok, w = pcall(ownerOf, Panes.explorer)
			local show = Options.LauncherVisible ~= false and ok and w and isOpen(w)
			dock.Visible = show and true or false
			if not show then tip.Visible = false return end
			local k = uiK()
			local p, sz = localPos(w.frame), w.frame.AbsoluteSize / k
			local guiW = UI.gui.AbsoluteSize.X / k
			local contentH = layout.AbsoluteContentSize.Y / k + G.PAD * 2
			local h = math.max(G.W, math.min(contentH, sz.Y))
			local x = p.X - G.W - G.OFF
			side = "left"
			if x < 0 then x = p.X + sz.X + G.OFF; side = "right" end
			if x + G.W > guiW then x = p.X + G.OFF; side = "inside" end
			if cornerSide ~= side then
				cornerSide = side
				if side == "left" then K.setCorners(dockCorner, 4, 0, 4, 0)
				elseif side == "right" then K.setCorners(dockCorner, 0, 4, 0, 4)
				else K.setCorners(dockCorner, 4, 4, 4, 4) end
			end
			dock.Position = UDim2.fromOffset(math.floor(x), math.floor(p.Y))
			dock.Size = UDim2.fromOffset(G.W, math.floor(h))
		end
		game:GetService("RunService").Heartbeat:Connect(function() pcall(place) end)

		function G.setImage(ic, id)
			if type(id) ~= "string" or id == "" or not ic.Parent then return false end
			ic.ImageRectSize = Vector2.zero
			ic.ImageRectOffset = Vector2.zero
			ic.Image = id
			return true
		end
		function G.loadIcon(ic, app)
			applyClassIcon(ic, app.fallback)
			task.spawn(function()
				if app.lx then
					local started = os.clock()
					while not K.lxIcon and os.clock() - started < 10 do wait() end
					if K.lxIcon then
						local ok, id = pcall(K.lxIcon, app.lx)
						if ok and G.setImage(ic, id) then return end
					end
				end
				if app.image then
					local ok, id = pcall(app.image)
					if ok and G.setImage(ic, id) then return end
				end
				if app.url then
					local ok, id = pcall(K.remoteImage, app.url, app.cache or ("LX/ui/" .. K.sanitizeFileName(app.name) .. ".png"))
					if ok and G.setImage(ic, id) then return end
				end
				if app.logo then
					local ok, id = pcall(Fishy.logo)
					if ok and G.setImage(ic, id) then return end
				end
				local started = os.clock()
				while ic.Parent and os.clock() - started < 8 do
					local okN, name = pcall(studioNameForClass, app.icon or app.fallback)
					local asset = okN and name and StudioIcons.assets[name]
					if asset then G.setImage(ic, asset) return end
					wait(0.25)
				end
			end)
		end

		local count = 0
		local function addButton(app)
			count += 1
			local b = new("ImageButton", {
				Name = app.name, LayoutOrder = count, BackgroundColor3 = T.MenuHover, BackgroundTransparency = 1,
				Size = UDim2.fromOffset(G.BTN, G.BTN), BorderSizePixel = 0, AutoButtonColor = false, Image = "", ZIndex = 10064,
			}, G.grid)
			new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
			local ic = new("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(G.ICON, G.ICON), BackgroundTransparency = 1,
				ScaleType = Enum.ScaleType.Fit, ResampleMode = Enum.ResamplerMode.Default, ZIndex = 10065,
			}, b)
			G.loadIcon(ic, app)
			watchHover(b)
			b.MouseEnter:Connect(function()
				b.BackgroundTransparency = 0
				tip.Text = app.name
				tip.BackgroundColor3 = Configuration.Theme.Panel
				tip.TextColor3 = Configuration.Theme.TabText
				local k = uiK()
				local bp, bs = localPos(b), b.AbsoluteSize / k
				local tw = tip.AbsoluteSize.X / k
				local tx = side == "left" and (bp.X - tw - 8) or (bp.X + bs.X + 8)
				if side == "left" and tx < 0 then tx = bp.X + bs.X + 8 end
				tip.Position = UDim2.fromOffset(math.floor(tx), math.floor(bp.Y + (bs.Y - 22) / 2))
				tip.Visible = true
			end)
			b.MouseLeave:Connect(function() b.BackgroundTransparency = 1; tip.Visible = false end)
			b.Activated:Connect(function()
				tip.Visible = false
				task.defer(function()
					local ok, err = xpcall(app.open, debug.traceback)
					if not ok then warn("[delve] couldn't open " .. app.name .. ": " .. tostring(err)) end
				end)
			end)
		end
		for _, app in ipairs(Apps.list) do
			if ALL_KNOWING or not app.advanced then addButton(app) end
		end
		Apps.mount = addButton
	end

	function Apps.add(app)
		assert(type(app) == "table" and app.name and app.open, "app needs a name and an open function")
		if app.advanced and not ALL_KNOWING then return nil end
		app.fallback = app.fallback or app.icon or "Folder"
		table.insert(Apps.list, app)
		if Apps.mount then Apps.mount(app) end
		return app
	end

	function Apps.window(name, title, font)
		local win = K.window(name, title, font)
		function win.show(offset)
			showToolWindow(win, offset or 60)
			pcall(applyBackdrop)
		end
		return win
	end

	Apps.input = inputField
	Apps.button = toolButton
	Apps.checkbox = checkbox
	Apps.title = sectionTitle
	Apps.row = buttonRow
	Apps.scroller = scroller
	Delve.apps = Apps

	Settings.load()
	K.applyPerformance()
	if Settings.data.theme == "Grey" then Settings.data.theme = "2021 Studio" end
	if Settings.data.theme == "Light" then Settings.data.theme = "Next Generation Studio" end
	if Settings.data.theme == "Roblox Studio" then Settings.data.theme = "Next Generation Studio" end
	if Settings.data.theme ~= "Next Generation Studio" and Themes.list[Settings.data.theme] then
		applyTheme(Settings.data.theme)
	end
	K.themeReady = true
	applyBackdrop()
	Delve.Settings = Settings
	Delve.Themes = Themes
	Delve.applyTheme = applyTheme
end

do
	local drag = nil
	local ghost = new("TextLabel", {
		Name = "ghost", Visible = false, ZIndex = 20000, BackgroundColor3 = Configuration.Theme.Header,
		BorderSizePixel = 0, Font = Enum.Font.SourceSans, TextSize = 14, TextColor3 = Configuration.Theme.Text,
		Size = UDim2.fromOffset(160, 20), TextXAlignment = Enum.TextXAlignment.Left,
	}, UI.gui)
	new("UIPadding", { PaddingLeft = UDim.new(0, 6) }, ghost)
	stroke(ghost)
	local marker = new("Frame", {
		Name = "dropmark", Visible = false, BackgroundTransparency = 1, ZIndex = 19999, BorderSizePixel = 0,
	}, UI.gui)
	local markerStroke = new("UIStroke", { Color = Configuration.Theme.Accent, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, marker)
	local line = new("Frame", {
		Name = "dropline", Visible = false, BackgroundColor3 = Configuration.Theme.Accent, ZIndex = 19999, BorderSizePixel = 0,
	}, UI.gui)

	local function listArea() return State.gridView and UI.gridScroll or UI.tree end

	local function rowAt(m)
		local area = listArea()
		if not (area and inside(area, m)) then return nil end
		if State.gridView then
			for _, t in ipairs(tilePool) do
				if t.node and t.frame.Visible and inside(t.frame, m) then return t end
			end
			return nil
		end
		local ap, asz = localPos(area), area.AbsoluteSize / uiK()
		local best, bestD
		for _, r in ipairs(rowPool) do
			if r.node and r.frame.Visible then
				local p, sz = localPos(r.frame), r.frame.AbsoluteSize / uiK()
				if p.Y + sz.Y > ap.Y and p.Y < ap.Y + asz.Y then
					if m.Y >= p.Y and m.Y < p.Y + sz.Y then return r end
					local d = math.min(math.abs(m.Y - p.Y), math.abs(m.Y - (p.Y + sz.Y)))
					if d <= 6 and (not bestD or d < bestD) then best, bestD = r, d end
				end
			end
		end
		return best
	end

	local function autoScroll(m)
		local area = listArea()
		if not area then return end
		local ap, asz = localPos(area), area.AbsoluteSize / uiK()
		if m.X < ap.X - 40 or m.X > ap.X + asz.X + 40 then return end
		local EDGE = 28
		local dy = 0
		if m.Y < ap.Y + EDGE then dy = -(ap.Y + EDGE - m.Y)
		elseif m.Y > ap.Y + asz.Y - EDGE then dy = m.Y - (ap.Y + asz.Y - EDGE) end
		if dy == 0 then return end
		local step = math.clamp(dy, -EDGE * 2, EDGE * 2) * 0.35
		local maxY = math.max(0, area.AbsoluteCanvasSize.Y / uiK() - asz.Y)
		local cy = math.clamp(area.CanvasPosition.Y + step, 0, maxY)
		if cy ~= area.CanvasPosition.Y then area.CanvasPosition = Vector2.new(area.CanvasPosition.X, cy) end
	end

	local function canDrop(items, targetInst)
		if not targetInst or targetInst == game then return false end
		for _, it in ipairs(items) do
			if it == targetInst or targetInst:IsDescendantOf(it) then return false end
		end
		return true
	end

	local function where(r, m)
		if r.isTile then return "into" end
		local p, sz = localPos(r.frame), r.frame.AbsoluteSize / uiK()
		local f = (m.Y - p.Y) / math.max(1, sz.Y)
		local inst = r.node.inst
		if inst.Parent ~= game and inst.Parent ~= nil then
			if f < 0.3 then return "above" end
			if f > 0.7 and not State.expanded[inst] then return "below" end
		end
		return "into"
	end

	local function clearMarks()
		marker.Visible = false; line.Visible = false
	end

	local function finish(commit)
		local d = drag
		drag = nil
		ghost.Visible = false
		UI.tree.ScrollingEnabled = true
		UI.gridScroll.ScrollingEnabled = true
		clearMarks()
		if not (d and d.active and commit) then return end
		local m = d.lastM or mousePos()
		local r = rowAt(m)
		if not r then return end
		local mode = where(r, m)
		local newParent = mode == "into" and r.node.inst or r.node.inst.Parent
		if not canDrop(d.items, newParent) then return end
		local moved, failed = 0, 0
		for _, it in ipairs(d.items) do
			if it.Parent ~= newParent then
				if pcall(function() it.Parent = newParent end) then moved += 1 else failed += 1 end
			end
		end
		if mode == "into" and moved > 0 then State.expanded[newParent] = true end
		pcall(Cache.invalidate, newParent)
		for _, it in ipairs(d.items) do pcall(Cache.invalidate, it.Parent) end
		markDirty()
		pcall(renderTree)
		if failed > 0 then pcall(notify, "Couldn't move " .. failed .. " item(s) there") end
	end

	beginRowDrag = function(r, touch)
		if not r.node or drag then return end
		if not r.isTile and State.filterText ~= "" then return end
		local inst = r.node.inst
		if inst.Parent == game then return end
		drag = { row = r, inst = inst, start = mousePos(), active = false, touch = touch, t0 = os.clock() }
	end

	Services.RunService.RenderStepped:Connect(function()
		if not drag then return end
		local m = mousePos()
		if not drag.active then
			local dist = (m - drag.start).Magnitude
			if drag.touch then
				if dist >= 8 and os.clock() - drag.t0 < 0.25 then drag = nil return end
				if dist < 8 then return end
				if drag.row.cancelHold then drag.row.cancelHold() end
				UI.tree.ScrollingEnabled = false
				UI.gridScroll.ScrollingEnabled = false
			elseif dist < 5 then return end
			drag.active = true
			local items = {}
			if State.selSet[drag.inst] then
				for _, it in ipairs(State.selection) do
					if it.Parent ~= game and it.Parent ~= nil then items[#items + 1] = it end
				end
			else
				items = { drag.inst }
				selectInstance(drag.inst)
			end
			local top = {}
			for _, it in ipairs(items) do
				local nested = false
				for _, other in ipairs(items) do
					if other ~= it and it:IsDescendantOf(other) then nested = true break end
				end
				if not nested then top[#top + 1] = it end
			end
			drag.items = top
			ghost.Text = #top == 1 and top[1].Name or (#top .. " items")
			ghost.BackgroundColor3 = Configuration.Theme.Header
			ghost.TextColor3 = Configuration.Theme.Text
			ghost.Visible = true
		end
		ghost.Position = UDim2.fromOffset(m.X + 2, m.Y - 10)
		drag.lastM = m
		autoScroll(m)
		local r = rowAt(m)
		clearMarks()
		if not r then drag.hoverInst = nil return end
		local mode = where(r, m)
		local hinst = r.node.inst
		if mode == "into" and not r.isTile then
			if drag.hoverInst ~= hinst then drag.hoverInst = hinst; drag.hoverT = os.clock()
			elseif r.node.hasChildren and not State.expanded[hinst] and os.clock() - drag.hoverT > 0.6 then
				State.expanded[hinst] = true
				State.dirty = true
				pcall(renderTree)
				drag.hoverT = math.huge
			end
		else
			drag.hoverInst = nil
		end
		local np = mode == "into" and r.node.inst or r.node.inst.Parent
		if not canDrop(drag.items, np) then return end
		local p, sz = localPos(r.frame), r.frame.AbsoluteSize / uiK()
		markerStroke.Color = Configuration.Theme.Accent
		line.BackgroundColor3 = Configuration.Theme.Accent
		if mode == "into" then
			marker.Position = UDim2.fromOffset(p.X + 1, p.Y + 1)
			marker.Size = UDim2.fromOffset(sz.X - 2, sz.Y - 2)
			marker.Visible = true
		else
			local indent = localPos(r.label).X - 20
			line.Position = UDim2.fromOffset(math.max(p.X, indent), mode == "above" and p.Y - 1 or p.Y + sz.Y - 1)
			line.Size = UDim2.fromOffset(p.X + sz.X - math.max(p.X, indent), 2)
			line.Visible = true
		end
	end)

	Services.UserInputService.InputEnded:Connect(function(i)
		if drag and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
			if drag.active then
				local t = os.clock()
				for _, r in ipairs(rowPool) do r.dragSuppress = t end
				for _, r in ipairs(tilePool) do r.dragSuppress = t end
			end
			finish(true)
		end
	end)
	Services.UserInputService.InputBegan:Connect(function(i)
		if drag and i.KeyCode == Enum.KeyCode.Escape then finish(false) end
	end)
end

do
	local UIS = Services.UserInputService
	Delve_IsMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled
	if Delve_IsMobile then
		Delve_Scale = new("UIScale", { Scale = 1 }, UI.gui)
		local function rescale()
			local cam = workspace.CurrentCamera
			local v = cam and cam.ViewportSize or Vector2.new(800, 400)
			Delve_Scale.Scale = math.clamp(math.min(v.X / 1100, v.Y / 650), 0.55, 1)
		end
		rescale()
		if workspace.CurrentCamera then workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(rescale) end
		for _, w in ipairs(Windows) do w.snapped = nil end
	end
end


bootApps()

do
	local LX_PNG = {
		fishilizer = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\006\134IDATx\218\205Z\127\136\165U\025~\222\247|3\1873;\173;\235\182j[m\229F\027Z\168k\178E\025\137h\025\129\017\139%f\255\024i\022\244CEQZJ\011\255I\148 \132~\016\139`;+\180\020\248\135T\011\017I6\160\225R\160\224j?XB\154`\092\028\247\158\247}\159\254\184\231\2199s\157\025\199\185w\230\206\007\135\251}\243}\247|\207y\207\243>\239s\206\029\193\006:H\010\000\005 \000BD\226\013\158W\217 \160\005\128\138\136\245\220\219\002\224m\000\206\0050\009\160\0010\011\224$\128\127\138\200\236\176\1937$\155\246\250\248\241\227\163$/w\247\251\221\253/\238~\154K\028nnn\254\148\012\009\184\002@K\017\146{#\226K\000\190\168\170\187\000\192\221_\020\145'I\254\021\192K$\255\2154\141\187\251$\128w\001\248\016\128\143\173;]H\166\234z\191\187O\205\135\213\159\166\2177I\190o\133\253\165\181\198,\139\189\140\228\005\238~x\030\183?F\242\163KPl\164|\166\210\154^\234\173G\212\1556)I\222W\001?\218\233t\246\213\212*\224\180$\247J\004`\237\185\014\0009\231+\220\253o\005\249\241\156\243\167\234\217)m\232\170\248:~NOO\143\184\251\015\170\168\127\151\228\230*\226\186\161@\183\188-\215\231\187\251\031\010\240g;\157\206\135\2153\001WS\144PQ\230\211\238\254r\001\255\019\146\019Ub\202\134\004\159s\254\140\187\255\180\000&I\154\217W7l\212+\218H\206\249\170\005\149\210\253\191$\175\092\235\168\235\128\250\016U\189\010@\184\217+\000: O\138\200oK\212]D\184\225\006P\162\202b\009&\001\168\168\190\005\192(D\254U\192\179\002\191\146Y\144\129r{\169\169\175\011\148\153\029,\006\235Ew\127\206\221\127777w~yF\215=!\219\194\178\018O\227\238\247\150d\2533\201s\248\0287\013+\025\181\0234\201\243Hn\175\149\166\007\252\253]\240\254G\146\147=\003\212u\005_\157O\228\156\175q\247G\205\236(\201\201\214\155,\000\159\243\003%\242\199fff\206\026\154L\182/%\185\135\228C\238\254B\225\243\171$wWR\169U\228\127T\164\242\137\178j\194\212\212\212\2404>\231\252\009\1463\149\134\159f\135\251+\013\175\193?\092\158y\156\228X\239\012\0148\023u1\027\189\192R\147\220mf/\151\168?[hqs\233d\1646\092\158\253g\229\254oN\1568\177y@\224\229\224\193\131z\236\216\177\026\216\138\165T\220\253aU\253\138\187\127'\165\244\235\136\184%\165ts\145H\182-\034~\161\1707\186\251\209\148\210u\000rwU\184\252\206\193R\209=r\228\136\0308p`\201\221\135\226\157v\002\216if;\155\1669\219\179o\131b\011\201QUM\000 \150mFTTUw\003x\165\167\160\016\128\132\217!m\154\235#\2261U\189\030\128\189I\240R)Y\018\145\220\003v\018\192\133\238~\137\136\092Lr\175\000\239 \176#\1654\186|4\034hf\255&9Z\241m\132\164\020/?U8\255h\235{V@\155v\171DH\234\244\244\244H\143\210\009\201\139\204\236\219\238\254\184\153\253g\177\157\135\240\160Yv3\203f\214Y\172\193\205\255N\210r\206W\244De\147\187\255\170\128\127\164\146\210\021\129o\019\175\190\209\233t\246\185\251}f\246\140\187/\000k9{\011\202\205\178es3s\179\028f\182d\131\153}\185H\207?r\206\159%\249\246\178[\240\251\002\254P\165\008\250f\129\159:u\234\0923\187\213\221\255T\131.\000:6\0156V\211\132\164\132\217C\2184_/\148\130h\023gD\252\092Uoj9\188\028\231+~[\185~\127D\220\002\242\011\154\210\142\034\193\004i\016\017\144\009\210\191o\019\146*\034A\242\218\136\184\014\192\187U\245$\128_\138\200\225V\210\150\179\195$\147\136x9\127oD\220\001\224\006U\221\092\128\231\226|\169\034\013D\192\008#\144\0061\128%\001\146\1487\242\241-x\146[\034\226N\000\223P\213\137\136\000\201\140.H\001\192\148\146\134\199i\130\158R\026w\247\232\215>\171\136PDXom\180\231+\000\175\034\226\236t>\030\017O\169\234=\002L\184{\006\025e3V\004\240\148\146F\196\019\217\242\007RJ{#\226\145\148\146\002\136\190f\160\031\003(\034af\223R\213\031\138\008\204,\139H\170\251\149RK\008XJ\233\002\017y\190|\127\171\187\191\160\170g\135G@V\135\165o\015#\034o%\233]\176\210\000\008\240u\015\181\002\240Z\173\170\000L\164\173\151\235\188\164,\137\175)\165\187\204\236R\000\135E\005)\165\006\002\002\232&u7\207\092U7E\196\247I\158Er,\034\190\151R:\199\205\028\178z9\234[\199z\020h?\128\219H~NDP\1464J\0343\165\164\238~RD\178\170\190\211\205\216\175\148\014d\001]\172\182T5\224#\017q\187\170^{F\255\187G\164\148Z[\238\003\161p\191\191\176\244\244\209\254pq\186\220\191\028\192\237\017\241\201R\197\005\004\011\197\006\178\134X\151->7{^S\2183\168\168\215G\179\202\200\011\128&\034\030T\213\237\017\241j\171\249\017\001\237Z\145\022\232$\201\221\133F\003_\1855}\204\156\147|2\034\014\169\206\255\218Y\192/8JU^\147\157\185~\010\153\136\0089\199\247`3~\012\224\234\018\229\215*\251\208\190c\245\158\135\203\163\148AI\168\153\221*\034w\171\234yg\012\0927qu\016\174s-\235\128\182\251\159$wF\196\215\000\2204?\016# V\222\165\131\022\142\129uV\207\198\236\236\236\142\241\241\241\207\139\200\013\000.\171s\164(Q\020\003\161 \005\0348\2439L\025\237]\212\148\191\237\003pMD\092I\242\162\148\210\214E\190\135\136`\169\218lM \215{\000=\180\210\222-\019\146\187\000\092\008\224\146\136\248 \200=\004v\001\216\158R\2184T\010-3#\203\254\247\009\201\137\185\185\185\237ccc\219\000l3\179\173M\211\140\187\251h\139/\165\004w\151\161U\226%\006\1962\168\190\234\195\255\001\248\002\182k.\250o$\000\000\000\000IEND\174B`\130",
		settings = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\009\000IDATx\218\237Z]h\028\215\021>\231\222;?\187\179kE\165i$%H\179R\012u$\008\193\161I\211$\245C\233S\250V\139\166\142!\182i\011\237K\009\165\004S\144\004-\197\133\2469\015\141cpR\138\212\183&/\165`A\176\221\0229\201\131\228\020\138\178\179\1556\177\171\148\172\228\249\217\249\185\231\244e\166(\155\217\213\202V\009\165\1900O{\231\252\159\243\157sf\001\238\158\207\246\224A\018cf\004\000\181\177\177QJwvv\150\001 CD\190k\250\131\244\0003\011D\164\205\205\205\251\000\2249\2114\235ZkFD\204\127g)%&I\178\003\000\175\205\204\204\220,\222\185S\222\234\128\194\006\000\000\012\195\248\241\196\196\196\011\221n\023\132\016\159\184GD`Y\022|\240\193\007\019\000\240\163\226\221;\013'u nD\164\173\173\173z\020E_\234t:\153\239\251)\034\202\030Eu\173V3\016\241\177\173\173\173:\034\222\218\173\252g\169\000\002\000\007A\240y\000\152\140\227X\001\128,\009O\142\227\024\137h2\191{\171x\247N\152\139!\195D^\186tI\149Y\236\218\181k\146\153\149Rj\1960\140\007\2104\165\034\246{\188\004i\154\146a\024\015(\165F\152Y]\187vM\150\133d\206K\030\136\007\022\022\022\004\034\234\221\202\000\000!\034\231\137\152\002\0004\155\205#\163\163\163b{{;\235c\024DD\2378\142\218\217\2179\130\136\239\236.\000\185q\010^Y\193{ii\137n\187\010\021I\230y\222W\136\168\214h4\254\208\155t7o\222\028\011\195\240\140\148\242\148\016b:\2032(\243@Q\141\148R\192\204\155Y\150]\000\128\151\027\141\198\141^\158\205f\243\235B\008\223u\221\203{%:\238U\026[\173\2147\132\016\023\181\214\166\016\226\186\214\250u!\196\197\201\201\201\150\231y\223\148R\254\180V\171\205\196q\012q\028C\031\217w\211\005\203\178\192\178,\240}\127Sk\253\019\207\243~7===ED'\165\148\207\016\209CR\202\132\136NNMM\253~P\201\237g)\001\000\176\177\177Q\173V\171W\015\029:4\023\004\001T\171U\200\178\012\2268\014\152\249\175\136\248H\165R\017\221n7\203\153\012\155S\132\136d\219\182\138\162\136\152\249mD\252\162eY\142R\010\1940\004\199q`ggg\189R\169<>66\022\021\213n\168$^YYAD\164j\181\250\253z\189>\231\251~\006\000\020\134\161\142\227\152\165\148\142m\219G\133\016\034\138\034\002\0005\172\240\185 \002\000T\020E$\132\016\182m\031\149R:q\028s\024\134\026\000\200\247\253\172^\175\207\197q\252\003D\164\149\149\021\028\202\003\185\245\217\243\188)D\188jY\214}q\028s\175\128\156\007\231\001!\249\167h13\153\166\137i\154n\153\166\249\216\216\216X+/\004\180\151\0078O\154\023k\181\218X\028\199Tf\221\131\018\190\031-D\020I\146P\173V\251B\028\199/\2302\241@\015\020\025\223l6\191,\165\092\005\000c\191h\153[\147\017Q\020r1303\229\244q\159\2021\000dq\028\031;|\248\240\149\222\170\244\009\203\174\174\174J\000\000!\196\011\150e\025Z\235}\161$\017\145R\010m\219\022DDZ\235Xk\029\019\017\217\182-\148RHD\251j\224\180\214lY\1502M\243\135\187e,U\224\216\177c\133\192oI)QJ\137\204\204\1952\170V\171\130\153;A\016\188\132\136\199\1940\188?\012\195\251\017\241X\020E/\017\209v\181Z\021\195\026\166\232b\165\148HDo\247\200\248i$FD\205\204\184\184\184x\238\212\169S\166\148r\1930\012L\146\132\133\016\1310\131\028\199\017Y\150\253Mk\253\252\244\244\244\149\158+o\002\192\155\158\231\189\170\181~\197q\156\195Q\020\209\160\202EDl\154&\018\017\251\190\191x\225\194\133sy\248\232\161z!\215u\151\180\214'\181\214\029\2114\251z\130\153I)\133Z\235\127EQt\202u\221+kkkF^\205\016\000\144\153\197\218\218\154\225\186\238\229(\138\206\164i\250\177R\010\153\153\250Y\2224M\212Zw\180\214']\215]\026\186\023\202{\028\152\157\157\149\174\235\190\230y^\147\153_\151R\142\246\011_\1950\208\247\253\149\007\031|\240\242\250\250\186977\151\148$\034\173\175\175\155333o6\155\205\149j\181\250\221,\203J\141\034\165\196,\203>f\230g\092\215\189\178\188\188,\143\031?Ne-\197P\189P\171\213\186n\024\198\145$I>U\175\017\017\136\136\012\195\248\234\196\196\196\229]\002\247\029~\222\127\255\253\167\136\232\146\016B\244:\182\176~\154\166\215\167\166\166f\247\234\133\196^%\172\221nW\152y\156\136\250\213k@\196\132\153\223\205\203\231 z\128\136,\165\188\142\136I\217]DD\034\002f\158h\183\219\149\189&\182a{\151\130\200\129m\019\006\224\011\247\240\188\253\129\134\153qrr2\018B|(\132\1282\1549H\153\136x\132\153q\016\223\252.j\173\031\202A\178\244\142\016\002\132\016\031NNNF{\001\169\232'\248\242\242\178\204g\129'\000`\092k]\026BDDyG\250\028\034\242\198\198\1341\128\159\129\136\172\181>Q\169TD\025\168!\034j\173\129\136\198=\207{\002\017yyyY\246SD\148\009\191\184\184\136\243\243\243\218\243\188\019B\1367\148R\163\131\192'MS\182m\251\248\230\230\230\147sssIQFs\143 3\139\229\229e\019\017\147\247\222{\239i\2114\143\167i\202\131@\2094\205Q!\196\027\158\231\157\152\159\159\215\139\139\139X\166D\223\016\242<oAJyQJyOY\245\217\221teY\198J\169\207U*\149WZ\173\214\147\143>\250h\138\136\148'5#\034\205\207\207'\173V\235)\219\182_VJ\141fY\198\253\128\012\0171I\018\150R\222#\165\188\232y\222\194P\019\0253KD\212\173V\235\172\2278?\011\195\144\251U\1592\1719\142\131q\028ok\173\127+\165\252M\024\134\215k\181\026'I2'\165\2526\034~\203\178\172CA\016\176\148\018\135)\030B\008\168V\171\024\004\193\217\169\169\169\159\0232\150\002\217\234\234jA\244\017\1735k\173Y\244n\168\250\028)%\134aH\134a\140X\150\245\189(\138\190c\219v\154e\025\008!\012\219\182E\154\166\016\134!I)\135\162\153\231\003i\173\001\000\030\233\145\241\127\167\157ffMDO7\026\141\171\003\219\233\25226\026\141\171Dt\190Z\173\0343\235\219\024N\0043\003\017A\014J\144\175L\246k\012\157\203\240\2352\225\251%qQ9\206\249\190\127\195\178,Q\214t\013\0114\251\004\202\222\145R\004A\240O\203\178\206\229\145\176w\021\202\007h\209h4<\000\248\149R\010\001\128\242G\023\137eY\022\034\034\244\235(\247\177\157\000\203\1780\007J\006\000]\2403\012\003\153\249\151\227\227\227\222\202\202J\233je\224Z\229\198\141\027\149(\138\2544222\231\251\254\127e\173\210\237v5\017\189\211\187V\169\213j\176\189\189}{k\149\226\226\248\248x \165<\027\134a\135\153\1630\012\223\234v\187K\136\248\176\231y\1433\243\1378\1427\235\245\186\202Cm\024\225\193\178,Q\175\215U\028\199\155\000p\194u\221\199\017\241\225n\183\187\020\134\225[9\175\142\148\242\236\248\248x\208O\248\253\172\022\159@\196\218\249\243\231\255\216\187\171l6\155c\000pF)\245<\034\206\220\233jqaaA\156>}\250k\204\236\187\174{\229\142\191!,,,\244\238\131\254\211\151\020\161\150+\242l\167\211\225V\171\149\182Z-\238\243\164\157N\135\219\237\246\179\189\225\154\023\0149\136\247m\181\211KKK\180{\189\142\136\186\176\008\034R\222\247(\1950\222\013\130\128v+U\006\172A\016\144\016\226]fVkkkF\017\0269v\232\221\235\245\1896\211C\127\224\232\029\164w\159\163G\143jD$\207\243\182\001\224\239\134aL\166iZ\182i\003\1950D\154\166m\000\216F\196\172L\217b\015t\160\0318\246\202K\000\000\199q>\018B\180-\203\202\000\160\011\000I\207\211\181,+\019B\180\029\199\249\232\160\006$u@@$\016\241V\187\221\254\203\200\200\200\147\182m\171~\031\249\130 \248\243\189\247\222{\171\216\193~\230\010\020\237G>\023\252\162\221n\255\1954\205C\253>\1792\243\171=\225\242\255}\238\254\213\224\238\185\195\243o|+&\158\252\132\001\156\000\000\000\000IEND\174B`\130",
		hookspy = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\013DIDATx\218\205Y{l\092Uz\255\2069\247=\215\030\191\198v<N\156\216y8\182\243\194q\218\008G\014\001\018\005\177\209J0D\020$P\017P\197\005\237BQ\213\149\154aD\213V\165\162[A\183\212R\145V\013T]\007\020)\014J\128\176qp\148D\198\216\144U\176\227W\018\199\158\241\216\201\140\231u\239\157{\2079\253\131;t\226:q\008\009\217#\141f\164s\231\158\239\247=~\223\227 \000\128@ @:;;iss\243\146\202\202\202F\000\248'EQ\020Q\020\179\000\1289\231p/\022B\0088\231\220q\028\2094M\003c\252Z$\0189\223\219\219\027\201\201\140r?ZZZV\235\186\254\155\205\1557\251Z[[\013\159\207W\161\235\186\128\016B\247\018\000\165\0202\153\1403;;;\221\211\211\163\012\012\012\132M\211|\233\228\201\147\195\129@\128 \000 [\183n]\181b\197\138\1837o\222\092\211\220\220lWTT\212\148\149\149ydY\006\1401\220\203\197\024\003\203\178\224\234\213\171\198\244\244\244\165\254\254~\210\219\219;><<\252\139\179g\207^@\235\214\173\171\246\249|\191}\228\145G\150>\253\244\211:\231\188\210\182m`\140\001c,g\198{\233B\223+QQ\020\1421\142\0308p \217\213\2135\145J\165\158!---[6l\216\240\243\029;v\160\162\162\162\229\008!\200f\179\247L\232\133\022\231\0288\231 \008\002b\140yDQ\156I&\147\178i\154}\002B\232\205m\219\182\025\229\229\229+)\165 I\018\242z\189\128\016\130?\182E)\005\1950\160\162\162bikk\235\185\193\193\1937\005EQ\228\178\1782oYY\153'\153Lr\219\182\013Q\020\013\248#\092\182m\171\156s\217\231\243\233\241x\188RQ\020C\016\004!\171iZAqq1\204\206\206\198\142\0289rill\172\004\000\004\000\200\247#\1969Gw\209\223\217\205\182\001\192\169\173\173\189\244\208C\015\213TWW\151h\154&\138\162\152\0168\231\024!\1320\198,\145HXG\143\030\181\006\007\007_*..\158\205d2\216\005\129\004A\000B\136\2019\191\163@0\198\1401\134)\165\010c\140\186\194^\1678M\211X,\022+\171\175\175\255\213\150-[,\1401s\233\029\011\249\177\194\024\019DQ\228\215\174]\235\030\025\025I\204?\172\182\182v\153$I\182eY\236N\001 \132\136\024c\243\194\133\011\1797{\174\164\164\164P\020\197\191a\140]\231\025\194\245VD I\018\245x<\250\187\239\190\155\254\236\179\207p__\031\024\134!\151\150\150\254\133\215\235}\185\168\168(&\008\002\225\156\003c\236\199h\0308\231,\155\205J\177X,SRR\242R\034\145\232UU\149\215\214\214~\255\226h4\138\218\219\219\249\171\175\190\170K\146D]rA\011\001\2249\202\178,\139\238\221\187\151>\254\248\227\208\215\215G\215\172YS[XX\216\254\212SO\197\214\174][\170i\154\252c\001\008\130\000\142\227@*\149\186z\244\232\209\130O?\253\244\181\243\231\207?\022\012\006Q(\020\162\249\138=y\242$\247\249|4\143\218\023\180\192\013\151,\203\092Q\148\185\154\154\026\169\169\169\169\148\016r\167\2103\138\197bBeee\132\016\146\186-E\220\034}\241L&\163}\245\213Wv:\157\142j\154\1662\198\128Rz\219\146\139\162\008\1401H$\018\215FGGU\219\182\165\028a,\016\200\183\007\160\179\179\147\005\002\001266v1\030\143\255\234\208\161C\175\235\186>\1341F\1401\244#i\019\000\128\217\182\173d2\153t6\155\253\235\182\1826\233\253\247\223\231\000@\239\152\005:;;\169\251\194\131\238\231'+\133n\197\010\139\002\008\006\1318\020\010\177\245\235\215\151\139\162\184W\146\164\020\198\152\221\169\092\128\016\226\142\227 \1401\166\148\002c\172\192q\156\015\006\006\006f\220\179\249m\003\008\004\0028\020\010\177\154\154\154\202\242\242\242\223\172\092\185\178u\201\146%\150,\203\018\231\028\253\152\024\152\151\011\000\000\184eYV8\028\150GGG\219\026\026\026\246\133B\161\233@ \128\015\030<H\243\011\187\252\239[\009b\174(\138W\215\245\166'\158x\034\188a\195\134e\030\143G\200\127\201\157(\155\017B\144L&\197\254\254\254\203\239\188\243N\019!\196\011\000\145y\207!Q\020\191\007\141\016B\194-2\006\202\165}UU\169(\138w\165\203\145e\153\137\162H1\198|\190\139\034\1328B(\139r\153\012!D\008\177\022c!\142\016\002\198X<\153L\142|\248\225\135\027\207\158=\155\145eY\190\005\237\243\027\004\230\013\173`\154\166599Y\149H$\190v\028g\142s\142\220\166\006\173\092\185RN&\147K\198\199\199\195^\175\247\234\232\232\232\092<\030\175Y\204\002|\255\254\2538\020\010EdY~\249\204\1533/J\1464\231V\142\232fBs\206\025c\140\019B\128R\010\024\127W3\222\004\008\199\024#\219\182\189\008\161\255\024\026\026\010\191\248\226\139b0\024\228\000\1285MK\153\166y\228\248\241\227?\255\250\235\175S\209h\180(\157N\255nQ\023\010\133B\012\000P\127\127\255\008\000\188\246S\214\255\029\029\029\182+\003\000@\012\000\254\202\235\245v'\018\009277\135\021E9\178(\000wj\193\182l\217\178C\211\1807<\030\207\140 \008\176@\034C\008\161\172a\024~\1950:\027\026\026\222\030\026\026\034\229\229\229\172\184\184\152\015\013\013q\000\248gY\150\255DU\213\176 \008\194M\220\204A\008q\183\169G\148R'\155\205\022\027\1341\245\209G\031=\155\247?\180(\141vvv\210\218\218\218U\165\165\165\255\182k\215.\168\171\171\243\203\178\172~\231%\255Gi\130  \1401\031\031\031\191v\234\212\169}\211\211\211\195\221\221\221\135_x\225\005\177\163\163\003Z[[\223ljj\218\179}\251\246xUU\213f\143\199#\161\239\214b\25307\012\131\206\204\204\204\158:uj\185,\203\255\2059\223gYV\162\188\188\156\011yi=\02300\159\001dY\006M\211\204\230\230f\173\165\165\197/\2032\185\129\246\176\223\239\183\199\199\199g\029\199A\000\000===\232\177\199\030\251\187\134\134\134=\187w\239\142666V\023\022\022V\222,\160\023Z\134a\200uuu\023\143\031?\190\233\203/\191\252\245\196\196\196+\007\015\030\156\021\230\007\031!\132\171\170\138\246\239\223\159\235\198\192q\028\1934\205\146H$23111\169(\1382?\169\016B\000c\204\163\209\232l2\153,H\167\211\010\000@QQ\209[\141\141\141\143\188\242\202+\092U\213M\008!17\239\201\245\005\011\149\229\185Q\010c\0120\198 IR\241\234\213\171\189k\214\172\009wtt\180NMM\189\179f\205\154v\193\1736s,\1921\198\1481\134\223x\227\013\182m\2196!\016\008\160\158\158\158K\201d\178\227\192\129\003\237]]]1I\146\172\249\135b\140\001cl\199b\177\138d2y\156s\254\251\214\214\2147\235\235\235\127\182{\247\238\136\199\227\217$\008\130\152\003\237\010\200\243~\163y\217\246\186=B\008\034\132`Ji\245\142\029;\206\141\142\1426r\206\127+PJ\157T*e\154\166It]w\202\203\203\189+V\172\248\199\138\138\138_\158<yr\214}Y&\028\014\255\253\186u\235\142\002@\214q\028\182\128\175\034J)UU\181\2080\140+\195\195\1953\187v\237\250\211\007\031|\240\234\234\213\171\171\017B$\175\092\254\254?y.<\127\160\181\208\030\007\000\228\247\251\151\238\217\179\231\220\200\200\200}B*\149\170\138D\034\023._\190\092!\008B\249\206\157;#\150em9w\238\220?,[\182\236-Y\150u\1401s\015\1809\231\024/0ot\179tQ2\153\156\024\025\025\153\004\000PUu\210\239\247o-))\241q\206q\190@\174kX\000@\025c\010B\008\231\246(\165\156\016b\000\000b\140\169y\199!\000\224\005\005\005\197~\191\191\170\160\160 ,\024\134q\162\187\187\187\193\231\243]njjj\172\175\175\175G\008]X\178d\201\230h4z\216u\021\228N#\240B\025\212\237\015\178\153LF\155\158\158\190XZZ\250\242\217\179g\2510\198\138\174\2352\000\016\158K\171\174\240\209htr``\192L\165RZ]]\221\196\170U\171\170u]\247X\150e\142\140\140L\012\013\013)\162(\178\141\0277\178\170\170\170\154\092\023\2009\007\132\016\232\186.\139\162(\010\147\147\147\207\008\130\240\235\158\158\158\157555\227\162(V\215\215\215oX\191~}\130\016b\231\007k\142\155\231\003 \132\128i\154Z,\022\155x\239\189\247\150\1579s\230i\000\232\251nZ\131\255\159\011\000@\182\191\191\223\248\224\131\015\254\1994\205?\172]\187\246\153\231\159\127\190X\215u5\149J\153\199\142\029\155\249\226\139/\254S\150\229\130\185\185\185\231\246\238\221k\016B<9\225\243j!\016\134\135\135\179\187w\239\254E\127\127\255\191\196\227\241\157\219\182m;\223\208\208PUQQQ\172\170\234\173\022m9\193LUU-BH2\143\198Q>\219\184\022\179\034\145H\209\212\212\212\192\231\159\127~\240\217g\159}.\147\201\016\000p\024c\206\228\228\164~\232\208\161\2477m\218\180\244\202\149+\175a\140\237\188\130\238\186\248\017\092\179Z\000\240\234\253\247\223\255\175\233tz\237\165K\151&KKKmM\211\008!dQ\190\198\024\131eY<\145H$\167\166\166\138,\203\202,\006\216\178,nY\1507\024\012\010\131\131\131\018u\155\011\2069K\165R\130\223\239\247\001\128\2070\012\148\155\218-D\183\002\000\176`0\136_\127\253us\251\246\237\251\190\249\230\027\255\224\224\224\223\138\162(\019B\236[\236\188\016B(k\219v\185\2278\189\203\151/\127\171\183\183\023\016B\206\205\170O\199qh(\020r\158|\242I\200K\201X\020En\219\182\2059w\220f\231\1349C\200\021l\161P\008\005\131A\022\010\133.\001\192\011?d2\144o\012\000p\218\218\218\132[@\012\249\194\221\246|)\223\172\161P\008\130\193 v\005\129\031\154\238\001\000N\1568!l\223\190\029\186\187\187\127\146\138u\190\166\184\219D\223\238\200\013\001\000\180\183\183/\026\252\142\227 \132\016\014\006\131\248\219o\191E\185\202\144s\206)\165H\146$\001cL(\165h1\147\223\209\203\148\031\208>rM\2112\161P\136\169\170j\231\248\022!\132$I\162W\174\092If\179\217\184$I\252f\158 \220m\019\231\231\001w\160\011\000 \149\149\149]\243z\189\149\015?\252p\147\207\231\179TU\005\000 \024c\226\243\249R\015<\240\192fEQ\138+**\018\156\243\194{\006\128R\202\243\171J\183\199V6n\220\008\233t\250\185D\034\241R}}}\178\180\180T\004\000\162\235\186\188k\215.\189\178\178\242\223\005A\160[\183nE\156s5\199\253\1401\238*\1303\198\208]\005\192\024\163\153L\198\006\000\150?\001\193\024Cuu\245\178@ `b\140)\231\188\154\016\034\185\174\165m\218\180\169\254\190\251\2383\025c\024c\172\016\151\174r\227\023\000\128L&c\219\182\237\220\021\000\157\157\157\000\000`YV\241\204\204\204\181t:\173*\138R\2266\246\185\190\003\019B\180\133\232U\016\004\017\000\196\2494\155\187\173L\165R\137\153\153\153p&\147\169\194w\019\128a\024\225\211\167O\171\023/^\188\2009g\011\2209\243\252\214t\129~\224\186=\215\002(\028\014_\254\228\147O\164D\0341K\238\166\011\249|\190\227sss\0271\198\181---\006\231\092\207evJ\233u`r\218\205\239\242\242/Q(\165\185\241L\228\240\225\195\244\227\143?\142&\147\201?\191\155\000\208\228\228\164\165i\218\239)\165\027\162\209hUaa\225\021EQdUUU\1401r]\234\166+\247\140a\024\169\137\137\137\225\174\174.z\226\196\137\137H$\242\151g\206\156\185p7\131\152\187#\1538!\228\151\225p\248\237\177\177\177\198G\031}\244\015K\151.\173\2104MF\183v\155\206\013\195p\166\167\167\167\142\029;&\159>}:\026\139\197\246\245\246\246^hnn\022\127\138\235x\140\016b\235\215\175/*))\249\175\130\130\130\230\194\194\194)B\136L\008Y|>\2019d\179Y'\147\201\020%\018\137\153x<\254g}}}\163mmmBww\183\243\191\151>\192\206\006\168\192\147\000\000\000\000IEND\174B`\130",
		windows = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\013^IDATx\218\205Z{L\219G\158\255\206\252\222\182\137M\176M\012&\152\240\008\143\000mm\160\201A\162D}\252\209H9\157j8U\186nO\186M\181\219\235\165\186S/\247,\177zZUw\186\189\189\219f/\203=ziiW\197\169T\233\026\169\234Kp%I\147\148PH\008$4\217ub\130\001c\130\227\199\23953\247\199\225\136\176\161\152\132\213\237H\243\135\173\241|\231\243}~\1903F\000\000\193`\144\011\135\195\196\239\247{\182l\217\210\000\000\127/\203\178,\008\130\014\000\1521\006\249\012\132\0160\198(!\132\2114M\017E\241\149X,6z\234\212\169\0279\025\176\193\003\2296nii\169\177\217l?\011\004\002\174\246\246\246\172\203\229*\182\217l<B\008\229\003\000!\004\000\000\148R\2084\205\156\155\155K\012\013\013\145\179g\207\234\139\139\139\223\031\028\028\188\188g\207\030~``\192\220P\000\000\192\237\220\185\179\186\162\162\226\167\129@\160\220\239\247\027\197\197\197\229N\167\211*I\018`\140\215\181!c\012L\211\132\249\249y-\022\139E\199\199\199\245S\167N-LNN\254\128\227\184\203/\189\244\018\235\236\236\2200K\240\141\141\141\030EQ\142>\246\216ce\207=\247\156\1411\182\1970\012H\165R,\153L\230\220\034o\023\186\1871\207\139>\159o[]]]\002c\012\209h\244\223\227\241\248\015\187\186\186\190\006\000\014\0006\004\004\215\210\210\210\218\220\220\252\187\251\246\237C\014\135\195\135\016\002]\215\243>\244j\131R\010<\207\003\198\216\034I\210\220\226\226\162B)\189\168(\202\149\131\007\015\210\129\129\001\182!\022@\008\253CGGG\214\237vW\017B@\020Ed\183\219\239\209\230\131\012\198\0240\198@UUf\181Z+\246\237\2197v\237\218\181?7\012c\034\020\010\013oTP\243\178,KN\167\211\238t:\173w\238\220a\134ad\005A\200n\132vL\211\148\009!raa\161b\154\230\022EQ\210\186\174\163\141\012b\158\231y\221b\177\020\020\022\022B<\030_8y\242d\228\250\245\235\155\001\128\007\000\2460.\228\245zo<\245\212S\165uuu.\2114\005Q\020\137\166i\230\195Z\247\030\000\1401\140\016B\024c\154L&\181\143?\254X\155\152\152x\185\176\1760\158\201d\240\003\128@\024c\156\201d\204\173[\183\254U}}\189\171\161\161\001TU\229\024c$\231^\027\006`\185\219RJyA\016X\034\145\024\248\246\219o\147\015\187yEE\133-\153L\222N$\0184\157N\207f\179\217\205\178,+\000\000\179\179\179h\163\001 \132\016\136\162H\172V\171\237\216\177c\233\163G\143\034\183\219\189\170\186V;\132\219\237\198\000@fggG\251\251\251\131\147\147\147\217\197\197Ew<\030\143PJo3\198Pgg'[V\139\216\134X g^M\211HWW\023a\140\173\1829\002\000\212\215\215\007ccc\247\003A\027\026\026 \028\014\191:22\162^\188x\017(\165\155L\211|\243\234\213\171W\142\0289\034\006\131AR__\159\147OC\161\016{  ]]]\163###Q\198\152y\246\236\217\217\206\206\206/\221nw\241R\160\221\239p\168\187\187;W\1589\000\192\171L\180\202\239W\174\227\000\000\150\246D\015c\1295G.w\135B!\238\137'\158\240\154\166\249\134$I\006c\140\174^\156\017\183\236`d\249Z\198\024&\132\240\024\227\191\236\239\239\191\005\000\230z\235\195z\000p'N\156 .\151\203\182}\251\2467kkk}\219\183ow\185\221n\135$I<\250\142\220\248\127|\144\161\021\133\142e\179Y2??\127{rr\242\191FGG\175\023\023\023\031:q\226Dz=T#_\000\008\000Hcc\163\181\162\162\226_jjj~\167\163\163#\189}\251\246\034\151\203\229\144$\009q\028w\183\250\174\197\151\016B@\008\001M\211\216\236\236,W^^n\216l\182\210\205\1557\255$\153L\190\242\233\167\159\166\243\013n~Y^F\185\205\021E\185\171\173\156\191\127\244\209G\219\172V\235\235---\173\207?\255<f\140\213\001\128\144J\165P:\157~`\186!\203\178\171\169\169\201\209\220\220<\221\219\219\187\247\147O>\2497\191\223\255\183\251\247\239\255%\000\160P(D\191k\015\012\000\134\174\235\004\000\024\198\0240\198f&\147\129\215^{\141\007\000\212\223\223\143C\161\016-++\171lhhh\219\181kWF\150e\159,\203\034\000\000!\132\153\166\201\012\195`\166i\2305sk\009!\012!\004\146$\137\146$m\013\004\002\233\154\154\154V\175\215[\021\010\133h\127\127\255\154\092\158\171\174\174\254\139\166\166&\205\233t\186t]\191=>>\2064M\219\214\219\219\251\223\221\221\221\232\248\241\227\164\178\178\178\204\227\241\188~\224\192\001\206\231\243\149s\028\167\000\000\226y\254\238\020\004\225\158\207\2235\151\175\2298.gy$I\146u\211\166M\211\019\019\019U\186\174\015^\184paq\173\204\196\027\13419;;\171D\163\209R\139\197\178\185\163\163CG\0089S\169T\235\007\031|\016\001\128\025\142\227\172<\207\215\150\149\149\009\014\135\195N\008A\022\139\197P\020eM\210\135\016by\172\001\198\024\184\221n\1321.\008\135\195\1433\198\236\0000\181V,\240\028\199\189688\248\159n\183;\210\216\216\216\016\008\004\138\021E\217\154J\165\222\187~\253\250\231UUU\127\130\016R\021EY,((\240:\157N|\237\218\181\228\217\179g\167\162\209\232f\140\241\154-\231\202\012\180\026\000EQ\216\194\194\130C\211\180\001Y\150\231\025chE=\2505A\252\244\244t$\157N\143\156;w\174\181\166\166\230W\146$y\171\170\170\030{\225\133\023.\029;v\236\247\022\022\022\222]\092\092\156\160\148\202\000\128DQ$\011\011\011w\222{\239\189\249\169\169\169^Q\020\009!\228\187\136\029Z\145b\209\2348\025\163\148Z\017Bo\141\141\141\205\188\248\226\139B__\031\005\000\020\014\135\161\175\175\143.mu\023\008\127\254\252\249\153\246\246\246C\195\195\195?\206d2m\187v\237\186\236\245z\139-\022\139`\181Z3\130 \2329Mp\028\135\000\128\024\134!h\154F\206\157;\247#\248\013\142\158\158\030\163\167\167\231~-\235]\183\226\001\000\013\014\014\206577\191\028\143\199\143&\147\201\234\154\154\154\008\165T\140\199\227\146i\154\247p\252\028E\016E\209\240z\189Jee\165q?2\215\215\215gtvv\010\137D\162\001c\252cQ\020\239p\028G)\165h\141~\0001\198\204\220\001\017B\2044M\1930\012\131\016r\152R\026Y\186\217\192\000@y\000\160\000\128GFFn\239\217\179\231{\151.]*\191|\249\242\027\148\210rUU_\189p\225\194\185m\219\182U\034\132~\237:$\026\141\154\209h\244\158\239\247\236\217\195\135\195a\189\174\174\174\168\164\164\228]\191\223\191\169\182\182\214\225v\187k$I\2268\142C\249\020\188\156\198\009!LUU2777w\241\226\197_\140\142\142^\241\251\253\127<44\180\008\000\248.\027\004\000\180\132\236\026\000\004\239\201\181\028G\150\180\159\015W2;::<\197\197\197?ojj*okk\163\219\182m\243\020\021\021m\018\004\0010\198\235\186\229 \132\128\170\170\144H$\228\146\146\146)\187\221\222611\241SEQ\254lpp0\190\146N#\198\024tvv\226\028\223\031\024\02405M\203G\030\238\235\235\163\129@\160\145\227\1847:::\170\159}\246Y\027!\196\013\000\092*\149Z7U\206e\167%v\224hjj*\216\177cG\236\237\183\223n\159\153\153y\179\165\165\229\208J.\196\150\252\147\174\1451\238\167}\132\016\130\003\007\014\248\202\203\203\235\031\127\252\241\164$I\213\134a\128\170\170,\031\011\174\193\159\144,\203\002\000\148\180\182\182\142\223\188y\179\241\230\205\155\229\171\1459\182\030\000\193`\144;q\226\004innn\144e\249\149\167\159~z\214f\179\213e\179Y&\008\002\178X,\015\221>.\197\013\211u\029{<\158\210\189{\247\142\245\246\246\190\1587\157^\226I\203\211\025.//\231\034\145\136\145\019\160\170\170\034\138bEii)g\183\219\011\008!L\020E]\020Eu#\210j6\155U\000@p:\157\014\143\199\227\017\004\001\229\005@\146$\160\1482\1950\232\221.\133\227\140H$\162\174\208\146.\138b\202\225p\184\156N'LNN&\190\248\226\139\216\173[\183\09297x\152k&\159\207w\211\239\247{=\030\143=\022\139\137\162(\206\229\005@\016\004\172\235:N&\147\186\166i\188\197b\209l6[\225\163\143>\250\135\195\195\195o\229\026\016]\215\017B\136\2318\014$Ib\177X,\243\254\251\239\223\138\199\227\255(\008\002\034\132\228\197\141V\210\016A\016 \155\205\022\248|\190\174\234\234\2344\207\243\005KEU\204\011\000\165\020\171\170\138\230\231\231g\167\167\167]\133\133\133\214\182\1826'!d\239\240\240\240\187\185\022P\016\132\229\220\135\233\186.\017B\210_\127\253\245[\027\224ARYY\217\239\019B\248\165+ \004\000l-\000t)\183O666\254\221\1533g\254\186\168\168(RQQQ\179{\247n\179\160\160\192\153J\165\254gnn\238_\023\022\022~\1772\232y\158g\022\139\133\250\253~a\199\142\029\220\249\243\231\169\162(l\157~\143\218\219\219\217\201\147']\178,\1559\0259o\2047\136\217\212\212\212\149T*\149\169\168\168@\213\213\213s.\151\203\213\212\212\212!\008\194/\251\250\250~\164\170\234\197L&\1631\198\184\229\230g\140\193\208\208\144q\248\240az\252\248q\250 7}\227\227\227\204\229r\025\247+\128kv<\225p\152tww\227\211\167O\143$\018\137\151N\159>\189\240\225\135\031\206\222\184q\227\138(\138P[[K7m\218\148\165\148b\248\127\024yY \020\010\209\165\231\161!\140\241\161X,\246\179H$bkjj\0267M\211H\165R\165\028\199!\1950\216o%\000\000\128\129\129\001\243\224\193\131BOO\207pKK\203\031]\189z\181\246\210\165K\127c\024\1347\157N\255$\147\201\140K\146T\137\016\162\191\149\000r\252\188\187\187\027\135B\161\177\243\231\207\143\213\213\213\1412\198\164\137\137\137\009\0000\171\171\171\031\234\158\243A\198\186\2536\020\010\209`0\200\005\131An|||rbb\226\210\193\131\007\017\000\220u\161\092\134\192\0243B\008~\0169+\135(\138<c\012a\140\217\003[`y`/W\192\194\194\002\005\000&\008\002\162\148\002\1654'\004\011\130\144\001\000\250\217g\159\0099\218\190\222,D)\005\132\208m\158\231\245eY\142\002\000{X\205\208e\2045\247\198`\164\211iS\215ul\183\219S\005\005\005\213\173\173\173\127\208\211\211c,=\166\176\245L\198\024\011\135\195x\231\206\157\127\234p8\236\022\139E\2114\013\167R)\157\016\034\242\027\225\135\185w\002\158\231\229t:m\157\155\155\139)\138\226\177\219\237\142\142\142\142\185L&s\1960\012V\092\092\252iQQ\017\198\024\231\021\232\178,c\143\199c\250|\190\031VUU=\223\222\222\158P\020\197\030\141F\181X,6\163\170\170eC\000\184\221n\182\212|\164\147\201df``\000\246\239\223\255\171\210\210\210\202]\187v\149\002\192\244\1533g\014\213\212\212|\159\177\245Y\029cl\216\237\246M\187w\239N\004\002\001\159\213j\181^\185rebpp\208\194\024{u\195^\219\024c\232\200\145#\232\243\207?\127\212\225p\252sgg\231\230g\158y\198\149\201d\156\154\166%3\153\204\029UUE\132P\142\199\228\211\2000\132\016R\020E\151$\169\208f\179Y\016B\183\222y\231\157\244\201\147'o\206\207\207\127oC\159<s\255\133x\242\201'w\148\148\148\252\188\181\181u\243#\143<\194o\221\186\181\194\235\245\230\174\204\215\147j\017\0000B\008w\227\198\013}jj\234\219\175\190\250J\024\026\026\138D\034\145\151\207\15693\1376:/\215\215\215\139\151/_\214\003\129\192\142\162\162\162\255hkkC~\191\031o\217\178\197\185t+\001\235\176\000\016BX:\1576gff\166\191\252\242K\2037\223|3o\154\230\015\006\007\007\175\006\131A\014\253&\138K\238\149e\231\206\157\229.\151\171\153R\250O\178,gx\158'\235\141\001\000`\134a\008\170\170f\017B\135c\177\216\216\208\208\208tN\198\255\002;U\207\030\030\219\243\145\000\000\000\000IEND\174B`\130",
		remotes = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\012>IDATx\218\237Ykl\020W\150>\247QU\253r\181\187]m\183\223\172\177X\219`\199\216!\166\195\195\216\128\131\162L\164\236\168a\180\171\213\236h\002\210>\230\177?\178\015FQ\015\172&\171\236J\155YY;\147\137\242c\254\172\020T\235A\179\227\031D\008\007\227\128c\140\029a\228\006\219\1371`w\175\031i\183\187\202]\221]U\247\238\143\237F\014\009\012\136\236\192\238\228H\165R=\238\189\231q\2079\2239\023\224k\250\154~\191\009}\217\203\206\206N\25042;88h=\240\135\206\206N\2029\199O\171\1829\231\248^\229\222}\008\135\195DUU\011!\004---\223\020\004\001\001\128iY\022\162\244\201\024\196\178,\200\175MM\211\228\008\161>\000`y^\237\187[(\018\137\224\019'N\176\231\158{.\092__\191\195\235\245\190\092TT\228u8\028\140s\142\017BOJ\227\128\016\226\153L\006\233\186\190\166i\218\175\167\167\167GFFF~U\224\025\001\000\006\000\182\127\255\254?\241\251\253?\222\185s\167\181o\223>;\024\012\006\157N'!\132 \206\249\147qP\132\128s\2064Mc\203\203\203KCCCxxx\024\146\201\228\143\207\1569\243\030\000`\212\222\222\238\018\004!\220\218\218z<\028\014[\229\229\229^A\016\130\178,\019\132\016`\140\225\009\011\000\182m\131\166i\204\182\237\255ZXXH\245\245\245\225\241\241\2417L\211T\169\219\237\174\244\249|\199w\239\222\157{\230\153g\2340\198.]\215\1930\012\2069\127b\204o$\1401H\146\132<\030OE \016(\142\199\227\179\243\243\243\199\147\201\228%\210\210\210r\244\192\129\003\213mmm\165\146$\149X\150\197M\211Dy\255@O\003\001\000\226\156#\198\0243M\147J\146\148%\132\196\227\2418\161\000\240\253\134\134\134\021\159\207\023\004\000\228\241x\144 \0086B\136?e!\020\153\166I4M\131@ \016ljjZ=w\238\220\247\169\203\229\138\251\253\254@ii\169\176\188\188\156\187}\251\246g\201d\146 \132\240\211\034\004\231\028q\206Yqq\177]TTT\018\008\004\196\229\229e\159\219\237\142S\000\144(\165\216\237v\195\236\236l\226\221w\223\157\155\155\1553\008!\156?\156\003\016\000 \143*,\231\028\001\128\157\191~\1553#\219\182\209\166M\155\156\175\190\250*\218\180iSP\020E\012\000\018\005\000\158\223\239v&\147\129O>\249\132|\240\193\007\2236\012c1\255\254~\140\021\198\153\143\169`a\195\092\247\131;\220\233t\150uuu\245e2\025\000\000;\239\027\156\222\163\021\226r\185LY\150s\153L\198|\144\001\010\153\187\165\165e\139\211\233\252\006Bh\005c\140l\219\006B\200\151\142)|c\140q\206\185b\024\198o&&&\166\011s=(\156\202\178\156s\185\092&\231\156\020\146\220](\1771\211b\140y\222\188p?\011455\137\170\170\230^z\233\165\026\175\215\251o%%%\207\148\148\148\228DQ\020\011\177\251Aq\2214\205\220\210\210\146\152H$\014\213\212\212|WU\213\219MMMb4\026\205\221\207\002\156s\1321\230\027\231\250\028\022z\148\176\028\141Fs\221\221\221e\178,\255b\215\174]\202\174]\187\150+**\202\157N'y\024\001\012\195\160\177X,>44\020\184t\233\210;\221\221\221\223\030\024\024X,\160\130Ga\230Q\005@\225p\152.--m\169\173\173\253\135\182\182\182\234\174\174.\217\229rUZ\150\133\211\2334l4\239\151\009P\000i\197\197\197\222\238\238\238\005\206\185066\246vgg\231\235\165\165\165\211\170\170\154\015\240\187/j\243Q\184\015\135\195\014UUs\008\161\215\234\234\234\182uvv\010\197\197\197\213\162(\226t:\205u]\231\235\235\235\015\188t]\231\134apQ\020\177\207\231\171\222\187w/\221\188y\2436\132\208k\170\170\230\194\225\176\227\145\182\195\195\254\216\217\217IUU5\218\219\219;\020E)kkk\203\250\253\254:\2114\185i\154\092\016\004D)E\132\016D\008A\148\210\207]\027\223\011\130\128\242\227\192\239\247\215\181\181\181e\021E)koo\239PU\213x\148\130\138>\164\230\137\170\170\214\243\207?\031jhh\248\215\003\007\014\200\245\245\245\165\030\143\135\230\001\031\179m\027e\179Y0M\019\024c_\216F\005`(\008\002H\146\004\249<\131\024c\180\190\190\190\226\149W^\161\231\206\157\235\149$\233\007\131\131\131\195\0271\255c\009P\152(\020\010m\247\251\253?\223\191\127?9t\232PP\215u\239\252\252\252\146\174\235\134\166in\191\223\1759\157N\191$IE\132\016\1321\190\011\195\243\206\203\179\217,K\165R\186a\024\137D\034QTTT\180\238\241x\156\178,\151\190\248\226\139\1521f.--\253<\020\010}GU\213\143\243k\179\199\182@}}\189T]]\221\220\220\220\012\013\013\013\238t:\237M$\018\179\131\131\131+\195\195\195,\155\205\222\242\249|\127x\240\224\193\197\198\198\198M\178,\151QJ\193\182\237\187h2\151\203qM\211\150\162\209\232\173\179g\207:\146\201\228e\135\195Q\187s\231N\188o\223\190uJ\233\031444$v\236\216\145\154\156\156l^^^\142\002\128\245X>\016\014\135\177\170\1706!d\147eY?\218\177c\007*++\171\212u=y\225\194\133\213\129\129\129\192\244\244\244ON\159>\253\173h4z\166\191\191\191|jjj\030!d\136\162X\200\214\092\020E@\008en\220\184\177\208\223\223_q\253\250\2453\167O\159\254\214\212\212\212O\206\159?_r\225\194\133\132\166i\201`0X\249\236\179\207\034\2114\127D\008\217\164\170\170\029\014\135\241c;\177m\219\150$I\153\146\146\018%\024\012\018M\211\210W\174\092\177\230\231\231\255v||\188?\018\137\136/\188\240\194\235333\191\184r\229\138\1361^\023\004\001\010\245\004\165\020\008!\235\163\163\163\226\244\244\244\219\146$\189\030\137D\196\241\241\241\254\219\183o\255\221\232\232\168\149J\165\210eeeDQ\020\197\225pdl\219\182\190\178(\148\205f\129\016\194\156N'%\132X\153LF\200f\179\171ccc\253\199\142\029\019FFF\208\201\147'\173\213\213\213S\134a\020\208#\216\182\205m\219\230\000\000\1401\148\201d`ii\233\189\161\161!kdd\004\029;vL\024\027\027\235\207\229r\137L&#\008\130`\185\092.B\008\201a\140\217W\022\133\028\014\007g\140\217\186\174g\210\233t@\150\229\156\162(\193\221\187w\247\014\012\012\252\229\167\159~\154mmmm\244\249|o\005\002\001\027c\140(\165\224r\1850\000\000\165\0200\198(\024\012\218uuuo\151\151\151\255\240\253\247\223\191^SS\227\216\187woo \016(\247z\1899]\215EM\211\140l6\235C\008\137_\153\000\130 84M+\141\197b1EQ|N\1673\208\211\211\019\203d2\251l\219>\137\016\250\165,\203o\181\181\181U\133B!\219\178,\175i\154\204\229r\025\000\000\166i:-\203\242vtt\144T*U5::\250\211\250\250\250\031*\138\242g\245\245\245]===\009\183\219\173,,,h\183n\221Z2Ms\153R\154\254\170\004@\134a|\166\235\250\248\192\192\192\150\210\210\210[\013\013\013\219\182m\219\214@)\157\169\168\1688\148J\165\254\168\162\162bm\231\206\157PSS\211H)%\215\174]\155\190z\245\170\139s\142Z[[\2317o\222\188e\203\150-\141\146$M)\138R\018\139\197\254S\150\229tGGG\170\177\177\177A\150e\233\218\181k3\003\003\003\138eY\175ONN\222\201'O\251Am\157\007\010\160\170*\139D\034\232\196\137\019\139\138\162|\247\250\245\235o]\188x1T]]=G\008\169jjjj\221\190}{\010!d[\150\021\180,\203C)\205\172\174\174\222\233\235\235\195\019\019\019\255\002\000p\243\230\205\1918z\244\232M\159\207WQ[[\187m\243\230\205:!$\203\024SL\211\148\001\128\165\211\233\155\023/^tLMM\141\172\175\175\127\026\137D0\000\176\193\193\193\223n\129\188\132(\159p\144(\138w\005;q\226\004\003\000<::\250\217\193\131\007\255|xx\184weee\207\158={&\183n\221ZURR\226\197\024cM\211\172X,6?11\1772<<\236\153\157\157\253\229\224\224\224O\001\000dYv\189\243\206;\223\009\133BS\205\205\205\129\202\202J\197\227\241\184\024cl~~>q\237\218\181\133\161\161!\207\204\204\204\135\008\161\239\141\141\141\233ccc\005d\138\000\000DQ\164\027!\245\231\2244c\140\023\170\034\140\177\165iZ\250\212\169S\228\240\225\195\133T\206\000\000\159={v\029\000\190\183{\247\238\159\173\175\175\215\204\205\205\017EQ2\130 \160T*\197VWW\231'&&\216\204\204\204\175\135\135\135\223\008\135\195$o\2017B\161\144\168i\218\193X,\150)..\182eY&\166i\242\149\149\149\213\0277n\172NLL\092\157\153\153\249\171\197\197\197\245|\153ZX\155\159:u\138\028=z4\1411\182\010\189\219<\207\1362\198X.\151c\000\128\004A\176$I\018\171\170\170Z\143\0289\242A8\028\022\155\154\154X<\030G\229\229\229<\145H\008{\246\236\201\188\249\230\155\175NNNV\222\184q\227\159(\165\022\000d\025c^\219\182oQJ\255\177\170\170*\025\137D\196x<\206\243\173K\018\141F\223\152\159\159\255\217\220\220\220\223\019Bj1\198k\000 Y\150Em\219\254\027\1950\022z{{\217\208\208\144\228\247\251\237x<.\148\151\151\243\145\145\017r\228\200\145lSSS\171\195\225\016EQ\180\000\000g\179Y\198\0243\169eYxmmmmyy\185\198\227\241\208\173[\183\138+++oy<\158\215TU={o\191\181\183\183\023\242\218\153\003\128\195\143XO,\001\192_\223\239\227\225\195\135\225K\138|\171\163\163\227` \016\248\231\230\230f\171\168\168\136\198\227qH$\018\137L&SF5M+\155\154\154\154R\020%\230\247\251+\186\187\187\019\182m\235\151.]:\190w\239\2226\219\182]\008!v\015\178\196\133;\198\255\147\011\025c\133b\134\229K@~og!\127\195\005|T\024\151\031s\247\190q\029\132PZ\150\229\158P(duvv\022QJ\149\133\133\133X4\026\213\001\224=\154\205f\143\015\014\014\254\160\180\1804q\224\192\001\159 \008[\014\029:t\187\177\177\209\181\184\184\248\026\000\216\027j\228\223uo\148s\206q0\024\092\174\173\173\245\004\131\193jI\146\140\015?\2520q\254\252\249\210\181\181\181_\161|\177\242\167---\199_~\249eVSSS\236v\187+\138\139\139\153\219\2376\158\134\198\150\174\235\174d2\137\012\195X\152\155\155[\235\235\235\163W\175^}\1954M\021\181\183\183\011cccfOO\207\031\203\178|\178\163\163\195\236\234\234b\149\149\149A\183\219M\016B\248I\183\215\211\233\180}\231\206\157\248\249\243\231\241G\031}$&\147\201\200\185s\231\254\029\000\240\023\0148\234\234\234vx\189\222o\228\0158\248\163\214\205\255\011\196\010\007\028\201d\2427\179\179\179\151/_\190\252\031\027\0158>Wy\001\000l\223\190\253\155\024c\2440\005\197\239\136(c\140\127\252\241\199}\247\242\250\127\254\144\239\255\2151\235\215\2445\253\030\210\127\003\138\145F\181\229z\0257\000\000\000\000IEND\174B`\130",
		console = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\013\008IDATx\218\205Y}PTW\150?\247\189\251\250\189n\232\166i\187\001\141\004a\137H+\162\005R\168\176\141F\009\146X\166\018[\255\208\170$[[d6\238leJ\199YS3\162e\166&\181\179\235$\179[\025\199\153\181\180\180b\021\173\212\134\004\193\01564\001j\034v\008:t\218\006?\192\016\154\166\161i\250\243\245{\239\222\249#\221)b\249\153\009\145S\245\234u\245\171\247\238\253\221s\206\239\254\206\185\008\000\192j\181\1786\155M)))\153\159\149\149\181\020\000\254C\016\004\129\227\1848\0000\148Rx\018\134\016\002J)\149e\153\139\197bQ\134a~\238\241x\156===\158\228\156Q\242\199\170U\171\022\167\166\166\190_ZZj\170\168\168\136\154L\166\204\212\212T\140\016BO\018\128\162(\016\137Dd\159\2077\214\217\217)|\241\197\023\163\177X\236\167\029\029\029\003V\171\149E\000\192\174^\189\250\153\220\220\220\255.--\205)))\145233s\140Fc\010\207\243\1920\012<I#\132\128(\138011\017\029\027\027\027\234\237\237e{zzn\013\012\012\188\249\217g\159\185QQQ\209B\147\201t\162\182\1826{\231\206\157\169\148\210,I\146\128\016\002\132\144\164\027\159d\008}\187\136\130 P\134a\188\167N\157\010~\252\241\199wB\161\208+\236\170U\171\202\138\139\139_\092\191~=\210\235\245\139\016B\016\143\199\159\216\164\239e\148R\160\148\002\198\024\017BR8\142\027\015\006\131|,\022s`\132\208o+++\163\025\025\025\249\138\162\128J\165Biii\128\016\130\185f\138\162@4\026\133\204\204\204\236\138\138\138k.\151\235\183X\016\004\222h4\166\025\141\198\148`0H%I\138r\028\023\1339h\146$\169)\165\188\201dJ\157\154\154\202\018\004!\1381\198q\141F\163MOO\007\159\207\231onn\030\186y\243\166\001\0000\000\204\140#D)E3\226\147\222\245|V\211\001\000\228\188\188\188\161\013\0276\228,\092\184\208\160\209h8\142\227\1661\165\148A\008!\134a\200\244\244\180\216\218\218*\186\092\174\159\166\167\167\251\034\145\008\147\152$\194\024\003\203\178\177$\008Q\020\133\004\008\152e H\163\209\016\191\223o\092\178d\201[eee\034\1950$A\239\012\158\153+\132\016\204q\028\157\156\156\180\015\014\014N\223\253\165\165K\151f3\012C%IR\092.\215\232\143\025>\006\131A\199q\220>B\200w\034\003\127\151\181\016\168T*%%%%\245\200\145#\225K\151.1\014\135\003\162\209(\159\145\145\241\186N\167\2517\158\231\131\145HD0\026\141\251:;;m555\188V\171\149gk\226^\175\023\237\218\181\139\238\222\189;U\165R)\009rA\247\002@\147\148%\138\162\178}\251ve\235\214\173\224p8\148\130\130\130<\157N\247\175\219\183o\247/Z\180H\184~\253z\168\177\177\241\224\202\149+c\173\173\173\031\153\205f\149\211\233\140\207V\008uttP\147\201\164\204\160\246{z\224A\027\010MII\009\228\229\229\009yyy\207\232\245zo<\030\031ikk{\135\016\034\246\245\245]())\225\028\014\135\252#&\246\227\001\008\006\131j\183\219\029\213\235\245^\189^\159U]]\1419\142\027\010\135\195\239\169T\170\215{zz:,\022\011\182\219\237\202\143\009\226\129B\199f\179\017\171\213\202j4\154\219~\191\127\223\1533gT\029\029\029_\139\162\232S\171\213\198\242\242\242\133;w\238\012\231\228\228\188_TT\244\172\221n\151KJJ\240\143\233\129\135*5\155\205\166\188\240\194\011JWWW\227W_}\245\139\139\023/\170\219\218\218n\251|\190\177\005\011\022d\174^\189:\239\185\231\158\139\020\020\020\188\187f\205\154j\135\195!\213\213\213qs*\132\014\030<H\018\225\241\017!D\140D\034\239\009\130p\135\231y\150\231y\227\186u\235\254A\171\213\014\157>}\250\240\138\021+\246\030=z\244\092R\166?q\015$\205n\183\203\022\139\005\247\245\245]\240\249|\187\026\027\027u---\003^\175\247kA\016\012\197\197\197\011\183l\217\034-_\190\252\157\234\234\234\023m6\027\169\175\175g\230\012\128$\008\171\213\170\186|\249\242\255\187\221\238\127\234\238\238\214NNN\250\194\225\176\152\158\158n\170\169\169\153_\092\092\172\2318\206\156H\228\185\005\000\000\160\191\191?\169\012c\138\162\1763e7\243\141\017B\008\000\000\140\142\142\1629\145\003I\171\169\169\225[[[\197\213\171W\1751\026\141\127,++\011\024\012\134\133\026\141\134\159\154\154\154p8\028#\215\174]\227%I\186\005\000\200\239\247\147\153\187\230\227\148\000?8\000\139\197\130[[[\197\229\203\151W\232t\186\255\217\178e\139XQQ\177\136\231\249,I\146\166\157N\231\176\205fS\143\140\140\028\234\233\2339m\181ZUf\179Ynhhxd/\219l\182\228\157\002\000\249\193\000PJ\017BH.**\250\199\252\252\252\223\175_\191^.--\205\204\202\202\202\010\004\002\193\182\182\182\129\150\150\022\237\196\196\196[===g\019\147\136\207\009\026\181Z\173\236\129\003\007\232\1545k\170\210\210\210~\191n\221:q\211\166MO\169\213\234\172\145\145\017\191\219\237\190y\254\252\249T\183\219\253\139\190\190\190\255\171\172\172|\030c\252\239\026\141f\148a\024L)\165\143\210\024\160\148\210D\197e\012\135\195\007/_\190\220n\181Z\025\155\205F\1907\128\196\007\148\194\194\194grss\223\127\249\229\151\163\229\229\229\025j\181:+\030\143\007>\255\252\243\0276\155M\239\241x\246\244\245\245}h6\155\203t:\221\187\181\181\181\177\236\236\236\092\181Z\205QJ!\153\212\247e\146\004@Q\020\163\003\003\003\209\011\023.\252\161\176\176p\179\205f\027\176Z\173\236\1533g\148\007\002HJ\212d\023`f\229\1494\173V\027[\188x\177\214`0dONN\250\174\092\185r\171\165\165%mhh\232\205\190\190\190f\000@,\203*Z\1736\182j\213*\092TT\180@\016\132\199\209D(\018\137(:\157n\176\171\171+*\138\226c\133\208\183\003\177,K\213j5\218\191\127\127\178\026\003EQ\216h4\170\247z\189>\141F\227\186~\253z\248\236\217\179iw\238\220\217\215\215\215\215\156\159\159\207\015\014\014\138\146$q\209h4\221\227\241|\149\150\1506\146\146\146\130\009!\015e\161d\003!\020\010\137ccc\225X,fbY\246;\209!\008\002\131\016\002\134ahb\177\191\169\020\019\1972\000\000e\024\1342\012\163\016B\152C\135\014\145\202\202Jl\181ZQgg\231p \016\248\223S\167N\253D\173VO\135B\161y~\191\255\151\189\189\189\141\022\139E\000\000y\199\142\029\216f\179\185\167\167\167\255|\236\216\177\215\245z\253\004\198XE\031\177?\1950\140\034\203\178\028\008\0042#\145\200\251\241x\252V\146\145\018\133\150\172R\169$\000`\019\225F)\165\018V\020E\014\133B\177X,\198\166\166\166\202\025\025\025i\185\185\185\239dff\254\172\163\163\195\151\024?2::\250\235\162\162\162s\008!\202\178\172\210\219\219{\021!\004v\187=\150\184\003\000L:\157\206\003\197\197\197\231\000 ,\138\034\154Q7?\144\229dY\2308\142\003\000PMMM]\171\168\168\144\140F#\151\151\151G\026\026\026\208\178e\203tz\189^\230y\158\139F\163\212\239\247Gb\177\152\001\135B\161\005\030\143\199=<<\156\1371\206\168\174\174\246\136\162Xv\237\218\181\223<\253\244\211\135y\158Oe\024\134$\006\146\146IYPPP\138\016\186;;\017\198\024)\138\018\163\148b\150e\031\186\242*\149\138#\132D].W\239=\246\004\197\225p\192\166M\155x\157N\247g\181Zm\212\235\245Q\143\199\131GGG\189\138\162L\227h4\218n\183\219\205&\147ix\217\178eK\151,Y\178\004!\228\158?\127~\169\215\235\253(\193 \136R\138(\165\204L\151\223o5)\165\236\195vS\1401\016B\168(\138\200\231\243I*\149\234g\225p\248\130\211\233\140?\255\252\243ej\181:\135\016\194\132B!Gkk\235`yy\249_&''\183\221\186uktzz\250Nww\183\009c\188\011\229\231\231\243999\239Z,\150\234\029;v \142\227\022*\138\130U*\2134\203\178R\178N\158\209\011\250v\162\015\170\224\030\202\030\024\131,\203(\016\008L455\145\166\166\166\161O?\253\180\182\188\188\252\197\220\220\220_\231\228\228 B\0087<<|gxx\248\159\187\187\187o\188\244\210K\187\011\010\010^\243z\189\250\0277n\180PJ\247\225\129\129\129\248\166M\155\222\236\237\237\253\221\212\212Tuee\165\211l6/\200\204\204LW\171\213\179\175&\025\006\235t:\015\199q\211\000@1\1985+V\172\208\189\250\234\171#\225pX\221\217\2179\239\147O>\249Czz\250O\026\027\027\255\235\149W^\233\242\249|B\127\127\255\149\241\241\241\016F\223p\152\008\000\187\215\174]\251^8\028.\028\026\026\026\1537o\158\164\209hX\150e\255.Ey?\018b\024\006\008!4\028\014O\127\249\229\151\026Y\150\163\000\128T*\213\200\226\197\139U\025\025\025f\000H\213\235\245\183)\165\241\182\182\182?\173[\183\238\141\019'N\252\229;9\007\000\164\190\190\1589p\224@\172\170\170\234\141\171W\175>\229r\185~\197q\028\207\178\172\244\160Py\180~\000b\031$\031\000@-\138\226\180V\171\221S__\143\186\186\1860!\132I>NII\201\217\188y3\195\243\188\170\173\173\237=\132\208\222\202\202\202\191:\157N|\183\222B3*(&\193\183\204\223q\161\239#\165\203\202\202\246\159<yr\130R\234'\132PJ)\161\148\210\137\137\137\155\031|\240\193\181\215^{\237\210\182m\219\150\001\000\212\213\213qw\015\128\234\235\235\209\015QI-]\186\148\030;v\012\135B\161\003\024c\204\178l\004!\196\220\235\004&\233\016I\146\008\199q\203v\239\222\189\162\182\182\246)\000\016\018\210\134RJQ$\018\025nnn\246]\186ti\210\229r\189\217\213\213\213?\027\021\019J\170\200g\159}\246w%%%\214\194\194BP\171\213\220\253\246\005J) \132@\150e\198`0L\150\148\148\164\206\1557o~\242\255\228]\146$\008\006\131\183\206\159?\031\179\219\237\183\199\199\199\255e6{8\148\231y\243\198\141\027'7l\216\144\005\000\234G|o\017\000p35R\242\206\178,5\024\012\185UUU7\198\199\199\181\205\205\205\159\204*M*\138\194G\034\017\000\128x\162\194z\216\165\000\128\164(\010\189\031#\016B(\000\000\199q*\134a\174\207\138\007\204f3M\008\174\179MMM\251\174^\189*k4\154\016z\192\185\021\1950TQ\020V\175\215\143o\220\18415;;;'\025:3Uk8\028\246\180\183\183#\167\211y\245\237\183\223~c\214\187\006+W\174|\025c\204\018B\030TbR\132\016+I\018\017\004a\243\158={6l\221\186\213\008\000\154\004\008\010\000(\024\012N\092\185r\229\235\139\023/~z\228\200\145\183\252~\127`V\251\152\137\238\220\217\199yg\237\218\181E\241x\092\011\000\210\140\189\002)\138\018\191q\227\198\224\241\227\199\023\013\013\013\221\246\251\253\129\186\186:nV\001\216l6\197b\177<\210\024\025\025\025\156\217l\022;::0\207\243\010\000\224\196\234#Q\020\165\225\225\225\191\158>}\218\228v\187\207x\189\222\019\013\013\013\236\182m\219\1649s\002\153l\008WUU\237ohh\024\167\148\006dY\166\178,+^\175\215\181w\239\222\193\170\170\170\195\022\139EHl\184\232{u\230f\2538\018!&\161\191\024\150eall\236\246\241\227\199\217\193\193\1933\237\237\237?\223\181k\151\228t:QR\174\227\185\006@\150eadd$\022\012\006\003\145H\196\255\225\135\031\198\219\219\219O\159;w\238\144\213je\250\251\251\233\204V\203\092:\142G\013\013\013\204\225\195\135\179\010\011\011\255s\193\130\005K\226\2418\231\241x>>y\242\228\190\186\186:|\244\232Q\229\238\142\221\223\000ma\152\007\030\148{\018\000\000\000\000IEND\174B`\130",
		output = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\013\253IDATx\218\205Y}lTWv?\247\190\251>=3\158\177\231\203\198\014\177!`\155\024'\178A\024\236:P\234\000\165b\165d\132\026\144\216\164Rh\147M\149-\201n\137\182\216\019\182*\205J\219d\187\162I\212\205jU\164\168\025\130\182J\136\029\018\162\181eR\192q\156\009\1945\18211\246\152\177=x\190?\222{\243\238\237\031\153\023M\008K\194\010\002\231\1597zs\223{\247w\2079\191\251;\231\034\000\000\159\207\199\005\002\001\163\185\185\185\194\235\245\174\002\128\151$I\146x\158\215\000\0003\198\224N\024B\008\024c,\159\207\243\185\092.\1391~>\028\014\143\012\014\014\134\2059#\243\199\1545kVX,\150\195---\174\182\182\182\172\203\229\242X,\022\130\016Bw\018\128a\024\144\201d\242\145Hdn``@\250\236\179\207\174\228r\185g\250\251\251\199}>\031\135\000\128kmm\189\175\166\166\230\223[ZZ\150677\235\030\143g\169\211\233,\017E\0170\198p'\141R\010\170\170\194\213\171W\179sssS\195\195\195\220\224\224\224\165\241\241\241g\207\15693\134\026\027\027\171\092.\215\239\182m\219V\189{\247n\011c\204\171\235:PJ\129Rj\186\241N\134\208W\139(I\018\195\024\207\0319r$\249\238\187\239N\167R\169=\220\1545k\214655\253`\211\166M\200n\183\223\139\016\002M\211\238\216\164\175g\1401`\140\001!\004QJKx\158_H&\147b.\151\027\034\008\161_\180\183\183g\221n\247r\1950@\016\004TZZ\010\008!\184\219\2040\012\200f\179\224\241x\170\219\218\218\206\141\142\142\254\130H\146$:\157\206R\167\211Y\146L&\153\174\235Y\158\231\179p\023\154\174\2352cLt\185\092\150X,\230\149$)K\008!\154\162(V\135\195\001\145H$z\252\248\241\169\201\201\2012\000 \000P\028G\1361\134\138\226\147]\243\255mM\007\000\200\215\214\214Nm\222\188yiUUU\153\162(<\207\243\009\194\024\195\008!\1321\166\137DB\237\237\237UGGG\159q8\028\145L&\131\011\147D\132\016\2248.g\130PUU*\128\128\219\012\004)\138B\163\209\168\179\174\174\238\133\181k\215\170\024cZ\160wL\138s\133RJx\158g\139\139\139}\019\019\019\137k\223\180j\213\170j\1401\211u\221\024\029\029\189\242}\134OYY\153\141\231\249\253\148\210\175E\006\249:k!\016\004\193())\177\188\250\234\171\233\015?\252\016\015\013\013A6\155\021\221n\247^\155\205\246\247\162(&3\153\140\228t:\247\015\012\012\004\182l\217\034Z\173\214\252\237\154\248\252\252<z\250\233\167\217\190}\251,\130 \024\005rA\215\003\192L\202RU\213\216\185s\167\241\232\163\143\194\208\208\144\177r\229\202Z\155\205\246\163\157;wF\239\189\247^\233\194\133\011\169c\199\142\249\031|\240\193\092oo\239;\013\013\013\194\200\200\136v\187B\168\191\191\159\185\092.\163\136\218\175\235\129\027m(\172\164\164$^[[+\213\214\214\222g\183\219\2315M\011\157<y\242\016\165T\013\006\131'\154\155\155\249\161\161\161\252\247\152\2167\007 \153L\202cccY\187\221>o\183\219\189\157\157\157\132\231\249\169t:\253\138 \008{\007\007\007\251;::H__\159\241}\130\184\161\208\009\004\002\212\231\243q\138\162|\017\141F\247\031=zT\232\239\239\159UU5\034\203\178s\221\186uU\187w\239N/]\186\244pcc\227\159\247\245\245\229\155\155\155\201\247\233\129oUj\129@\192\216\190}\187q\234\212\169c333?\253\224\131\015\228\147'O~\017\137D\230*++=\173\173\173\181\015?\252pf\229\202\149/\175_\191\190shhH\127\242\201'\249\187*\132\252~?-\132\199;\148R5\147\201\188\034I\210\180(\138\156(\138\206\141\0277.\179Z\173So\190\249\230/\031x\224\129\159\188\254\250\235\239\1532\253\142{\192\180\190\190\190|GG\007\009\006\131'\034\145\200\211\199\142\029\179\245\244\244\140\207\207\207\207J\146T\214\212\212T\181c\199\014}\245\234\213\135:;;\127\016\008\004hWW\023\190k\000\152 |>\159p\246\236\217\143\198\198\198\158\248\248\227\143\173\139\139\139\145t:\173:\028\014\215\150-[*\154\154\154\236<\2077\020\018\249\238\002\000\000p\254\252yS\025\230\012\195\224\138e7\254\210(\165\020\000\000\174\092\185\130\238\138\0280m\203\150-boo\175\218\218\218\186\222\233t\190\182v\237\218xYYY\149\162(b,\022\187:44\020:w\238\156\168\235\250%\000@\209h\148\022\239\1547S\002\220r\000\029\029\029\164\183\183W]\189zu\155\205f\251\245\142\029;\212\182\182\182{EQ\244\234\186\158\024\025\025\185\028\008\004\228P(tppp\240M\159\207'444\228\223z\235\173\239\236\229@ `^\025\000\208[\006\1281\134\016B\249\198\198\198?[\190|\249\1756m\218\148oii\241x\189^o<\030O\158<yr\188\167\167\199z\245\234\213\023\006\007\007\223.LB\187+h\212\231\243q\221\221\221l\253\250\245\015\149\150\150\254j\227\198\141\234\214\173[\151\200\178\236\013\133B\209\177\177\177\201\247\223\127\223266\246\211`0\248\251\246\246\246\191$\132\252\163\162(W0\198\1321\198\190Kc\1281\198\010\021\1513\157N\251\207\158=\251\007\159\207\135\003\129\000\253\147\001\020^`\212\215\215\223WSSs\248\145G\030\201\174[\183\206-\203\178W\211\180\248\167\159~z1\016\008\216\195\225\240s\193`\240\127\026\026\026\214\218l\182\151\183m\219\150\171\174\174\174\145e\153g\140\129\153\212\127\148I\010\000UU\205\142\143\143gO\1568\241\031\245\245\245\127\021\008\004\198}>\031w\244\232Q\227\134\000L\137jv\001\138+/\211\172Vkn\197\138\021\214\178\178\178\234\197\197\197\200'\159|r\169\167\167\167tjj\234\217`0x\028\000\016\199q\134\213j\205\173Y\179\134466VJ\146t3\154\008e2\025\195f\179M\156:u*\171\170\2347\194\184\168\018\252\134\007\190\186\201q\028\147e\025\0298p\192\172\198\1920\012.\155\205\218\231\231\231#\138\162\140^\184p!\253\246\219o\151NOO\239\015\006\131\199\151/_.NLL\168\186\174\243\217l\214\017\014\135gJKKC%%%\132R\250\173,d6\016R\169\148:77\151\206\229r.\142\227\200\245\198\021\188\133\010@\016)\020\203\000\000\012c\2040\198\006\165\020\031<x\144\182\183\183\019\159\207\135\006\006\006.\199\227\241\223\0289r\228oeYN\164R\169\242h4\250\179\225\225\225c\029\029\029\018\000\228w\237\218E\002\129\192X\034\145\248\2077\222xc\175\221n\191J\008\017\216\215\2513\212\092\193\194\138\226\2260\210u=\159H$*\211\233\244\1755M\187dR\240G\031}D\030{\2361\001c\172\155\207\168\170\202(\165\0261\012#\159J\165r\185\092\142\179X,y\183\219]ZSSs\200\227\241\252\184\191\191?R\248~\230\202\149+\255\220\216\216\248\030B\136q\028g\012\015\015\127\142\016\130\190\190\190\092\225\010\000\176822\210\221\212\212\244\030\000\164UU5W\0104M\003\1401\127M\222\234\132\016l\142!\132`\000\224\163\209\232\255\205\204\204\168\000\128\002\129\128q\244\232Qhkk\251\153\215\235-\183Z\173z,\022\195\241x<\173iZ9I\165R\149\225px\236\242\229\203\030B\136\187\179\1793\172\170\234\218s\231\206\253\203=\247\220\243KQ\020-\024cZ\248\162n&\229\202\149+[\016B\215f'\034\132 \1950r\1401\194q\220W\245\132\205f+\025\030\030\254\223\226\220mnnn\165\148&S\169\020B\0081A\0160c\140/\010k\182b\197\010gyy\249\138\214\214V\219\134\013\027l\146$9fff\226\179\179\179\011\134a$I6\155\253C___\131\203\229\186|\255\253\247\175\170\171\171\171C\008\141UTT\180\204\207\207\191S`\016\196\024C\140\177b\151\027\127l\207`\140q\000\1928\142\003\198\024\210u]M$\0186\135\195\241_\139\139\139/\229r9Z]]\221]YY\249\215N\167s\209\0125M\211\242\011\011\011\246\217\217\217\2158\142\251\185\211\233\020\203\202\202^Z\182l\217_l\218\180i\190\190\190\222#\138\162\020\010\133&\250\251\251\221\140\177gH(\020\218C\008yy``\160s\233\210\165\151x\158\175\170\171\171kZ\189zu\130\2278\221\172\147\175e\128\2351\213\245\232\017!\004\201dR\184x\241\226\197\195\135\015\239\138F\163\255M\008\225\189^\239\174\023_|q\196\233t.\231y\222\092 \245\220\185s\151\014\029:\2447\151/_~\141RZ\227\245zw<\254\248\227_8\028\142\213\132\016\154J\165&O\159>-\143\143\143\159\140\199\227\179d||\092\219\186u\235\179\195\195\195\255\022\139\197:\219\219\219G\026\026\026*=\030\143C\150e\252'\234\152\175Q\157\162(\016\010\133R\162(\166\025c\186\166i\154\203\229\186\234r\185\150\203\178\236)\030[QQ\193\151\151\151\135\025c*!D\151$))\008\002\201\229r\225\243\231\207_\029\024\024P&''?\012\133B?\158\152\152P\009\250\146\195T\000\216\183a\195\134W\210\233t\253\212\212T\168\188\188\092W\020\133\2278\238\166\196\024\165\020\229\243y\001!d\000\000\194\024\179L&c,,,,\164R)d\024\006\005\000$\138\162\192\243<\166\148\178BO\010\017B\168$I\188(\138$\153Lb\135\195\161.,,\224\019'Np\028\199\205MLLdGFFN\247\247\247\239+\204\025\019\000\160]]]\184\187\187;\247\208C\015=\245\249\231\159/\025\029\029\253'\158\231E\142\227\244\239\018*E<\141)\165\249\092.\023\203\231\243B>\159G\000\144G\008\217\009!\191\163\148\158\174\171\171\211\206\1569\211\004\000\249B\235\028\021\133$\250r\013\168!\138\162ehh\232S\158\231\159\235\233\233y\028\000\166u]\2559!d\1501ftwwc\191\223O\137Y2\250\253~\212\213\213E\253~\255\020\000<Yx\025\187\137\176A\000\192\246\236\217#\170\170\218Y__\031\181\217l\136R\138R\169\020\189x\241bU4\026\181\005\002\129\185e\203\150}\227\212\199\220\204\204\251\154\166\209\130\136<\006\000\191/\168\211|A\155!\191\223\207\190\209\216\242\251\253P(\003qQS\245[mdd\004?\245\212S\244\249\231\159\191'\022\139\253kSS\211\218e\203\150e\236v\187\004\000\016\139\197\178\134a\200\209ht\168\161\161\225G\154\166QJ)\254\014\030e>\159\015o\222\188\153\001\000\154\157\157%\171V\173b\231\207\159\135\174\174.\228\247\251\209\181\2195+ \1637\019\247\029\029\029d\227\198\141\249\186\186:\183\221n_\191g\207\158Y\187\221^E\008\225\000\000\242\249\188\184n\221\186\233\233\233\233\013\151.]\170\194\024k\008\161\027\002\016E\017\001\000LNN\178\189{\247\150\000@q\211\204\012\183\228-\233\225\184\221n\134\016\130T*\149\242z\189\017\183\219]k\177X\202L\021\1381\006Q\020\005\183\219\029N&\147i\139\197\034\220(<\011\148\138\000\000[\173\214g\182o\223\254C\155\205v\133\2278\194\024\163\154\166\145x<^\146J\165~rK\155P\132\016N\215u\017!tm\139\017\001\128\161\235\186X\144\011\223f\156\166i\201\230\230\230\214\234\234\234\253O<\241\196\244\146%K\238'\132p\148R\208u]\029\030\030\142\0289r\228\183\183\163\139f\022\245\215\146\000c\140QS\023}\023uJ\008\201WVVf6l\216\224\230y\190\178x\140 \008\217\227\199\143\167\238\236\025\234\141\0114\164i\154QRRB8\142S\010{\0053\012\131\001\000\147e\217*\138\034\187[\001\192\151\0070\172\248X\011\153\210\196,\190\016Bp\215\002\184\14541]\196\024\003r\027V\205\148\006\230\239\175\014\205\205\137\152\227\024c\172HJ\000\198\152QJ\193|\206\028WTS\179\130\156G\133{\244\150\002H\167\211LQ\020\162(\138X\144\008\168H\208\137\138\162p\186\1743\142\227\192b\177\016A\016\004\147\211\011\165\034\150eY\018E\145\164\211i\208u\029\020E\225\009!\226\181\157DY\150%A\016\008\185\133Y\007V\171\149\143\197bxff&,IR\198\164#\1401\206\229r\137h4*r\028G0\198$\026\141\226p8<\203\024\2031\198\012\198\024\008\130\192\022\023\023\179\201d\146\147e\025c\140\185h4\010sss\211\148\210R\0000(\165H\020E<77\183\152J\165\132[\213\187D>\159\015ONN\138\021\021\021\143\217l\182\003\138\162D\242\249<_\160C=\147\2018\227\241\248\193`0x\196\227\241\160\170\170\170\031Z\173\214\023DQ\156g\140\017\179&O\167\211\246D\034q \028\014\191\009\000\252\146%K\254\193f\179\253\157(\138\243\148R\174P\029\146L&Cb\177\216s\255\015\003\196@R\195)\127\166\000\000\000\000IEND\174B`\130",
		datafinder = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\017BIDATx\218\189Zkp\019W\150>\247v\171%\181\172\135\145,\217\150\141A\0160\194\196\128\141\013\198\177\0138\147\016\008\016\136\020jBm\138M\0056\147\236\164&\217\173\221\157\221\141-*\155\217\205N2\019\146\217L\168\212\212\166B\165\018D\156%\1432U\129866\142\016\226a[\198\239\024\252\182dK\178%uK\253\184\251#r\138!\015\204\000s\170\186J\165\238\190}?\245=\223\249\190s\133`~\129\000\128\000\000l\217\178\197\136\016:\2020L\129Z\173\158\164iZ\001\183\024\178,\131 \008$\030\143\155\001\224\133H$\226\245x<\189\014\135\131r\187\221\210\173\140\133nv\193\220\160v\187}\129N\167\219j\179\2176\230\229\229\149\022\023\023\243f\1799K\163\209\208\020E\225\249>\144\016\002\130 \200333\220\232\232h\240\220\185sTWW\151vzz\250\160\207\231kv8\028\140\219\237N\222)\000\152\016B\238\185\231\030m^^\222k6\155m{II\201\152\221ng\173V\235\162\172\172,\005\1950dnn\183\240,\028\137D`hh(<999|\249\242e\209\235\245B<\030\255\229\137\019'\206TVV\210\141\141\141\226\237\002\192555088\200\244\247\247\191\153\159\159_\241\228\147O\198rss\151\002@\026\199q3\209hT\146eY$\132\016Y\150\017!d>o\000\179,\027S(\020:\141Fc\208h4R$\018\009\180\180\180\012\215\215\215\1957\223|\243o\145H\164\193\225p\136.\151K\254\139\0008\028\014\202n\183\019\151\203E\151\149\149\029.))\217\178s\231\206Xnn\238\138\244\244t\197\248\248\248\200\169S\167\198\251\251\251\167\194\225\1762\153LR\178,\163\155L\028!\132\016!$!I\146\190\162\162Bx\232\161\135\242\023,X\160\023\004\001\226\241\248\240\167\159~\026\248\252\243\207\217\233\233\233\191\241\249|\231\230\147\019\244\141_\212\212\212\224C\135\014I\132\016\168\170\170\250\237\210\165K\183\236\218\181+\158\159\159_\144H$\144\223\239\239nhh\160zzz.z\189\222_\139\162\136\009!(\022\139\253\228\228\245z=\205\243|<==}Mff\230a\132P\226\219S\004(\138\002\131\193\144\179z\245\234H__\031\215\223\223\191\182\168\168\232\162\221n\151n\245\013\224\212Z\166\138\139\139_]\183n\221\182'\158x\034\150\145\145\177\002cLG\034\145+\239\190\251.u\225\194\1336I\146\158iii\009\200\178\1400\198?\185v>\252\240C\202\233tJk\214\172\1690\155\205\175\239\221\187W,))\201\209h4\022\000\224dY&\020Ei\034\145\200t[[[\207\007\031|`\025\028\028|\168\163\163\163+5'\249\166o\160\166\166\006\167\214\156b\243\230\205\175\230\231\231?\180g\207\158HVV\214Z\149J\005]]]W\234\234\234\020~\191\255r(\020z\246\145G\030\153\2268N\225t:\229G\031}\244G'?00\128\157N\167PZZZe\181Z\015WTT\136\235\214\173\203\178X,\153\147\147\147\145\179g\207vs\028G\170\170\170\150gee\233C\161P\134F\163\153\2258n^I<\007\128\170\173\173\149\167\167\167\149>\159\2395\155\205\246\179\253\251\247\207Z,\150\194D\034\145\028\029\029\237\171\175\175\023\206\157;\231e\024\230`[[\027\223\222\222\014\132\016\217\231\243\221\236\025\210\250\245\235\171\013\006\195\239\239\191\255\254\228\003\015<\144\173T*-\193`p\202\239\247\015|\242\201'Z\140qb\253\250\245!\147\201\164KOO\215\2084\029C\008\145\249\002@\008!)??_k2\153^---\221\188c\199\142\168\193`X\009\000d``\224\218\199\031\127\220\235\241x\254kvvvR\020E\203\210\165K\233d2)\255\016\009(\149J`\024\006\009\130\160\160(J\162i:\207b\177\252n\219\182mbii\169Y\171\213Z\146\201\228\204\249\243\231\1919v\236\152add\228W\185\185\185O\199b\177\092\000\016i\154\1660\1980o\000\014\135\003wvvfgee\213.^\188\184b\251\246\237\179K\151.-\192\024\211\028\199\009\020EIiii\150e\203\150\189\174T*)\000`\008!?\184&1\198@\008!)VQ\008\130\128\213j\181PVV\198UTT\228\153\205f\243\216\216X\240\242\229\203\215\234\235\235u\227\227\227\255\232\243\249>\207\201\201ya\174\142P\020\1330\198\144H$\230U\200h\183\219-\149\150\150\150\217l\182\237\251\247\239\031Y\176`\193\010\132\016-\008\002\161(Ja\179\217\022\0318p\192$\138\034!\132\252d\194b\140A\146$9\030\143\011\131\131\131\129p8\204gdd\168sss\173*\149\202\028\141F\131\029\029\029\215\222\127\255}\205\196\196\132\203\235\245\158\000\0005\198X\158\003 \2032\200\178<o)Ao\223\190\221\164\211\233*\139\138\138\198\172V\235R\150eU\178,\131N\167C4M\1394MS\010\133\194\000\000\183\162Q(\163\209\184 \026\141\134\149Je\026EQ\154\217\217\217\137\230\230\230\161\134\134\006\237\244\244\244K^\175\247\253\154\154\026\218\229r\137d>\021\240\199\000\196\227\241\163\171V\173\202X\185r\165\154\166iM,\022\1479\142\011s\028\023\143\197b*I\146\008B\136\220\172P\193\183\201\004\024c`\024F0\024\012\172\193`\200\194\024\147X,\198\143\141\141\141555){zz\014]\186t\233}\135\195\193\184\092\174$\000(\2246\130V\171\213+\215\174];\148\145\145\145\159L&q8\028\030\190x\241\226hSS\019\021\137D\166dY\158\183PC\008!\140\177\172\209h\210JJJ\020\229\229\229&\163\209\184\136\231ynbb\034\022\143\199\205\146$\181\019B\144\211\233\148\224\014\004\173V\171\003\025\025\025\230\204\204L6\016\008\132/^\1888v\242\228I\203\224\224\224a\143\199s\024\000\168\159*$?\020\197\197\197\015G\163\209W0\198\129M\1556\233Y\150U\165\165\165\169(\138\034\000\160A\008\145\202\202Jt'\000`\138\162h\157N\199\232t:\194q\092\172\165\165\005\247\247\247\255\183\199\227y\013\000D\000H\000\1280\223\163\166\166F:\127\254|\221\213\171W\159knn\150B\161\208Lvv6\187d\201\146\012\173V+\136\162\152\128;\024\024\000\128\166i\012\000r<\030WF\163\209\153\243\231\207\255oMM\013\158;\127+\225r\185\136\195\225`|>\223\231\209ht`vv\150U\171\213\178^\175gh\154F\162(\202\000\000f\179\249\250\196E\169\183C\016B\004!\132n\009@\138\004\016B\136H\146\196\228\228\228\024\014\029:$\207C\227\255h\245u8\028\148$I,BHNQ,B\008!A\016\190\167\245\016BIB\008\005\000\148,\2034EQ\194\220}\243\002p\189[B\008\145D\034q[\009\230p8\192\237vK\008!9\197\233d\142*\021\138\239\145\014\150$\201\132\016\154\005\128\136B\161\008%\147I=BHy+Z\232\207\028\213|\203\248M\139\001EIJ\165\146\254\246#\165\160(J\150$I\190a\133H<\207_\248\236\179\207vvvv&\199\199\1995333\030Y\150gR\030b\222\000\238x\136\162h\138\199\227\0922\153\156M$\018\179\137DB\015\000JB\008LNN\162\148\150\146\226\241\248\191\180\182\182^\243x< \203\178J\020\197w\135\134\134\198\014\030<\168p8\028\178\219\237\254QI}W\0008\157N\025\000\128\231\249W\154\155\155]\129@`2\024\0122\201d\242}\134a\190\001\000\092UU%\155\205f\236v\187\165\230\230\230\016\000\188|\2278G\142\028\017ntt7\002\185\027\000\200\156J=}\250\244I\000\168mooOJ\146\164\023\004\225LWW\215TQQ\145\194\229r\009\000\000EEE,\203\178\239\169T*3\1950!\134a\016\000\136\178,\019A\016\128\227\184\092A\016\254\003!\244\127\000@\174\243-wu\009\017\000\128\202\202Jzxx\248\254\229\203\151\195\228\228$R\171\213\201\148\207\021\001@\185v\237\218\002\155\205v //oUAAA4'''[\171\213*)\138\194<\207K\147\147\147\209\190\190>\174\179\179\179V\161P\224`0x\201\229r\013\092\239\149\239j\014\164Z#\179\221\221\22172\031\218\186u\235K999?///\031^\189zut\209\162E9:\157.}\238<\000\016Q\020\019\163\163\163\195]]]\193\179g\207\190\212\209\209!\234t\186_\184\221\238\230\185\214\203]\005p\163\239>p\224\000\029\010\133\208\196\196\196Kv\187}\247s\207=\0230\026\141\2494Mk)\138Jp\028\023I\177\148L\008\161\148J\165\194j\181.\201\200\200\200\219\176a\195\216\201\147'C\239\189\247\222\225\178\178\178\023\170\170\170\026\171\170\170\240_\003\000Iyn\250\200\145#\138e\203\150\189\188q\227\198\135\031\127\252\241\144\197b)`\024F\025\141F\003MMM\163\221\221\221\242\212\212\020-\138\034fYV\206\206\206\1506l\216\160^\177b\197\034\181Z\157W]]\141DQ\156>q\226\196\235uuu\207\180\183\183\159\161o\016\147\223e\252\157D\144j\213\136+W\1744\230\230\230\222\187g\207\030a\197\138\021vQ\020\153\209\209\209o\206\1569\019\168\175\175\167\250\251\251O\205\204\204\028\2298\142\210\235\245\026\147\201\244\202\240\240\240\236\150-[\1325k\214d\167\167\167/\220\189{\183488\136\002\129\192\189EEE_\211?\208xE)\235x\199\150\144\203\229\034\165\165\165\139\172V\171k\237\218\181\236\162E\139X\140\177\154\227\184\161\183\223~[jmm\237fY\246_)\138\010\181\181\181E\231\188\197\166M\155\246\1569s\230\254\206\206\206\218g\158yf\188\178\178R\141\016\202-//o\027\024\024\248y \016\248|N\011\1459\250\163i:9<<\028~\241\197\023\241|\154\1917\139\162\162\034:\165w\158MOO\255Yyy\185\168V\171-\145Hd\170\177\177q\162\171\171\171\241\139/\190x\250\196\137\019C_}\245U\204\225pP\014\135\131\170\168\168\160\239\187\239\190\192\151_~yttt\244\229\230\230\230`oo\239\016B\136,^\188\216RXX\0084Mo\163eY\150\227\241\184(I\018\197\178l\034--MWRR\178\223\229r\189y\155\137K\000\000\210\210\210\2304Px\225\194\133\209\252\252\252l\149J\197\244\244\244\092;~\252\1845\016\008\252\029\000\196\028\014\007\131\016\018\174\183\174\141\141\141\232\216\177c\148\211\233\252\147\209h\220\197\178\172\233\233\167\159\1586\155\205\150\194\194\194\145\211\167O\255;N$\018\154`089::\154T*\149\250\242\242r\178d\201\146\023\202\202\202~\149\162Ye\202\246\221\236\152\187\246\007;\213\132\016b4\026UZ\173V\1351N\012\012\012\024\130\193\224\145h4:\152\226u\225\007\238#N\167Sv8\028\212\240\240\240\239GGG\003\225p\152b\024\006gdd\164k4\1541:\026\141\242^\175W6\155\205W\243\242\242\238)--\205\001\128\161\230\230\230\199\179\179\179\031\020E\145\186\153\172\198\024#\000\0168\142\179p\028\247\245\236\236\236\1396\155-\228v\187\229\235\024BbY\150J\001\021B\161\144\134\227\184^\175\215;%\203\178\226\167\154\006\031}\244\145\164\213j/\022\023\023\019\158\231\001\000@\165R))\138\226iQ\020w\159?\127\254\237\204\204L\201f\179\005\012\006C\230\134\013\0274\171V\173\138\196b\177<Y\150\201\205\140<\1950$\030\143\227h4:\246\217g\159=r\233\210\165\128\219\237\174\169\172\172\164\175W\184)\149;g>@\020\197y\229\152$I\200`0\128B\161\144\174_\158\132\016\160\155\154\154z7n\220\248\247\173\173\173ob\140\201\1545k\130\153\153\153Kl6[6M\211\226-p=\021\008\004b^\1757\154z\208\247\246\005\162\209\168\148\250\165Y\147\2014\166\215\235\239+,,l\176\217l\227>\159\239\199\020':x\240 e\183\219\183\167\165\165\169\211\210\210$\000@\241x\156\023\004\001h\187\221\206\180\180\180\248eY~~bb\226\205\193\193\193\244\242\242r\1270\024\180\176,K#\132nj+i\154&\028\199\225p8\028\158\154\154\178\136\162\168\158;\023\141FQ\010\128>\016\008\200\145H$\168\213j\1416\155-j6\155\031\022E\241\168\219\237\030Im-\221\152\0078em\201\244\244\1803///]\167\211!\158\231\133\201\201\201)\158\231sP\138\234\020>\159OX\183n\221\202\236\236\236\002\140\241\243*\149J\163P(\196\249\020\181\020H\158\2278c$\018\233\008\004\002\255\180c\199\142\238\218\218Z\002\000P[[\139\154\154\154\238\177\219\237\135\170\171\171W=\248\224\131\153<\207\227\214\214V\255;\239\1883\225\241x~9222\140\016\130G\031}\148\002\000Hm\176\200\000\000eee\207\239\216\177c\247\190}\2512-\022\203\162\145\145\145\225\227\199\143O\180\182\182\254\015\013\000\224\243\249\132\020\019\248\001\192o\183\219}\000\000\130 \200\243\233Q*\149JH&\147\178F\163aEQ\156\236\233\233\009^\188x\017\185\092.\146\178\152\184\161\161\161\155e\217\203\023.\092XVVV6k6\155\023\150\150\150\230]\186t\201(\138\226[\005\005\005\255<>>>\226v\187\195s\227n\217\178\197\200\178\236\030\147\201\244\236\166M\155\146V\1715O\016\004\169\191\191\127\202\239\247G1\198\013\223%\153\219\237\150\028\014\007\149\250\220w\187\210\225\198\253-\132\016\092\185r\229\019\179\217\092\017\014\135Mf\179Y\212h4\153O=\245\212\216\186u\235Ln\183\187N\146\164\134\162\162\162?\201\178L\169T*\163V\171\253\205\230\205\155c[\183nM\228\228\228\228H\146D\011\130\208{\230\204\153\204\190\190\190\195\024\227Q4\031\179\255\023\1367r]%V\248|>a\253\250\245k333\255X]]\173\220\183o\159I\175\215g\207]\019\143\199c\237\237\237\189===x||\092/\008\002\210j\181\201\197\139\023\135\011\011\011\205\185\185\185\011\001\000\198\199\199{\235\234\234\248S\167N\205\244\246\246\254\162\163\163\163\029\221M\025:7\249\146\146\146\245\006\131\225\015{\247\238\165\031{\236\177t\134ar\005A\152\141\199\227\1794Mc\141F\147\006\000i\146$\241\008\161\228\156\156F\008\177\008!\138\231\249p,\022\155\252\244\211O\147uuuS\193`\240\128\215\235\237\001\000|7\001`\000\144\151/_^\188r\229\202\183v\238\220\201l\219\182Mg4\026\023I\146\020mll\236\171\175\175OfddP\005\005\005\202\013\0276h\210\211\211M\169V&I\025\026nhhh\200\227\241$<\030\143\186\175\175/4==\253\244\217\179g\187\239\170\161\153\203\129\205\1557\223\171\209h\254P]]\173p:\157\233*\149*7\022\139\133\218\218\218\006>\248\224\003\211\215_\127\253\015V\171u\249\192\192\192\150\174\174.d\181Z\195Z\173V\129\016B<\207\139\193`0>00\160\189z\245\170044\244l\127\127\127\247\216\216X\240\250\141\240\187\001\000uvv\162\148\128\251\237\174]\187t\187w\239V+\020\138\092I\146\194~\191\127\224\1417\222\208_\187v\237w\237\237\237\199\243\243\243\153\174\174\174\015\175\092\185\242k\134a\008\198\152\007\000<\183q\206\243|\014\000\252gKKKKJ\216\225\235w\241\239\170#\163i\154\183\217l\216`0Xy\158\1599{\246\236\192\177c\199\012\195\195\195o\182\180\180\188^YYI\219\237v\241\216\177c\253\008\161\191\189^&\220 \229Iee%\237\247\251\229\191F[\229\187H$\018\170\190\190\190Dfff\231\244\244t\252\232\209\163\134\182\182\182W}>\223[\007\014\028P\0289rDlll\004\151\203\005)\031\240g\247\251\253~\212\217\217I\220n7ill\020\027\027\027o\253\223*\183\227\007\202\203\203\237:\157\238#\173V+\241<\191 \022\139\029:u\234\212\031S\236$\222F\243\248\187\248\127\1499\176!L=~\225\000\000\000\000IEND\174B`\130",
		tags = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\012.IDATx\218\205Z[l\027\231\149\254\255\127.\188\013I\241*\202\180(Z\150\092CQ\020%\130d\009\134\205P\137T]\018\164MA!\200C\131]l\216\002Yg\159\022I\023\216e\133M\155l\251\144\246\165\013\156\166\139,\242\020G\001\0188\130\146H\017\239\150\012\0040b\148\169\235\149DZ\180(R\164HY\226\1443\156\249\255}(i\168\174-\235\022\175\207#A\204\156\239\156\239|\231BBp\200\230\243\249P,\022\131mmmdnn\238u\150e\207)\020\138\148,\203,\132\144\028\228\217\132\016\008!\148(\138R\149J%A\016\132\151\225a:\239\241x(\143\199\003\198\198\198\228\145\145\145W;::^\030\030\030&J\165R'I\018>\172\247\232\245z\184\184\184xkbb\162L\031f\228\001\000pllLz\225\133\023~\218\216\216\248\202SO=\005\219\219\219\157Z\173\150\150e\153\016B\224\014\209\005\016B\000\225_\191\002!\004\132\016\1281\190\253Y\245s\162T*!\203\1789\189^\1598\020\000.\151\139\142\197b\228\194\133\011\210\208\208\144\247\232\209\163\231\198\198\198@CC\195\209\205\205M\166X,\018B\008\186\015=\200vG\183\003\171:\014k\192\140F#,\020\010B\165R)\029\006\000\024\008\004$\000\000x\241\197\023_u:\157?\237\239\239\151-\022\2031\149J\197lmm\017\140\241}\169\202\178,\164i\026\020\139EP\169TD\008!\160(\138\2258\014\202\178\012DQ\188\157\013\1401 \132`\008!} \000]]]\204k\175\189\134\223~\251\237W\172V\171\243\216\177c\167\159}\246Y\181\211\233\180\137\162\200lmmm\015\222\142&\138\162T,\022\139\133Ba\189T*m\201\178\0124\026\141\010clbY\150#\132\208\008\161\219Y@\232\175\009\221/\000\008\000\000\022\139\005\141\141\141\225\209\209\209\193\246\246\246\222\209\209\209\164\213jm\160(\138\221\165\170\016\133B\001+\149\010^YY\185\025\139\197R\223|\243\1416\155\205jdY\134f\179\153\127\236\177\199\190=y\242\164\173\169\169\201\1930\012-\138\226\223<c\191\000\008\000\000lll\252\2113\207<s\182\187\187{k``\160\208\218\218\250H\185\092\166\182\182\182H-Z\247\001\000 \132@\146$~aa!\245\229\151_\234\210\233\244o677\151\004A F\163\177!\157N\255\012c\156\177\217l\006\134a\012\181\154\216/\000\232\241x\208\230\230&=55\133-\022\139\163\179\179\243\169\193\193\193\156\197bq\200\178L\003\000n\167w'C\008\001B\008(\151\203\248\214\173[\217+W\174\024\211\233\244/fgg\255\231\014\129\000W\175^\253Yggg\150\162(\029EQh;%\209\030u\030]\184pA\222\216\216\248\225\200\200\200\159\186\187\187[\135\135\135\179\173\173\173\1999\142cJ\165\018\192xor_\169T\000\207\243\165\149\149\021m&\147Y\005\000\192\222\222^\213\208\208\144\002\000\000\215\215\215S\171\171\171\218R\169\196K\146$\223YO\244n5\222\239\247\163T*e\232\238\238\182\219l6\203\163\143>\170\028\025\025y\204d2\217\203\2292\034\132\236*\242;\201$!D\002\000\000\179\217\012\179\217l\237a\016!TU\217\191g\229\174\222\024\139\197\232@  \241<\239\168\175\175\255\244\241\199\031\127~```\211n\1837\169T*E\165R\217s\228k\142\179,\0115\026\141\250\232\209\163y\155\205v\002\000@.^\188\200\207\205\205\149\000\000\196h4\182444lp\028\167f\024\134\170\213\223n3\000}>\031\028\031\031\023{zz\006\237v\187\227\137'\158H\141\140\140\028\183Z\173\013\130 PUI\131\251\137<!\004\168T*\13616wtt\092]^^\254\023\183\219\205\020\010\133\235\132\016Y\175\215\031\181Z\173\175vtt\020\234\234\234\026\149J%%\008\002\222^\200\212}\164\018\006\002\001\220\211\211\243\207V\171\245w==='].\151\202\225p\028S*\149\212\157\146\182\0319\174\210\142\166i\026\153\205\2304B\232\140V\171\253\145\205f{\238\248\241\227\167\206\1569\147?y\242dC]]\157\133\162($\2032P\169T0\155\205\222\186r\229\202\230\1892\000\219\218\218\024\135\195\001766~\162\211\233\254\173\167\167\231\234s\207=g7\153LNI\146`\177X\004\187iP;z\015!\016E\017@\008\145\221n\183\213\215\215\027\218\219\219\179\197bq\019B\008\212j\181F\167\211=J\211\180\138\016B\009\130\240w\239D;\200\165455%\152\205\230\031\244\247\247g\006\007\007\013\026\141\198I\2114\218i(\219\175\2094Mq\028\1676\024\012\014\171\213\218j\177XZ\235\234\234\1548\142\227\170\220\191\171Q\247\160\014\017E\241\092gg\231\203\167O\159\174\184\221\238\239\181\180\180\028\147e\025V\163ph\000j\143\146e\153\136\162\008\008!\128\166iDQ\020\170\142\024@\150e\184]\225\238E!\184\173\203\210\022\139\165\173\179\179\243y\183\219\189f\177X\2341\198\212n\155\212>\129\192\2188\189=>5u\187\179\003\255\141\010\249|>4??\207LMM\009}}}\175\214\215\215\255\248\212\169SKg\207\158\205\181\182\182\030\023E\145*\022\139\223\153\243wS\167]S\175\186\002\210U\231\255\209`0\252\235\233\211\167sn\183\251\148\193`\176\149\203e\010cL\246#\149\015\194\232\241\241q\012\000\016{{{\127b\181Z\255\163\175\175\239/g\206\156\1779\157N\187,\203\136\231y\240\176:\015\000\000t[[\027\171\211\233\188F\163\241\181\179g\207\254e``\192\169\215\235\027y\158\135\219\231\238\135\2050\198\000cL\144V\171=^WW\247\186\203\229J\246\245\245\217\204f\179S\163\209P\024c\184\215\241\224A\212Gu\252\000,\2032\008!@\011\130\144=q\226\196\162\219\237nnnn6UW:p\136Jy\168\024\000\000\164X,\146r\185\204W*\021\140\026\026\026^\177Z\173\200h4j\149J\165b\175*\240 M\163\209@\134a\208\194\194B|~~>\153L&O\034\000\192\2354M\019I\146\202\130 @\132\208C\023\253Z-\010\130\128766\150\163\209h\218\239\247[\011\133\194\127\162r\185\252|:\157F\130 \200\015c\193b\140\129B\161\000\010\133\002\220\184q#\254\249\231\159_\015\006\131\142\092.\247\219K\151.\253\150\130\016\222R\171\213\255`4\026+Z\173V\160(J\1990\204CA\163\234i\005\008\130 \175\175\175'\231\231\231\147333\142\181\181\1817\194\225\240y\159\207GSG\142\028\169\176,\155H$\018n\000\192fKK\011\165V\1715\149J\005\195\255G.a\140\001\203\178D\169T\194\149\149\149\196\236\236l<\024\012\030\203f\179\190p8\252G\143\199\195Z,\022\153z\242\201'\193\197\139\023\175i\181\218\005\158\231\007U*\021\175R\169\176Z\173\2141\012\003dY~\224\206#\132\128B\161\000<\207\147L&\019\191|\249\242\170\223\239oZ[[{3\020\010\189w\238\2209\133\195\225\144\198\199\1991\021\139\197\128\199\227a\191\248\226\139\235&\147\233\219x<>\164P(\248\150\150\022\136\016\210T/`\240AF\158\162(\162P(\224\234\234j\242\171\175\190Z\012\004\002\142l6\251\235P(\244{\151\203E\127\248\225\135R \016 \183\199\233X,&wuu1\209htI\175\215\127[*\149\1340\198\155z\189\190\162\211\233\234\016B\224A55\165R\009\202\2292H\165R\011\243\243\243+~\191\191qmm\237\173p8\252{\159\207\135\222\127\255}\249\174\251@*\149\034.\151\139\142D\034KF\163\241\198\242\242\178[\167\211\009MMM\016c\204\001\000\200w\153\009RU\013\154\166A>\159O\206\204\204$\252~\127c.\151\251e8\028~whhH\241\222{\239\201;.4\137D\002{<\030\246\179\207>\251\243\145#Gn\228r\185\167EQ\2202\155\205\192l6keY\254\206\212\137\2278(I\018\188y\243\230B$\018Y\137D\034\205\185\092\238\141`0\248\135\151^zI911Q\185\243\034q\215\141,\022\139\201mmm\236\229\203\151\175\169\213\234X&\147\0256\155\205%\139\197\1300\198\026\138\162\190\019\185\148e\025\023\010\133\155\161P\232\198\244\244tc6\155}3\024\012\158w\185\092\244'\159|rW\231\239y\149X[[\147].\023\029\014\135\151l6\2197\169TjD\020\197Bcc#\208\233tZI\146\014\173`\213j5@\008\129x<\190\020\141F\023\131\193`s.\151{+\020\010\189\227r\185\232\218\233~/;q\141N\196\235\2452\019\019\019\009\173V\187\152\207\231\191_WWW\212\235\245\004!\196\2094\013\015\026u\132\016\017E\017\231\243\249\228\252\252|rzz\218\145\205f\223\008\133B\239z\189^\230\227\143?\190\175\134\239\200\135\175\191\254\026\251|>\250\131\015>\184\238p8\018KKKOc\140o5773\028\199i\004A\216\215\166\1341\006J\165\018\176,\011\147\201d\220\239\247'\130\193`s:\157\254y$\018\249o\143\199\195677\2035\169\2207\000\000\000\008\004\002\184\171\171\139\009\006\131\2154\026\2055\158\231\1358\142\227U*\021Q*\149Z\134a\246$\177\008!\192\178,\224y\030\175\175\175\199/]\186\180:;;\219\148\203\229\222\010\135\195\239z<\030\182\173\173M\170n\138\224\192\000\170\018\139\189^/\243\233\167\159.X,\150X<\030\031fY\182\216\210\210\130h\154\214\200\178\188\171f\1351\0064M\019\133B\001WVV\146\211\211\211\139\193`\176i}}\253W\193`\240w.\151\139\158\156\156\148v\019\249=\001\168\210\137x\189^\230\163\143>Z\2268\238Z\169T\026\130\016ni\181ZI\167\211\233\017B\164\154\009x/\206W\155\020I\167\211\011sss)\191\223\223\152\205f\223\012\133B\239x<\030jrr\018\223Km\014\012\160\006\194\229r\209\209ht\209`0,'\018\009\183N\167+755Q\000\000\205\189n\224\213&E\024\134\129\185\092.933\147\008\004\002\141\153L\230\151\145H\228]\151\203\165\156\156\156\148\246\234\252\158\001lov\147\147\147\127\174\175\175O\020\010\133\167%I*\154L&l0\024t\219\143Q\2197)Q\020\225\242\242\242\194\220\220\220J(\020j\206f\179\183\157\015\004\002\226~\156\223\023\128Z\179\171\130\184\166\209h\254\148N\167\135M&\019\223\208\208\000dY\214 \132\224\246\031\172\001\0008\159\207'\131\193`\162:\219\252W8\028\174\209\166\178_\231\247\013\160\006\162\218\236\2266\155-\150N\167\135J\165\210\166\221n\199f\179\153c\024\006r\028\007 \132R<\030\255\223P(t#\020\010\029\207d2oF\034\145w\170\005{\224\009\241@s\193\182f\183\164R\169n\228\243\249A\142\227**\149J\018E\145\231y\190\178\186\186Z\008\133Bk\213M\234\231\209h\244\015\213\236I\007\137\252\157\007\221\003\153\215\235e\206\159?_\025\024\024\024\214j\181\191p:\157\130\213j\149eY&\153L\134\092\191~\189\185P(\140G\163\209=\235\252\003\179\234\159=\192#\143<\210\216\223\223?0::\1865::\250\239\189\189\189\246\142\142\142\019\219\190s\168\151\131\255\0032\137\028\027\173\212\1907\000\000\000\000IEND\174B`\130",
		plugins = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\015\136IDATx\218\213Z{lTWz\255\190s\207}x\158~\140\223fll\252\136\193\1320\014\132`\176Q%\150GV4TC\165\146M\216?\022Uj\186\155V]Uj\164\157\206\174*\173\182\138\146\221J\2216Z\181\127\208U\172L\020\146(OB\128a)\006\204\016\019\192\216\024c\027\219\140g\252\152\241<\238\220\185s\2399\253\131\025\2288@\2430}|\127\029\205|s\239\249\157\239\245\251\1903\008_\021<|\2480\237\235\235\179\149\150\150\250l6\219\159 \162\158\201d\134\230\230\230\014\191\252\242\2033\007\014\028`\000\000^\175\151\220\186u\171\196\233t\254\198b\177l\001\000PU\245\210\226\226\226\139\141\141\141\209@ \192\000\128\195#\020a\249\007\221\221\221\244\237\183\2236\170\170\170\254\184\189\189\253\175\015\029:4\213\213\213\165&\018\137\198;w\2388_{\237\181O|>\031M\165R\194\241\227\199\141\218\218\218\031vtt<\247\252\243\207G6m\218\148ZXXh\009\135\195\242\167\159~\250\153\199\227\017\195\2250{\148\000\200\003\145\009B\174\170\170\138m\220\184\177\233\201'\159l\171\175\175\167\146$\169\203\245(\165\217\170\170*\220\184q\227\154\167\159~zM]]\157 IR\006\000\192f\179=\210\211\007\000\160\015\003\160(\010\218l6\217f\179\009\138\162H\130 \228\000\000\194\2250\022\2448\231\134,\203\130\195\225\016)\165\092Q\020\003\017s\240?$\015\180\000\231\1560\198\008\034B\193\1439\231\247\211G\204+\009\130\192\017\017\013\195 \255\235\000\000\000\024c\192\024+\000\186\183^.\166i\222\251\158s\206\005A\128\255\019\000\254?H\001\000\230\215dvv\150\248|>\1949\199\251\184\021\002\000\185}\2516Y\092\092$\000p_=\000\000\159\207GfggI\225\185\249w<\146 \198\188\143s\000\128\235\215\175\235~\191\031:;;\141\188\207\243\188;\017Dd\000\192\142\029;\150\229\156\023\002\128\021\244\008!\188\176\246\251\253\012\017\245\229\241\178\210u\129r\206\001\017\229\150\150\150\213\154\166e%I\034\186\174\179d2\233\210u\221\204\199'\024\134\145K\167\211\014\183\219\221h\183\219QUU\1291\166\167R\169\138\092.\151CD\025\000@\215u#\145H\148\186\221\238\213\148Rj\154f\206j\181Z\006\007\007G\001 \235\245z\133@ `\174\024\000B\008\223\191\127\255O\000\224/\028\014\199<\034\010\134a\016A\016\180\013\0276\204\169\170\234\226\156\211\150\150\150;\030\143g{&\147\249\158(\138\1401\134\156s.I\146\190n\221\186\152\170\170\229\217l\022\031{\236\177\240\166M\155\254(\155\205\238ED.\008B6\149JU477\255\254\165\151^\250\217\169S\167\024\231\028\017qE,\129\187w\239\254\187\205\1557\239\223\190}\187\163\161\161\161\152s\142\186\174#!\132QJ-\148R+\034\130a\024\026c,i\154\230\151|\153\016\194\009!VQ\020-\136\008\166i\170\134a\164s\185\028\138\162\200\017Q\136F\163\179'O\1584.\092\184\240\254\213\171W_\025\025\025\153\203\167\222\239\092\165)c\236\165\150\150\150a\183\219\221\092]]mc\140q\2114\145s\142\154\166a&\147\001\2069\020\021\021)\022\139E\201\199A\193\2559c\140d2\025\2124\013\000\000dY\182\148\148\148X\008!&\000\160(\138 \008\130\188v\237\218/\206\159?\255\130,\203\239!\226lww\183\016\012\006\191;\000J\2334\000H\170\170\242\153\153\025DDb\154& \034'\132@!\006\178\217,d2\025~\159\212\251%=M\211x&\147\001\000\016\016\017\016\017\210\2334\003\000\153R:\195\024\203\000\000TTT\172\136\011Q]\215\235b\177\216\245l6\155...v\018B\238\149\215e\229\022\004A\184_*\092\238R\184d\013\136\008\186\174g\226\241xZ\211\180\022A\016\020\000\128h4\186\034i\1490\198\2540;;\203TUU\017\145-\219\247\183\150|v\003B\008d\179Y5\018\137 c,\132\136\011\000\128===+\194RI[[\219\139\241x\092TU\213\160\148\026\133\151\175H\134\200\187\144a\024j4\026\181WTT\252\226\202\149+\195\221\221\221\130\223\239_\025\000\163\163\163\174\197\197E%\147\201\232\249\180\183bE\166`\001]\215\245x<.F\034\145\242\149\174\200D\215u#\022\139\145L&c\018B\216R\246\185B\1945M3\227\2418\205\007\243\138Vbr\226\196\137\235\166i\254*\022\1399\243\169\239\158\255\174\132\200\178\156\137D\034U\140\177W\198\198\198N\188\249\230\155B0\0244V\146\011\241D\034\145L&\147\034!\132\0216\191\018q@\008\001A\016X:\157\022S\169Tzjj*s\252\248q\017\000\204\007e\177\229\214\251Z\029Y:\157\150\211\2334r\206\013\2069\172\020\008\198\024\152\166\2014Mc\169T\202\001\000X]]\205\151\177V\092\187v\237W@\004\002\001\248:C\001Z\160\201\169T\202\140\197b\025I\146\128\016\242\1577\143\136\144\203\229 \022\139\165\227\241\184i\154w\189si;\010\000\240]\179Q\001\128-\030\143\139\225px\166\178\178\178\220b\177H\249\238\234[?X\020EH\165Rf2\153\156\137\197b.\206\185\029\000 \020\010\001\000\128\199\227\017\203\203\203\009\231\252\239-\022K'\1654\198\024\163\136h\000\128UU\213\185x<\254\226\217\179g\211\015\227L\020\000\1441\022]\092\092\212\174\092\185b:\157\206y\135\195Q\173\235\250w:}A\016\1924\205\228\240\240pn~~\2224M3\226\245z\165h4J\188^/\013\004\002\153\221\187w\255h\199\142\029\135v\237\218\165\003@\145i\154\156s\142\138\162\232g\206\156\193\143>\250\232\231\000\240WO=\245T\145,\203\185T*\133\141\141\141l)\029\167>\159\015\253~\255\135\171W\175f\215\174]\251\201\250\245\235+\220n7\207f\179\144\167\189\223\170\002\203\178\012\153LF\187z\245jZU\213\159\134B\161\183\010\167\015\000PWWWZTT\244\212\150-[\180\245\235\215W\001\128\148\247w\004\000\019\017\195}}}\173\029\029\029\173\231\206\157\027.\252.\020\010\129\207\231#\005\215\163~\191\159\029>|X|\253\245\215?\222\179g\207\190\0277n<\222\214\214\022C\196\210%\015\252F\167\2079\135L&\147\157\156\156\204\014\014\014\170\239\189\247\222[]]]\1878\231;\000 \198\024Sl6[syyygeee\1301\214\176$\235pD\020\029\014\135\238r\185\220555\191\177\219\237\255)\008B\142s\238\208u\253\146\223\239\015\020\026#\001\000\224\153g\158\129\214\214V:==\029\231\156\183H\146\004555%6\155\141j\154\198\011}\239\131\172Q\136\021\198\024\183\219\237H\008\225\215\175_\191\249\217g\159\205\015\015\015\255\188\167\167\199U__\255\171\173[\183v?\254\248\227O\200\178\252xSS\147}\199\142\029\179\013\013\013\013v\187\221\150'~X\224\145\185\092\014-\022\203$\165\212f\179\217\158\238\234\234\234\236\232\232\240\020\021\021mjkk\155\185q\227\198\200\225\195\135\239\142\022\131\193 oll\196\137\137\137;\241x\252\217D\034Q\219\212\2124N\008)\150eY\018\004\001\150\176\212{@\010kA\016\128R\010\148RTU5;777\244\238\187\239\226\133\011\023\146\227\227\227\255Z__\127\228\192\129\003\242s\207='uvvZ\235\235\235'\155\155\155ysss}iii\137(\138\226R\011\230gL\212\225p\200n\183[\221\176aCl\207\158=\229[\182l\001\151\203\021\191v\237\218\158\133\133\133\193#G\142\220\186G|\006\007\007\209\227\241\008\241x\252|:\157~z||\188\182\164\164$\186j\213*\145\016\034\231O\025\151g\166\252\201qA\0168\16541444\214\219\219\171\092\190|9777\247\131\198\198\198\181\1556m\250\254\190}\251J\020EY\1979\183X\173\214\242\178\178\178r\135\195\225\016EQ\034\132`a\166Tx\015\034\010\138\162\0209\028\142\210\210\210\210jQ\020K\008!v\151\203%D\163\209\220\248\248\248\196\200\200\200\185\165\204\141\031<x\144\247\246\246\206\187\092\174S\170\170V\167R\169\220\216\216\152\15516\150\203\229\178\156s\138\136T\016\004\200O\224x&\147\201\204\207\207\207NMM\221>q\226\132|\254\252\249\201\161\161\161\208\194\194\130\191\172\172\172\188\181\181\245\151\251\246\2373\026\026\026\026\009!\136\136\092\146$Q\146$Q\016\004\161\208?\228\173Y\144B\021'\005\221|l\000\034Zm6[dzz\186\221\225p\020}\137z\006\131A\014\000$\028\014/\142\141\141}\192\024\027\142F\163\163333\141\154\166e\016qNQ\020\197n\183[(\165\152L&\227\019\019\019\183\006\007\007\163\167O\1596\007\006\006\254mxx\248\205`0\248\235p8<\189f\205\154#\251\247\239\183tuuU\139\162h/\248\248\242\0242\012\131i\154\1501M3\149\203\229\204\187\195=\129,\159_\230\179\034Z\173V\197f\179E\250\251\251\247\222o\184\2038\231\208\221\221M\131\193\224\000\000\012\236\220\185sbll\236\159m6\219\252\179\207>;\217\208\208\224\016\004\129\246\247\247\135{{{\245\185\185\185&D\252\219O>\249\228H~D\175\004\131\193\172$I\243N\167\179\216b\177X\151d\153\175\000\136\197b\209P(t+\028\014\203.\151K{\226\137'j\234\234\234V\223/\195\001\000(\138bu:\157\162$I\177\007N\167\131\193\160\225\245z\133\246\246v\244\251\253\239wtt\012\000\192\159\013\015\015\255\216\235\245\166\009!E\163\163\163\165\195\195\195\239,..\254\246\230\205\155\211\221\221\2214\149JaEEE.O\163\181\254\254~\169\174\174n\164\166\166\166\193j\181ZEQ\164KO>\030\143G\206\157;7\253\254\251\239+\145Hd\209\233t\218\147\201\228|OO\015)++\171\149e\249K\250\170\170\170\179\179\179Sg\207\158%\241x\220xh\247288\200\131\193 \243x<\226\192\192@\188\190\190~MKK\203\247\182o\223\142\132\016\177\191\191\159\141\140\140\028\027\024\024\248\196\235\245J\031~\248\161\017\014\135\205\193\193A\000\000\168\172\172\252\236\246\237\219]\225p\216\230v\187c\014\135\195!I\146\092(v\186\174g\206\159?\127\253\232\209\163\242\205\1557O\222\185s\231p6\155\149fgg=EEE3\245\245\245\165\138\162(\1401@D\2084M\155\158\158\190\213\219\219\155\254\248\227\143\213\185\185\185C\223d\184\139\228\1740\2069r\206\145\016\194\010t\164\164\164\132/a\142\028\000\132s\231\206-\220\184q\195722R\021\143\199\179\140\177\2362\154\156\157\154\154\178D\034\145\200\201\147'\255\166\181\181\149\006\131\193W\023\022\022\2540::Z\137\136\137\165\250\166i\154\233t:=<<\236\030\031\031\255\151\207?\255\252\250\215\002\144\191i\225\1401~\031\202\204\031@yY{{\187\228v\187\255\188\170\170j\222b\177\008\136H\151\021@\209\229r\169\197\197\197e===?\142F\163\233m\219\182\253\169\205f\243TTT\2042\198,\203b@\144$I\169\169\169\153\169\172\172\244z<\158\234G1^G\175\215+\000\000\175\170\170\250\199\173[\183\238:t\232\144\222\216\216\216\160(\138u\233\232E\020Ee\227\198\1415;w\238D\183\219\253C\171\213\250\187\218\218\218\151\182o\223^\212\211\211S\174(\138\163\160\2079\007EQ\196\234\234\234\250\131\007\015\226\174]\187ZJKK\255\157>\202\217\189\162(m;v\236\136o\222\188\185\153R\234X\222\170RJiMM\205\234\158\158\030\034\203\242\248\232\232\168\167\186\186:\182m\219\182\226U\171V\181RJq\025\195\165eee%%%%6D\028\024\024\024X\243H\0010\198$\1950\004\1950\140|\241\187/\249s\185\092\181;w\238\180s\206U\000\168\146e\217\177t\243Ku\025c`\024\134\169\235:\225\156\139\143\228\134\166\189\189\189p\167\240\246\1533g\232\208\208\208\148a\024\198\131\250\092Y\150\169\195\225(u:\157uN\167\211\165(\138\244\000\194\200\243]\221\212\241\227\199\197l6\251\206\163\176\000\247\251\253<_5\255\009\000\210555\127\217\212\212\180 \138b\133a\024\152\203\229\012\000\224\162(\034\165T(p\172\187\197\246n\015\194\024\227\1401f\154\166\201\024CQ\020EJ)\230r\185x__\159~\233\210\165\183>\248\224\131_<\178;\178\003\007\014\016\159\207G\230\231\231\131W\174\092\177]\187vm\010\000\162\148\210D8\028\190:11q}nn.\166iZnI\149\189\215@\153\166i\196b\177\197\201\201\201\209\201\201\201\001B\200<\000\196\198\199\199\199\250\250\250\236\145H$\244\208{\226\135\140J\176@\173\009!\248\160I^ \01609\231\232\247\251\199[ZZ~z\244\232\209\159\221\186uK\151eY\187z\245j\145\197bIvvv\014\173[\183\174MQ\148\242%\221\028\007\000L\167\211\153\145\145\145\027\151.]b\225p\184l\237\218\181)I\146\200\023_|Q\020\139\197~\153N\167O\249|>\242M\001p\20697M\019\243\169\144?l\236\129\136\224\245z\225\1417\222x\167\171\171\203\022\010\133\190\143\136s\186\174[\172V\235\170\169\169\169\170\218\218\218\153\210\210\210\242\188\239,\0050\127\236\21619\020\010e\019\137\196\217\011\023.h\132\144bM\211.\158>}\250\183^\175\151\248\253~\254M\001\136\217l\214L&\147:\231\092\200\155_|\024\224@ \192\242\237\223\127\000\192\239\011d\174\169\169\169\209b\177\188\018\139\197\030\019\004a)\201\195\252=\003\153\154\154JLNN\250/_\190|\010\238\254\175\195\004\000\190\164'\254z\000R\169\020\230\201\148\018\014\135\225\226\197\139\163\156sibb\162\034\151\203\021\253wV\011\004\002\166\215\235\021\188^/\000\000\244\245\245I\175\190\250\234\205\182\182\182OC\161\144\167\169\169i\1960\012\027\231\156q\206\137,\203\217\139\023/B\034\145\024\186|\249\242\201\023^xA\217\187wo\014\000H \016\000\191\223o~\157\177\222\151\188\161\187\187[H\165R\197N\167\243\031\020E\217K\008\201\166\211\233\193T*\245\163\134\134\134\217o\250\215\154\238\238n\154\205f++**~\237t:=\146$\197M\211\164\130 \024\1401k,\022\155WU\245\007\199\142\029\187\245\176\185\208\127\001\175\240\250\145(W\131\139\000\000\000\000IEND\174B`\130",
		pluginfolder = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\012\158IDATx\218\213YopSWv?\247\222\247\244d\233!\235\201\150\141\177\013\1821\004dc\147u\130\193ib\022\240NH&,n\034\216Y:\164\1956\244\003\153\182;;\157\157n\219Q\244\165\237\1803\237L[\182\173\199n\152\013\165\217\1680m\018'\219,\016k\176a\129(\139\004\018\127l\203\178-\219\146\252G\146\173?Oz\239\221\219\015\182)C\178\128\193N\178Gs\191IW\231\220s\206\239\156\243;\168\177\177\209\092X@+-\022\241\247\004\030\031\018x\018\197\004t\024\016c\240\168\194\144\162i\249\148\172\150\166\211\218\213\153\217\153\223\247x\130I\000@\000\240\232\215<\134p\250Bd\149D\227\255\236m\173\140}\187\165\034%\020\240\165\132\016\006\140\162G\253k\132\000rY\021\146\0099r\230\236\224\006\247U\218\181\169a\211O\014\182\031\028x\235\173\183\000!\180bFp\171W\009o\188\212Z\017\253\206\246\242\138\170jK9\172\210!\160K\188\133\001\000\163\144\143g\1393y\205;1\153\253\029}\132<\227t:\239\244\244\244p\000\160\174\148\001\164\193\182\238\237\163\007ld\237zK\149\146U\017M+\160\166\243\160-\229d\242@e\013\136\158p\002\198\220\170\002\221@p4\185^\230\132\203\159_\249|\026\000\240J\133\018g\020\248\136\174@(#F\001\171i\133!\140\016 \180\228\139\016b\192\020\202,\022\193\218X_\148~\191g\168Fd\130\200\024\160\189{k\249l\182\092[\202}%%%\204\229r=\2447\028BL@\024\024\208\2497b\011\153\183da\000T\161\1603\011X\162\172h\195\218\194`\127hv-B\224\003\024\200\001\012,\249\202\163G\143\242\241x\007u\185@\251\205\006\192B\130\161'w'\195\000\160\001p\024s\181\235Lt\181Ux\235\133\237\141\134Y\133\2300c\024=\002, \132(fD\208T5\211\209\209\209\253P\015,g`b\140\016ST\192\012\244Oo.*1\137\250\216\173\193\153\191\151\243\026\135\030-\007\016\000\210ryU7\149\144\199+*\196\029\227\177\185\011W\175\250\255\215\225\000\236t~\017^\184\229N*U\161@\016\144\202\010sE\249:K\217\158\221\213\025\192\136\002c\015\2471\194\000\1361PU\026\026\140\171\199\255\195\255&\166H\189\010\240I `\231\000\092\249/<\218\178\195\194\194S\019\004H\135\016\007\0265\129J\205\160\177\194\135\031\173\0164j\006@\150bI_\127\236\251\245\131\235*M\251\027\026\234^v\185\092y\187\221NV\220\003\139\162\168\012@U\030\011<\017\000\136\146Q'Z\140UEf\129r\0282\000\000\196b1\244\149\0250\143\196\232\177\192\129Q6\255;\140H\001Od\140\145\252\027\243\014\190\169\194\022\212C@\024c\248\183\207\000\000\000\160\192\224\193=\2297\210\000\198\024\000e\012\230?\015\174\003\2234\229\009A\192\235t\000\133z\004\012\244z\129\228\021\133\169\1915\030PU\006YY\147s\233|\0180\011\203\178*\240\024\155\1901\030\152\143h\006\247\006\007B\008\016\193\128\129\161\1539y\242\218\141\216\200\141\254\004\031\153\145\203\134G\146\191\208Qtv\190\018\187\233\215j\000Bh\190\216\002\006 h\030c\025\003\132\0014\133\194d\034=r\249Zl\234\131\158a\218?\146\250Q\034\129\1664\013O\220\184\225\139]\242\001\006\128\175\215\000\198\024\016\014\003\214q*\0088\007\0243\160\128@\209\176\170\200\209\143{FgN\2552h\204f\233\155n\247gg\027\026\026\1541N\177\187\144\244u\133\016F\008\016F \203\138:=#\199Fcs\179c\145\180\164(\020\010\004\002\140\130:\028I\161>\207\132x'\1528RXX8y\232\208\247^\231y\253_\019B\206TVn\254\239\153\153\025\223\165K\151b\247\207\217\220W\020;,\175\168t*.\143\252\234\243h\194}u|nf6\215\145\1505l\018\005U ,7>\149\169\153\203\202g\202\203\173YA\016\187\235\235\027\213\215_\127}\198\227\241\180tvv~\143\016\242]\000\136\217\237v|\239\160\179\162\006,v\017\217\156J\227Iy\240\191>\238O\247z\034\133\138\162\253\197\135\191\252\236\227\251\191\223\212\212\220\092XX\248\243\151_~y\230\213W_5\149\150\150\214\149\149\149]\202\231\243iY\150\217W\026B\140\001\016\014\001`\012\201)9\220}~X\1871\152<\254\235@\244lIy\185y\207\174]\023\245\006C,\159\151\139\243ye\144P\246\175\162$\189\189}\251\246\184\221n/\181Z\173\213\209h4\244\201'\159T+\138\2427\249|\222k\183\219\137\203\229bMMM\188(\138\204\237vk+\215\204\001\003\132\008\168\000\218\205\193\153\201\143\220\1950\022\207\014m\217\178\169\208b)\253\183\029;v\024\235\234\234J#\145H\222\239\247\011\161P\232\239\154\154\154\018\007\015\030,\179Z\173\235\166\166\166\134O\159>\253Y___\201\236\236\172\207\231\243\165%I\210\003\128\236\241x\232\138z\000\001\000\225\009\164\179y\154\202j\129\243\151\195k\166fr\255\244\249U\223\249\181\251\171\221/\188\240\130\169\189\189\029K\146\1806\155\205\1987o\222\172\014\014\014\178\186\186:\139\213j]766\214\127\242\228IKoo/\238\238\238n\181\217l:\000\000\183\219-o\220\184\177\184\164\164\164\157\016\146\2104\237,\183BI\011\136\231@N\228b\031\247\132\210C#\201\184\134\224\253\189{\247\238\183\217\234\208\139/\190(\154L\166rJ)\230y\190x\195\134\013Rmm\173,\008BA<\030\1599}\250\244h__\223;\209h\244\246{\239\189G\092.\151f2\153,\132\144\163EEE\235\005A\248.cLM\165R{\184e\214\027\024\003`\1401@\008E'3\154\199\023\203f\179\218\017M#[W\175^\253\183\187w\239NK\146$\017B0c\0128\142C\011\145 \002@nlll\218\231\243\153\174]\187vjttt\240\248\241\227\092*\149\210\201\178,\213\215\215\031z\233\165\151\012\207?\255|\248\206\157;\234\137\019'~\130a\2014\220\003\154_\006\128\241\252L\153I\164g\251G\226\169\208x*|\197\167\198\204f\211\139[\183n\229\159{\2389\137\2278\017\000\024Z\224\159(\165\160i\026\203f\179\140\227\184\156\197b!555?\221\182m[\133\219\237VEQ\252\241\150-[\254\253\224\193\131a\187\221.UWWo\173\168\168 \140\177:\140\000\003\187\203\173<9\244\016\142\128\134\153rsp&rk >\172\000\250\147M\155L{JKW\239li\2171M\008)\231y\158\177{\134|\1401\016B\128\2278\161\178\178\178\250\232\209\163|[[[\149 \008?\181\217l\181k\214\172)\127\229\149W\214\183\181\181m\211\235\245\210\237\219\183\003]]]:EQ\222\228(\165\026\208\249~d\161;yl\014\1441`@\016\002\005\231\007F\2302\158[\147\149\193`\13644\1804\127\235[O\203eee\022\142\227\200b_t\127\004\242<\015<\207\027\171\171\171\159joo\015d2\153\213\217l\246\253\230\230\230\248\190}\2518\157N'\221\188y\211\243\238\187\239\026\253~\255\136\170\170!n.\171\020'\226\233i\235\148P\1401\210\017\130\230;\198\199\176\130\034\134\024\143A\203\001\157\136d\184\201)\249\03116U\241<\255\135;w\238\010\154\205R\209\226\203\163\007\208\151\024c\190\178\178r\195\145#G\134\141F\163\206l67`\140\013###7:;;\245~\191\127|zz\250\013\143\1993\206)\140\253\169\235\023C?\254\221\2214\216\184\181\172\028D\189pO\223\187\180a\1322\000\179\001\140BF\205\229r\198\209L\242?9\224,\146$\197+++\173F\163Q\164\148\002\198\248\161]\235\170U\171\010x\158\175\021\004\129\207\231\243\154\215\235\253\245\1533g\200\173[\183F\195\225\240\015\002\129@\196\225p`n<\154\185\034\231\162Y\029\1352\225\201\140h4\010:\1321B@\151\236\005\198\000\244\006\129\205\165s\234P4#\027\145\177\136R\138\012\006\0036\024\012F\000\192\140\177G\165_\145 \008<B\136)\138\146\028\028\028d\163\163\163\145\169\169\169\031\006\002\129Hkk+\231t:U\142\139\196'\130\009\253\183\021Y\249~\239\229\137\253<O\162\012!\029<f^c\1964Ec\150\140\162t\092\255\236z\240\169\167\158\218\1301\210\238\174r\150\206|#\140\177\216\208\208\192\188^\239\218P(\244g\000\240\007w+\241\175\194\225\236{v;9\224r\189\013\000?[F\030\031-\190t&\147e\153L&+\138\034[\202\024\187h,\207\243\186\218\218\218\242\141\0277\202W\174\092a\000\160\029;v\140\184\221\238\249V\226\128\203E\237v;\177\217b\232Iy\234\157\000\208\003\000.\215$\014\004\002\026B\136\143\199\227\166P(4b0\024\010\013\006C\225R\193\141\231y\004\000FQ\020s\028\199)\247\234\184X\137\023\151\009O\188\148s\254\255\235k\014\135\003\191\243\206;\131\185\092\238_\186\187\187\247[,\150Hmm\237\170E\162\234A\225\196\022@\004\205\127I\139D\034\003\215\174]+\202d2F\000\128\227\199\143\163/c%\150+|\024\000\176\158\158\030\028\012\006\147:\157\174wnn\174\128R\170.\234\244\176\092@\008\129\170\170\144L&\163^\1757t\226\196\009)\024\012\246\241<\255\231v\187\029\187\221nmEi\021\135\195\129u:\157\208\216\216\184\173\184\184\184\190\165\165%g\181Z\173\148RPUU\163\148\210EC\023\015\165t\241PEQ\148|>\127\251\163\143>\138tuuy\221n\247\249p8\252\195O?\253t\216f\179\221\173Th\133\244\191\203 \0288p\160\127\207\158=Z{{\187^\175\215[\227\241\248\212\196\196\196\164\193`\208WUU\149\139\162h\190[\008)\213\226\241\248t4\026\141\014\013\013\165/^\188X5::\026\024\025\025\249\129\219\237\014\221\003\014\236\254\169o\217\026\210\166\166&\206\227\241(\207>\251\236\027\235\215\175\127\250\240\225\1955;v\236x\218h4\150\132\195\225[\189\189\189\177\011\023.\020\150\150\150*mmm\172\162\162\194\170\215\235u\000\192\146\201dvhh(\214\215\215g\188~\253\186:==\253\207\169T\234\162\207\231\187c\183\219u.\215\023\023\028\203\217N#\000`555tvv\182\188\161\161\161\174\169\169\233@ss\179l6\155\139\167\167\167}\167N\157b}}}&\132\208\031MLLl\241\251\253?\018E1\162\211\2338\198\024\147e\025\210\233\180EU\213\127H$\018}\023/^\244/\134\163\211\233\204?h\238~b\229\029\014\007\250\240\195\015\245\005\005\005\135\138\138\138\222<|\248px\215\174]\141\162(\150\013\012\012L|\240\193\007\169s\231\206\229\131\193\224\177\254\254\254\011\000\192m\222\188\185:\153L\202\217l\022\000\000$IB\024c~```\004\000\148\214\214Vn\231\206\157\212\233tRXIimm\229\000\000l6\219\182}\251\246\133O\158<yyll,\154\207\231\233\240\240\240PWW\215\207v\239\222}\234\153g\158i\001\152_\159\206\211E\243ht\255q8\028\248\203\214I+\198J\148\148\1480\000\000M\211\168$I\201\237\219\183s\022\139\165 \018\137\220\236\236\236\092\227\247\251\227\231\206\157\251c\135\195\129\141F#\215\209\209\161\000\000z\237\181\215\200\002\162\220\149@ \128\156N\231#/\197\151\197\128\197\221\021c\012\229r9axx89>>\030\244z\189\019^\175\247\175\198\198\198\198\016B\208\211\211\131\221n\183z_\241\092\022\238\233\137\239\177\219\2378\024\012\010\146$\0296\026\141\127I\008\153K$\018p\254\252\249M_\006\127\203%\255\007\204N=\239\127\207\223\180\000\000\000\000IEND\174B`\130",
		chat = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\011\198IDATx\218\205Z{lS\231\021?\223}\248m\199\193\177\227$\144\151C\030&\001\1624I)\208\132\020\170D\1335\026\004Qm\240Gii;i\157X;\237Q\013'\1706*M\1554!m\130\010it\173\016\184\005Mc\218\031\169\210$D@ \133x\137M^\139\147`b\231:q\028\219\177\239\245\245\253\190\253Q\167\010)\140$\180\013G\186\242CW\247\158\223\185\231\252\206\239\028\027\224AC555\012<\165\150\244\013=\224\240\162W\178\240eee\229A\150e\011\008!\243\008!j-\157F\008\017B\136J\020\197\145[\183n]\092\226;A\000@\001\000\006\000z\219\182m\155\243\242\242~\149\149\149\149#\151\203\205,\203\138K\017\127\207\206\003!\132\240<\207F\163\209)\183\219=9::\250\187\254\254\254;\000 \001\000\133\000\000\234\235\235uJ\165\242c\171\213\154QZZ\170(--\197F\163Q\1980\140|\141\163\015\132\016\204\243<\207q\028\127\231\206\029Yoo\1754<<<\229\245z\0159\028\142 *++K\181Z\173g\234\235\235\011\027\027\027\013j\181:\005!\164F\008\161\133\139\172\149\017B\200W. \192\024'0\198\209@ \192\157={6\218\217\217y\207\235\245\190\201\228\230\230~\092UU\149\211\216\216\168\209\235\245Y\000\000\162(\206x<\158\201X,&\172q\013\016\132\016\210j\181\202\204\204\204\245\000\1603\026\141\186\215^{\205\025\010\1336\007\131\193B\166\188\188|]]]\157\164\215\235sb\177\152\224v\187\135\218\219\219\217\241\241qU4\026US\212\154\2140 \132\136Z\173F\022\139\197\183k\215\174\169\220\220\220\130\244\244t\235\139/\190\248\229\212\212T3\179o\223>6+++=\145H\224\153\153\153\255~\248\225\135\138\238\238\238\127\017B&\017B\180$Ix\173\156\167(\010\008!\136\166i\220\217\217\153\202q\220Ko\191\253\182_\169T\026\215\175_\159\178{\247\238(c\177Xr5\026M\138 \008\129\214\214\214\248\212\212\212?\174_\191\254\155\167\173\007\148\148\148lt\185\092?t8\028#\229\229\229:\131\193\144ZTT4\207\232t:=M\211t(\020\138\014\013\013\169C\161\144\027!\004\187w\239V\007\002\129\248Z;\158\159\159\143T*\021\229r\185\002\000pixx\184\161\188\188<&\151\203\229*\149J\193,.R\1401\240<\175!\132\160\188\188\188xkk\171\248\020\000\160\207\157;\023/++\171\226y\254\141\204\204L\007\198\1840\030\143\199\230\231\231\005j\161H\017B$\249\138\023w\229\167\200\226\169\169\169\179\005\005\005F\185\092\174\008\006\131!\143\1993\247D\186\167\169\169\137\2308\238\137\026\133\201d\034v\187]z\220y2\153\140\152\205f\200\204\2044\2094Mq\028\023\238\239\239\143\175\006\192\215\186i97^\237\181\023\204j\181\018\000@r\185|z\195\134\013\148L&\211H\146$q\028\199\247\246\246ZV\003\128\000\000\228\228\228\232KKK\255\164V\171)I\146V\149r4M\163\249\249y\220\223\223\255\243\241\241\241\224\195R\183\165\165\005\003\000X,\150\247\242\243\243\231\001@I\211t\212\237v\235|>\159m%\000PMM\013\237\243\249\148\197\197\197\191\206\203\203\219[TT\020W*\1492IZ\221\131\160i\026b\177X|\227\198\141\157n\183\251\202\192\192\192I\179\217\028\235\232\232\144\146`\016\000\144={\246l\205\205\205-\201\202\202\146\001\000\154\159\159\159\245x<\204\204\204\140\131YA\190Sv\187=QVV\1825==\253\232\241\227\199=&\147i#B\136Z \128Uh\029D\008\193>\159o\228\228\201\147GGGG\255\221\209\209q\181\169\169\137\182\219\237RMM\013\157\004\243\129\197bQfdd\172\139\199\227\146\219\237\190755\149G\211\180q\165)\132$I\018\004A\136\005\131A);;\027\001\192\147*V>\028\014'\004A\136I\146$<D\190\019\173V{\175\160\160\192\170\211\233R\163\209h\224\218\181k:Q\020?\018E\241\214\178\001$#\194\152L\166/%Iz\231\220\185s'KJJ\230\212j\245|\034\145 +\213L\024c`\024\006\133\195\225\196\224\224`\170$I\239l\218\180\233K\163\209H\219\237\246\004\000 \147\201D\182o\223\158m0\024tf\179Y\006\000\244\252\252\188022\194\251\253\254\174\145\145\145\208\138\158@GGG\0349\000}V]]\205\244\244\244\172\167(*B\008\161\254\143\163\020!\228\161i\134\016\194\024cM<\030w\223\188y\243\179\228\181\165d\202\178v\187=\222\208\208\240\003\163\209Xm0\024x\000\000\142\227\148\129@\160\187\173\173\237\1596\155\141Y5\011uww_\2486\249\211f\179Q\011\140c\179\217\168\230\230fq\203\150-\165:\157\238Puu\245\004\203\178\229\146$\197\239\223\191?\203q\156\022\000\168\246\246v`Vs\147\250\250z\157N\167\171\016E\241\143\012\195\2000\198\143\138\174:\145H\140dee\1892==\029\010\135\195\140\223\239\199\021\021\021\015\156;88HZZZ\018\011\159].\023B\008a\171\213\170\215\233t\150\205\1557O\201\229rU(\020\242\013\015\015G#\145Hfr\012\166VD\163.\151\011\149\149\149\173gY\246/EEE%\181\181\181~\173V\139DQ\148\008!h)\199c\140g&&&\204\237\237\237\127\029\024\024x\183\184\184\216[]]M\022\034\253(K6/\160i:\154\145\145\017\221\176a\195z\154\166\169\241\241\241\192\232\232hL\020\197s\000\000\181\181\181x\1654*m\217\178e\163\217l\222q\236\216\177\187\169\169\169\021\010\133\130\197\024\227\135\013\255\132\016T]]=u\239\222\1894\135\195\145i\183\219=6\155mY\213^SS\195\176,Kegg\019\154\166U\000 y\189\222\196\192\192\000\233\234\234\250\251B\147[6\000\171\213Jl6\027\245\233\167\159\250\016B#cccZ\153L6\025\139\1974\132\016\242\136\217Y\002\128\233p8l\016Eq\217\154)\249\132\240\161C\135\254\144\159\159\031IRu\204\237vkfff\222\172\169\169ajkk\241\138\000\180\180\180\224\166\166&\218\233t\222-,,|\245\244\233\211\127\219\180iS8==}L\016\004z\233\249\012\195\144h4\170\028\027\0273\012\013\013\221\230y~\178\169\169\137~\156\210]\168\179\186\186\186\031\023\020\020\200222\228\000@\241<?766\198\010\130\128\187\187\187\019&\147\137\006\128\149\021qR\188Q\151/_\238\223\177c\199\193p8\188=\022\139\253\158\0162\007\000\139AH\008!\189N\167;.\138\226\253\185\185\185\187N\167s\214\233t.\236\160\030i\237\237\237\020\000`\132\208\145\162\162\162\148\236\236l\163 \008\241\193\193\193\251\028\199\025$Iz X\171\161Q\156l\245\163\0000j4\026/3\012\243\013\167\018\137\004\229\247\251#K\148&^.\219\245\245\245y\242\242\242\010U*\213\186H$2}\227\198\013%\203\178\031\244\245\245\221\180\217l\204\002k\173j\229`\183\219%\155\205F\017B\144\223\239\143x\189\222\232\210\195\239\247G\008!(\1536h\185CRmm-\180\180\180\224\204\204\204HZZ\154\150\016\130DQ\012\187\092\174\148\193\193\1934\000\192^\175\247\235zZ\245\206\164\165\165\005?N\196!\132\022\134\021\178\204\2003\205\205\205\210\254\253\251\027\210\210\210\170\210\210\210x\132\016p\028\167\008\006\131\183\002\129\192\1996\155\141:s\230L\226\137\001|\023+ \175\215\139\016BD\171\213\214\150\150\150\234\212j\181\002\000\196\201\201I!\024\012\206:\157\206{\201\026!\171\001\240\157\238\024\017B\228\204\1533bEE\197\159\181Z\237\129\029;v\128L&[\231\247\251}.\151+\018\014\135\179\031\230\195\178\000\028;v\140M\162f\000@\013\000\138$7\203\001@\182\232\253j\015%!D\214\208\208\240~ee\229K\135\014\029\226RRR\242(\138\130\137\137\137\192\237\219\183g$I\250%\000\144\228|\176|\022\186x\241\034}\240\224A\241\229\151_\214\019B>\210h4y\006\131!\172\209h@\169T&(\138\034Ke\196\138i\013cDQ\020IIIQo\219\182m\182\184\184\184D\161P(x\158\247ttt\024\220n\247O:;;\239,\022|\143\0050;;\139\000\000\014\030<(\213\213\213\189\145\147\147SQYY\153\187s\231N6%%e#EQ\012EQ\232I\157_\218\252h\154V\177,\203\198b1\238\139/\190\008\013\014\014\254G\016\132\177d\022|cv}$\000\179\217\140\000\000\014\031>\252^UU\213[\207?\255\188\152\157\157\173\212\235\245\233\139\131\247mo\163\001 \225\247\251\157\151.]\146\186\187\187\007\149J\229\235\215\174]\139\236\217\179\135z\152\008|\024\000\212\212\212D\159:uJ8z\244\232\137\170\170\170\031\0299r\132(\020\138\092\000\128@ \192\005\002\129\153h4*NOO\155%IBO\250\027\002B\136`\140!\030\143C(\020\018\157N\167~hh\232\198\205\1557\143\140\143\143\243\000@=J\1932Ks\017\000\136\221n\151\246\237\219\247\254\179\207>\251\202\145#Gt\012\195\024\019\137D\140\2278\174\173\173m\178\187\187[\239\241xt*\149\234\183\162(&h\154~\226\208K\146\132\162\209(\021\141F\025A\016\140\030\143\231\212\196\196\004\1910\224?2\237\150\178\146(\138\194\174]\187~\241\194\011/\028>p\224\000\146\201dF\000\224\187\186\186\134\207\159?O&'''1\198?\243\249|lOO\207\181\239\1869<ny\2465\000Q\020i\154\166\239k4\154\159\022\022\022\242\251\247\239\151\244z}~<\030\143\245\246\246\222\191p\225B\244\250\245\235o9\028\142\187\000 ,t\206\197m\253\219\178\174\174.\228r\185\196\229tpf\209#\164\016B\137\234\234\234@cc\163\198`0db\140%\143\199\227\253\228\147OF\221n\247\187\014\135\163\143\016\130\154\155\155)\151\203\133\022\143\129ke\204W\179\008\002\181Z\173z\238\185\231\024\147\201\164)((\176(\149J\133\215\235\029:\127\254<v\185\092\222\207?\255\188\175\162\162\130E\008-+2\223\155\241</`\140I<\030\143{\189^O8\028\014\019BH$\018\241\157={\214\181w\239\222\207\170\170\170tIU\249\212\025\229\241xF\130\193\2244\1950lZZZ\134Z\173\214\008\130\016\184z\245j\160\167\167\199\225r\185^\189u\235Vha\208~\218\140\150\201d\199\148J\229\156\197bQQ\020\197 \132\002mmm3W\174\092\185\013\000\199Z[[\195'N\156\160\030\183IX3\009\187s\231\206\203[\183n\213n\221\186u\139^\175O\248|>\024\031\031o\189t\233\210\235###\194J\134\1455\001\000\000\240\2043\207\148+\020\138\006\154\1669I\146\012}}}\167\231\230\230\130\143k\034O\133=\205\127\175Y\142\253\015/\159\229\184\228\225t!\000\000\000\000IEND\174B`\130",
		terminal = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\009\155IDATx\218\237Yml[\229\021>\239\189\175\239\181}\253\145/;.m\157\016\226&\205\135ij\149PB\227\180t\001i]AB\183i`\027\148\166R4\009\208~T\155\178\031\198\219@H\1476\009\164\253\160\213~ M\002\236T\026\171\016\205T\018\211\018\218\162\004J\183\136\132\196\142\242\229\184NR\187\215\137\175}\239}\223\253\216u\023:FC5\154l\235\249su?t\223s\206\251\158s\158\243\028\128\187rW\254\191\005}\221C\191\223\1437\162\178\145HD\253\198\015\252~?\166\1482\027\213\219\148R\230f\231\222\184\017E\145\013\133B*B\008\188^\239\147\006\131\001\001\128\162\170*\194x}6DUU\208\215\198\138\162P\132P/\000\016]W\237\198\017\010\004\002L0\024$\015<\240\128X]]\189\203n\183\031\180Z\173v\163\209H(\165\012Bh\189<\014\008!*\2032\202d2iI\146\254466v\241\226\197\139\167\010:#\000`\000\128<\242\200#O\151\148\148\188\244\224\131\015\170mmm\154\203\229r\153L&\150eYD)]\159\000E\008(\165D\146$\146L&\175\158;w\142\249\248\227\143!\149J\189\244\254\251\239\191\005\000\012\242\249|f\131\193 \238\216\177\163G\020Eu\211\166Mv\131\193\224\178\217l,B\008\024\134\129u6\0004M\003I\146\136\166i\243\179\179\179\215{{{\153\225\225\225W\020E\009aA\0166\023\023\023\247<\252\240\195\249\251\239\191\191\138a\024s&\147\129l6K)\165\235\166\252ja\024\006x\158G\022\139\229\030\135\195Q\020\143\199\163333=\169Tj\144\245z\189\199\246\239\223\191u\231\206\157N\158\231KUU\165\138\162 =>\208F\016\000@\148RD\008!\138\162`\158\231s,\203\198\227\2418\139\001\224\133\218\218\218\133\226\226b\023\000 \139\197\130\012\006\131\134\016\162\027,\133\034EQXI\146\192\225p\184\234\234\234\174\157={\246\005l6\155\227%%%\014\167\211iH&\147\249\169\169\169\197T*\197\034\132\152\141b\004\165\020QJIQQ\145f\181ZK\029\014\007\151L&\139\005A\136c\000\2241\198\140 \008\016\141F\151N\158<9999\153eY\150\210\127\006\000\162\148\034\132\208\234\130\160\000\000\189C\193\1404MC\149\149\149\166\174\174.TYY\233\2268\142\001\000\030\235J \000\208dY\134\241\241q\182\191\191\255\153l6\155\208\159\019\253\170\222\1640\254wP\228;\128;\212d2\149\239\221\187\183W\150e\000\000M\143\013\138o\218*\214l6+6\155-/\203\178\162g!\132\016\162\187v\237*E\008u\178,\155'\132P\183\219\253\135p8\172\222\137,\133\016\002\155\205\1507\155\205\010\165\148-\020\185\027Pbu\165e\024\134RJQ\001^ \132hEEE\185\221n\255\189\199\227i)**ZI&\147\230\137\137\137\006J\233O\003\129\000\004\131A\250\029\030'\244\015})b\024\134\1746\010\244*|+!F\163\209^\092\092\220\208\209\2091\215\221\221m\232\236\236\156u\187\221\223\223\179g\207oO\159>\205\250|>\028\008\004\214\005\0042k\205\002\000@1\198\006\150e7\187\221\238\237G\142\028\145\188^\239\001\140\241\203CCC\202\192\192\000#\138\034\187\161\012\008\133B\020\000\000c\156J\167\211\019g\206\156a\167\166\166\254f6\155\141\030\143\167\225\241\199\031\191\222\208\208\240\228\190}\251~\021\137D\212\186\186:\186V\167\220\169\029\160\129@\128\025\025\025I$\018\137\159D\034\145\241w\223}\151]XX\248B\150e\182\166\166\166\174\187\187[\170\174\174~j\247\238\221\191\014\006\131 \138\034\186\147F\220r\161`0H\252~?{\249\242\229\201t:\221=444\246\230\155o\210d2\249\133 \008\188\211\233l\232\232\232H\249|\190\206\214\214\214\151C\161\016Z\149\154\191sYS\167\018\137DTQ\020\217p8<\187i\211\166\231r\185\220I\171\213Z\219\222\222>VVVVYSS\227\237\236\236\252\235\242\242\178\200\178,\154\158\158\014455\169\133\166c\221\131X\143\007\173\181\181\021\207\205\205-.//?\219\223\223?\022\014\135SW\175^\157\148e\153u:\157u]]]\153\166\166\166\195UUU\207\135B!\237N\244\214\223\234\172F\034\017\213\239\247\227\225\225\225t$\018\233\136\197b6I\146dUU\243%%%\156\199\227\169\174\170\170\162<\207\171\000\000mmm\176\161\012\000\000\166\166\166\006QJ\161\185\185\249E\187\221\158\2298\142\193\024#I\146\224\250\245\235\179\139\139\139l.\151\179\001\000\012\012\012l\140\024((/\138\034~\227\1417\212\135\030z\232\023\245\245\245\199\030}\244\209\197\242\242\242\173\130 p\137Db<\028\014\171\159\127\254\249\021J\233)\191\223\143\157N'\189\157\218\016\010\133\200Z+\251\154\012\208S)\010\133BjKKK\143\219\237~\238\208\161C\201\134\134\134zUUM\243\243\243\209\190\190>\229\194\133\0113ccc\207OMMEo\135\008(\224\027\189a\135\181\024\177\022\003P0\024$\000\000>\159/X[[\251\195\206\206\206\197-[\182\212!\132L\178,\199N\157:\149\253\232\163\143\166%I:r\239\189\247.\216l6\191\170\170R\001\199|\027\220\195\178\1721\024\012\014\001\128\188\150T\140\215\224}t\250\244i\147\213j\253yee\229\211O<\241\196\226\182m\219\188<\207\243\177Xl\226\204\1533\185\225\225\225\169\185\185\185\163\215\174]\147\026\027\027_ill|\202n\183K,\203\242:\016\187%\218\004\000\170\170\170\178\180\180TTZZzbyy\249\213\003\007\014\200:P\188=\003DQd\130\193\160\230\241x*\182n\221\250\227\195\135\015/y<\158\006M\211\248d2\025\237\235\235\203}\240\193\007\179\243\243\243]\163\163\163\241\198\198\198=6\155\173\243\232\209\1633\247\221w_\165\213je4MC\132\144[6\237\008!\200d2\185+W\174L\1598q\226\217\133\133\133\183\130\193\224\136^\127\180o4@\247\000\210i\012\196q\220W\233;\140U\158\231Sf\179\217h4\026I<\030\031\013\135\195\234g\159}6\147H$\158\030\029\029]\212\183{\197`0\164-\022\139\205\225p8\004A\248V\021\217d2iv\187=\205\243\252\018!\228+<(\199qx5\164.\196\024\006\000 \132\020\240<b\024F\149$i\229\237\183\223f\015\029:D\245\247J:\157\166\231\207\159\199\019\019\0193\177X\012\127\242\201'S\209h\244\153X,\182\232\247\251q$\018Q)\165\138$I\240\225\135\031\194\228\228\228\156\201d\226\214B\205\232\252\019]YY\145\199\199\1999I\146TB\136R\000\148\239\188\243\014{\236\216\177\021\134a\212\002w\171\235\1400!\132\228\243y\002\000\200`0\168<\207s[\182l\217\209\209\209\209/\138\034\007\000\016\014\135'KKK_\232\235\235;\1421^\201\231\243\152e\217\159E\163\209\171mmm\198\182\1826\213\235\245\242\175\189\246\218\149\150\150\150\231\223{\239\189\227\028\199]E\008\025\244\150t\173Y\136\230\243\249\210|>\255\234\151_~\025+\172\223\209\209\145\175\171\171\219a4\0269\142\227T\000`r\185\028!\132(XUU&\157N\167\147\201\164\219b\177\224\250\250znaa\225w\022\139\229x(\020\250K\225\231\131\131\131\231\000\224\220\215\004\159\028\137D\000\000\212\215_\127\029\000\160\031\000\006\254\019\029Z(\020\202\003\000477\127\207\225p\252\166\177\177Q\181Z\1738\030\143\195\210\210\210\146,\203\229X\146\164\242\209\209\209\209\178\178\178\185\146\146\146{\246\237\219\183\164iZfpp\176\167\181\181u'\165\212\172;\135a\024\230\006\210\164\148\018J)\185\153=@\0081\250Q\188-\006\133\016\130\008!\020!D\244_\174\216l\182\246\221\187w\171~\191\223\1381.\155\157\157\157\027\025\025\201\000\192[8\151\203\245D\034\145\023\157N\231\210\254\253\251\139\013\006\195\182\199\030{lj\251\246\237\230D\034q\028\000\180B\143\188\014\220(\165\1482.\151+YQQaq\185\092[y\158\207\158?\127~i``\192\153N\167O!}\176\241#\175\215\219s\240\224A\226v\187\139\004A\184\167\168\168\136\008\130\144\221\008\196V&\1471\167R)\148\205fg'''\211\189\189\189\248\242\229\203\175(\138\018B>\159\207044\164\180\183\183?e\179\217~\217\220\220\172\236\221\187\151l\222\188\217%\008\002\139\016b\214\155^_YY\209\166\167\167\227\003\003\003\204\133\011\023\184T*\0218{\246\236\031\001\128\249\151\001GUU\213.\187\221\254\003}\192q\199{\220\175cE\010\003\142T*\245\231h4z\233\210\165K\225\213\003\142\213#&\013\000\160\169\169\233I=`\213\013\194\237bB\008\253\244\211O{o\214\245+\242\2238\228\251\223\026\179\222\149\187\242\127(\127\007\207\213\178^d\182\2164\000\000\000\000IEND\174B`\130",
		perf = "\137PNG\013\010\026\010\000\000\000\013IHDR\000\000\0000\000\000\0000\008\006\000\000\000W\002\249\135\000\000\012\138IDATx\218\237Y{L[W\154\255\206\185\247\250\130\223\006ll\199\001\0024\005\018\008\198\004\018\150@\030\128P\164MZ\165WQw\167\157G\211H;;\154\174F\170\186Jwe\028\173:\171]\141\1823\026M\210\180\157\149\170}\180u\210Q3\234\0065\155\130\0217\013\009\134\129fB\000\175\237&\128kLl\019\027\252\184\247\220\179\127\172\169H\154\164I\155\217dw\250\251\239^\217\231\252\190\231\253\030\000\223\226[\252q\003\221\238egg'\251(\146\245x<\210]\127\208\217\217\201RJ\241\163\170mJ)\190U\185_<\008\130\192\184\221n\009!\004\013\013\013\2518\142C\000 J\146\132X\246\225\024D\146$\200\223\205\138\162H\017B'\000@\206s%_\184\144\211\233\196.\151Knii\017\170\171\1717\235t\186=\026\141FWPP SJ1B\232ai\028\016B4\147\201\160T*\181\152L&\223\159\154\154\026\026\026\026zo\1333\002\000\012\000\242\174]\187\254\188\168\168\168o\203\150-\210\246\237\219\137\217l6\023\022\0222\012\195 J\233\195\009P\132\128R*'\147I9\026\141\206\159={\022\127\242\201'\144H$\250\250\251\251\223\006\000\140\028\014\135\146\2278\161\177\177\241\144 \008\146\197b\209q\028g\214j\181\012B\0080\198\240\144\005\000B\008$\147I\153\016\242\249\236\236\236\141\019'N\224\145\145\145WDQt\179*\149j\141\193`8\212\222\222\158\219\180iS%\198X\153J\165 \157NSJ\233C#\191\026\024c\224y\030\169\213j\171\209h\212\135\195\225\192\204\204\204\161D\034q\142ihhx\190\171\171kmSS\147\137\231\249bI\146\168(\138(\031\031\232Q\000\000 J)\146eY\022E\145\229y>\2030L8\028\0143,\000\252\184\166\166f\193`0\152\001\000\169\213j\196q\028A\008\209?\164k\172\004\233}\0044\018E\145I&\147`4\026\205uuu\2413g\206\252\152U*\149\225\162\162\034\163\201d\226\162\209h\238\234\213\171\215\019\137\004\131\016\194\127\008!\242>\205!\132d\134a\200\189\146\167\148\202z\189\158h4\154b\163\209\168\136F\163\006\149J\021f\001\128gY\022\171T*\008\004\002\1777\222x#\020\010\133\210\012\195P\250\224\002\000\253\015\015\202\229\207\188\2060\012K)U\221\163\197\016!\004UTT\020\0308p\000UTT\152\021\010\005\006\000\158\005\000\154\191\128d2\025\240\251\253\204\192\192\192w\211\233td\229\226\007\161x\000`\000 \011\000\208\212\212\180\141\016\018\027\027\027\155\190\195\249\171\223a\000\160\133\133\133\165;v\2368\145\201d\000\000H>6({\139\169\024\165R)j\181\218\092&\147\017\031\148\001(\165\008!$\237\219\183\175\141\2278G:\157vf\179\217\183\199\198\198~\148\255P\202\183\198\199\010dYF\024c\170\213jsJ\165R\164\1482\171\227\007\223\250'\1401\165\148\162\187\021{\247\003A\016\152\190\190>\228p8\004\141F\243Z{{\251\011\130 L\151\151\151\215\214\215\215\239\234\235\235[]<\162\149\212\157w7n\133\155,\203\024cLo\021\244\027\0219\157\157\157\172\199\227\145\001@\190\147\251\026\012\006\236r\185\196\221\187w\219\235\234\234\180{\247\238E\146$U\133B!b2\153\154\092.\215\153\206\206N\012\000\232\224\193\131\236\232\232\168\150\231\249\151\010\011\011\027dY\230DQ|\127aa\225h2\153\196\171\020{\147\127}-8\157N\236\241x\164\188\249ow\014r:\157\232\216\177c\226SO=u\160\177\177q[KK\203\178B\161\176\021\020\020\020\219\237\246\207+**\158\216\181k\215\254\217\217YF\016\132\130c\199\142\137\000p`\227\198\141\207>\243\2043k\159~\250iKYY\217_\171T\170\158T*\181\004\000L>3\162o\034\000\002\000\228r\185\228\214\214\214\239455\213\000\128|\155\030\002\185\092.hnn\254\161Z\173~\169\189\189]\183v\237\2182\158\231\017\199q\216f\179\217\218\219\2199\149J\245J.\151S\030?~<\253\220s\207\021m\220\184q\221\142\029;\022{zz,]]]\010\163\209\152c\024F\137\016\186mR\196_\195\1671\000\208\189{\247\030())\249yqq\241\171O<\241Dq\190\217\192\171\211\166\195\225`\138\139\139\255\210n\183\1997l\216`\227y\1900\022\139-\165R)\209d2\149\180\180\180\148\150\151\151\223\176X,O\155L&\213\242\242\242\207\154\155\155\255\164\190\190^M\0081$\018\009qiiIC\008ac\177\216m3\202}\009p\240\224A\238\221w\223\149\219\218\218~RUU\245\210\179\207>;\182{\247n3\000\252KUU\213Z\167\211\009\000\128W\132\212\233t?\217\185sg|\219\182mk8\1423\004\002\001\255\217\179g\175LOOO'\147\201\164R\1694;\028\014\249\177\199\030\251~SS\211Q\139\197\210\218\209\209\161\180\217l\214\0277n|~\242\228\201\092$\018\249\015Y\150\189\165\165\165\133\012\195\144[\227\224~\004@\175\191\254\186\136\016BF\163qkss3jkk\219\210\219\219\171\171\174\174^o\177X\202\092.\151\220\221\221]\232v\187IKK\203\139V\171\245Gmmm\165UUU\214T*\021?w\238\092j`` 900\144\012\004\002\215(\165\092}}\189\177\167\167'\211\208\208\176\190\189\189}\169\164\164\1642\157N'\134\135\135\227###\129+W\174\252\208\231\243]%\1320\171|\136~\169#\187\147\187\004\002\001\012\000PYY\137B\161PQYY\217\011\1556mZ\187~\253zF\173V\023J\146\180\166\163\163\227\146$I/\235t\186\191\253\224\131\015|uuuj\187\221^\189m\219\182\148\197b1\199\227q\233\179\207>\155\009\004\002\161+W\174\252](\020zY\171\213\150=\254\248\227)\179\217lS(\020\154\218\218\218\184^\175/%\132\136\023.\092\184|\250\244i\235\194\194\194\149\201\201\201\164\211\233d\143\0289r\219LwG\001dYF\008!\002\000\004\000\192\231\243AGG\199n\147\201\244\189\238\238\2389\131\193`\163\148\130R\169\228jjj\202\018\137D\193\204\204\204/\186\186\186~\174V\171\183VUUmokk\211h4\026\189\223\239\191t\242\228Im8\028\254\245\249\243\231G\028\014\199?|\250\233\167\239\181\181\181M\216l\182&\171\213\170\167\148\234\211\233\180<777\249\225\135\031\154\174^\189\250\027\175\215\251\178 \008\204\225\195\135%\163\209\008\247,\000\207\243\012B\136677w\177,\219\203\243|\004cLKJJ\214\180\180\180\196\214\173[W\147\205fQ,\022\139I\146\132\180Zm\177\221n\023\131\193\224u\191\223\127\216b\177$\028\014\007Q\169T\150l6;\239\245z\153\241\241\241\145x<>\229t:\217\183\222z+\180\176\176p\234\212\169S\142={\246\2485\026M\013!\132F\034\145\224G\031}D\194\225\240\201\193\193\193\191\017\004\001\185\221nz\183\150\150\189\205\136\005SJ3\173\173\173\173V\171\245\213\218\218ZmQQ\017[PP\192\232\245\250\164\221nWe2\025>\016\008\004\252~\255\178$I\169-[\182\148[\173V\219\246\237\219\151\026\027\027\019j\181Z[YYY\177\188\188\156\244x<\225K\151.\253\158\016\242W\227\227\227\209'\159|\146\013\006\131\243\213\213\213/LMM\253lbb\162\167\162\162\034\007\000\203\023/^\148\198\199\199\223\211h4?\165\148\202}}}\240U\181\024{K\213GeY\198333\162\205f\1712\155\205\134\131\007\015\198\172Vk9\19504\151\203\233(\165\252\212\212\212\245\209\209\209\208\248\248\184\152\201d\138\010\010\010\174\151\148\148h\171\170\170\170\016B9\000\224(\165r0\024\156<}\250\180\209\239\247O\015\013\013E{{{y\151\203\149\237\237\237\229\251\251\251\1516o\222<699\185\189\174\174n4\153L2\195\195\195\230\137\137\137\203\163\163\163\153K\151.q>\159O\252\170r\230\142Y\136\016\002\132\016&\151\203A&\147\193\132\016\1401\206!\132\022\162\209h\252\226\197\139\186H$\242\189\249\249\249_\140\140\140\176\019\019\019\179\162(.\021\022\022*\000@\190v\237Zh``\160 \022\139\189/I\210/\157N'\219\223\223\159\005\000\232\239\239\207vvv\178\178,\255[0\024\252\244\181\215^[\247\230\155o\234\034\145\200O1\198\253\130 0y\242_\009\2466\253\167\172\209h\020\132\144@8\028\158;z\244\168\165\168\168h\145\2278\142\016B%I\034\179\179\179\218\185\185\185~\132P\220\227\241\252\187\213j\021\189^\239_h4\026\149V\171U-//\167}>_bzz\250?\213j\245\203\167N\157\034>\159\239\166{L&\019\245x<\139j\181\250#\000@\146$\013~\252\241\199\191Z=\243\185_\001V\170PY\175\215\243###\231\009!?\136D\034\221\024\227y\132\016\166\148\202\148R\005!\004\013\015\015\2553\000\016\167\211\201\186\092\174\227\221\221\221\223/--\149\244z\253\127E\163\209\204\197\139\023\205^\175\247\215\193`\144\228\139\190\155\198\130y\146\200\227\241\028\001\128#\171\202nr?\031WvUi\138\242c\012\180\234\176\223\001\192\239\238v\128\203\229\034\130 0sss\175\014\013\013\245\205\204\204(\150\150\150T\241x\252\151\012\195|\254\021\026\165\130 0\243\243\243\200d2\209\187\145W(\020,\165\020\173\148\2127\149\211\178,\211\149\206\012c,\221\184q#\237v\1871\000\128\195\225\192j\181\154\166R\169\155\130i\149\143\210<\193\211\132\016_0\024\220\015\000\235\189^\239\223\003\000\248\253\254\187j\240\030\220\133\190\243\206;\204\243\207?\191\1401\150Vf\183y\206\136\149eY\206\229r2\000 \142\227$\158\231\0216\155\173q\255\254\253\003\130 (\234\234\234\228p8\252\165L\224p8\184\213\207\241x\028\009\130\176\232v\187\143%\147I\214\233t*._\190\012\006\131\225k\183u\022\139\133\014\013\0131\251\247\239\207\214\213\2135\022\020\020(\020\010\133\004\0008\155\205\202\178,\139\172$Ixqqq1\026\141\150\169\213jv\195\134\013\138\133\133\133\127R\171\213/\186\221\238\211\247s\161\219\237\254\034\137\245\247\247?\176\025okkk\183\209h\252\199\250\250zI\163\209\176\225p\024b\177X,\147\201\148\178\201d\178trrr\178\164\164d\174\168\168\200\186s\231\206\024!$u\238\220\185C\029\029\029M\132\016\229\234\158\245^&\008+\025\225\001\204\1430BhY\171\213\246l\221\186U\234\236\236\212\176,[2;;;w\249\242\229\020\000\188\205f\179\217C\030\143\231\005\147\201\020\235\234\2342p\028\183\190\183\183\247jmm\1732\018\137\188\008\000\228v\173\220\255\210l\148RJ\177\217l\142\150\151\151\171\205f\243Z\158\231\211^\1757688hZ\092\092|\015\229{\219g\026\026\026\014\237\217\179G.++\211\171T*\171^\175\151U*U\250QXl\164R)e\034\145@\233tz6\020\010-\1588q\130\029\027\027{E\020E7r8\028\156\207\231\019{zz\254L\171\213\030nmm\021w\236\216!\175Y\179\198\172R\169\152|\254\127\168\227\245\229\229er\237\218\181\240\224\224 >\127\254\188\034\145H8\207\1569\243\175\000\128\191\180\224\168\172\172\220\172\211\233\2544\191\224\160\223\164\241\127@\144W\022\028\137D\226\183\129@\224\194\133\011\023\142\175^p\172^1\017\000\000\187\221\190\015c\140\000@zD\214c\172,\203ttt\244\196\173\092\255\207/\249\254\127\173Y\191\197\183\248#\196\127\003\029\2136\176\022\249\227\092\000\000\000\000IEND\174B`\130",
	}
	K.lxIcons = {}
	function K.lxIcon(name)
		if K.lxIcons[name] then return K.lxIcons[name] end
		local data = LX_PNG[name]
		if not data then return nil end
		K.ensureFolder("LX/ui")
		local path = "LX/ui/lx_" .. name .. ".png"
		writefile(path, data)
		local ok, id = pcall(getcustomasset, path)
		if ok and type(id) == "string" and id ~= "" then
			K.lxIcons[name] = id
			UIIcon["lx_" .. name] = id
			return id
		end
		return nil
	end
	for name in pairs(LX_PNG) do task.spawn(K.lxIcon, name) end
end

do
	function K.trim(s) return (tostring(s or ""):gsub("^%s+", ""):gsub("%s+$", "")) end

	function K.copy(text, label)
		text = tostring(text)
		if Services.setClipboard then
			pcall(Services.setClipboard, text)
			pcall(notify, "Copied " .. (label or "text"))
			return true
		end
		pcall(notify, "Your executor has no setclipboard")
		return false
	end

	function K.eval(src)
		if not ALL_KNOWING then return nil, "Expressions are available only in LX All Knowing" end
		local ls = envFn("loadstring") or loadstring
		if typeof(ls) ~= "function" then return nil, "no loadstring" end
		local fn, err = ls("return " .. tostring(src))
		if not fn then fn, err = ls(tostring(src)) end
		if not fn then return nil, err end
		local ok, res = pcall(fn)
		if not ok then return nil, res end
		return res
	end

	local KEYWORDS = {}
	for _, w in ipairs({ "and", "break", "do", "else", "elseif", "end", "false", "for", "function", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while", "continue" }) do KEYWORDS[w] = true end

	local function num(n)
		if n ~= n then return "0/0" end
		if n == math.huge then return "math.huge" end
		if n == -math.huge then return "-math.huge" end
		if n == math.floor(n) and math.abs(n) < 1e15 then return string.format("%d", n) end
		local s = string.format("%.6g", n)
		if tonumber(s) ~= n then s = string.format("%.17g", n) end
		return s
	end

	local function str(s)
		return '"' .. s:gsub('[%c"\\]', function(c)
			if c == "\n" then return "\\n" end
			if c == "\t" then return "\\t" end
			if c == '"' then return '\\"' end
			if c == "\\" then return "\\\\" end
			return string.format("\\%03d", c:byte())
		end) .. '"'
	end

	local function instPath(inst)
		if inst == game then return "game" end
		local ok, p = pcall(pathOf, inst)
		if ok and type(p) == "string" and p ~= "" then return p end
		return "nil"
	end

	local ser
	ser = function(v, depth, indent, seen)
		depth = depth or 3
		indent = indent or ""
		seen = seen or {}
		local t = typeof(v)
		if t == "nil" then return "nil" end
		if t == "boolean" then return tostring(v) end
		if t == "number" then return num(v) end
		if t == "string" then return str(v) end
		if t == "Instance" then return instPath(v) end
		if t == "Vector3" then return string.format("Vector3.new(%s, %s, %s)", num(v.X), num(v.Y), num(v.Z)) end
		if t == "Vector2" then return string.format("Vector2.new(%s, %s)", num(v.X), num(v.Y)) end
		if t == "Vector3int16" then return string.format("Vector3int16.new(%d, %d, %d)", v.X, v.Y, v.Z) end
		if t == "Vector2int16" then return string.format("Vector2int16.new(%d, %d)", v.X, v.Y) end
		if t == "CFrame" then
			local c = { v:GetComponents() }
			for i = 1, #c do c[i] = num(c[i]) end
			if v.Rotation == CFrame.identity then return string.format("CFrame.new(%s, %s, %s)", c[1], c[2], c[3]) end
			return "CFrame.new(" .. table.concat(c, ", ") .. ")"
		end
		if t == "Color3" then return string.format("Color3.fromRGB(%d, %d, %d)", math.floor(v.R * 255 + 0.5), math.floor(v.G * 255 + 0.5), math.floor(v.B * 255 + 0.5)) end
		if t == "UDim" then return string.format("UDim.new(%s, %s)", num(v.Scale), num(v.Offset)) end
		if t == "UDim2" then return string.format("UDim2.new(%s, %s, %s, %s)", num(v.X.Scale), num(v.X.Offset), num(v.Y.Scale), num(v.Y.Offset)) end
		if t == "EnumItem" then return tostring(v) end
		if t == "Enum" then return "Enum." .. tostring(v) end
		if t == "BrickColor" then return string.format("BrickColor.new(%s)", str(v.Name)) end
		if t == "NumberRange" then return string.format("NumberRange.new(%s, %s)", num(v.Min), num(v.Max)) end
		if t == "Rect" then return string.format("Rect.new(%s, %s, %s, %s)", num(v.Min.X), num(v.Min.Y), num(v.Max.X), num(v.Max.Y)) end
		if t == "Ray" then return string.format("Ray.new(%s, %s)", ser(v.Origin), ser(v.Direction)) end
		if t == "NumberSequence" then
			local parts = {}
			for _, k in ipairs(v.Keypoints) do parts[#parts + 1] = string.format("NumberSequenceKeypoint.new(%s, %s, %s)", num(k.Time), num(k.Value), num(k.Envelope)) end
			return "NumberSequence.new({ " .. table.concat(parts, ", ") .. " })"
		end
		if t == "ColorSequence" then
			local parts = {}
			for _, k in ipairs(v.Keypoints) do parts[#parts + 1] = string.format("ColorSequenceKeypoint.new(%s, %s)", num(k.Time), ser(k.Value)) end
			return "ColorSequence.new({ " .. table.concat(parts, ", ") .. " })"
		end
		if t == "function" then
			local ok, name = pcall(function() return debug.info(v, "n") end)
			return "function() end" .. ((ok and name and name ~= "") and (" --[[" .. name .. "]]") or "")
		end
		if t == "table" then
			if seen[v] then return "{}" end
			if depth <= 0 then return "{...}" end
			seen[v] = true
			local n = #v
			local parts = {}
			local inner = indent .. "\t"
			for i = 1, n do parts[#parts + 1] = inner .. ser(v[i], depth - 1, inner, seen) end
			local keys = {}
			for k in pairs(v) do
				if not (type(k) == "number" and k >= 1 and k <= n and k == math.floor(k)) then keys[#keys + 1] = k end
			end
			table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
			for _, k in ipairs(keys) do
				local key
				if type(k) == "string" and k:match("^[%a_][%w_]*$") and not KEYWORDS[k] then key = k
				else key = "[" .. ser(k, depth - 1, inner, seen) .. "]" end
				parts[#parts + 1] = inner .. key .. " = " .. ser(v[k], depth - 1, inner, seen)
			end
			seen[v] = nil
			if #parts == 0 then return "{}" end
			return "{\n" .. table.concat(parts, ",\n") .. "\n" .. indent .. "}"
		end
		local ok, s = pcall(tostring, v)
		return t .. "(" .. (ok and s or "?") .. ")"
	end
	K.ser = ser

	function K.readJson(path, default)
		if not isfile(path) then return default end
		local ok, data = pcall(readfile, path)
		if not ok then return default end
		local okD, t = pcall(function() return Services.HttpService:JSONDecode(data) end)
		if not okD then okD, t = pcall(function() return game:GetService("HttpService"):JSONDecode(data) end) end
		return okD and t or default
	end

	function K.writeJson(path, t)
		local wf = writefile
		pcall(K.ensureFolder, path:match("^(.*)/[^/]+$") or "LX")
		local ok, data = pcall(function() return game:GetService("HttpService"):JSONEncode(t) end)
		return ok and pcall(wf, path, data)
	end

	K.meta = { at = -1e9, tags = {}, tagList = {}, attrs = {}, attrList = {} }
	function K.scanMeta(force)
		local M = K.meta
		if not force and os.clock() - M.at < 15 then return M end
		local CS = game:GetService("CollectionService")
		local tags, attrs = {}, {}
		local ok, all = pcall(game.GetDescendants, game)
		if ok then
			for i, inst in ipairs(all) do
				local okT, tg = pcall(CS.GetTags, CS, inst)
				if okT then for _, t in ipairs(tg) do tags[t] = (tags[t] or 0) + 1 end end
				local okA, at = pcall(inst.GetAttributes, inst)
				if okA then for k in pairs(at) do attrs[k] = (attrs[k] or 0) + 1 end end
				if i % 4000 == 0 then task.wait() end
			end
		end
		local tl, al = {}, {}
		for k in pairs(tags) do tl[#tl + 1] = k end
		for k in pairs(attrs) do al[#al + 1] = k end
		table.sort(tl, function(a, b) return a:lower() < b:lower() end)
		table.sort(al, function(a, b) return a:lower() < b:lower() end)
		M.tags, M.attrs, M.tagList, M.attrList, M.at = tags, attrs, tl, al, os.clock()
		return M
	end

	function Delve.search(text)
		if UI.explorerFilter then UI.explorerFilter.Text = text or "" end
		pcall(openPane, Panes.explorer)
	end

	function Delve.goTo(inst)
		if not (inst and inst.Parent) then return end
		pcall(reveal, inst)
		pcall(afterChange, { inst })
		pcall(openPane, Panes.explorer)
	end

	local U = {}
	K.ui = U

	function U.page(parent)
		local scroll = scroller(parent)
		scroll.Size = UDim2.fromScale(1, 1)
		scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
		new("UIPadding", {
			PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 14),
			PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 14),
		}, scroll)
		new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, scroll)
		local n = 0
		return scroll, function() n += 1 return n end
	end

	function U.box(parent, order)
		local f = new("Frame", {
			BackgroundColor3 = Configuration.Theme.Input, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = order, ZIndex = 3,
		}, parent)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, f)
		stroke(f, Configuration.Theme.Border, 1)
		new("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4) }, f)
		new("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, f)
		return f
	end

	function U.clear(box)
		for _, c in ipairs(box:GetChildren()) do
			if c:IsA("GuiObject") then c:Destroy() end
		end
	end

	function U.text(parent, order, text, opts)
		opts = opts or {}
		return new("TextLabel", {
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, opts.height or 20), LayoutOrder = order, ZIndex = 3,
			AutomaticSize = opts.wrap and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
			Font = opts.code and Enum.Font.RobotoMono or (opts.bold and Enum.Font.SourceSansBold or Enum.Font.SourceSans), TextSize = opts.size or 14,
			TextColor3 = opts.dim and Configuration.Theme.Dim or Configuration.Theme.Text, Text = text, TextWrapped = opts.wrap == true,
			TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = opts.wrap and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd,
			RichText = opts.rich == true,
		}, parent)
	end

	function U.item(parent, order, title, sub, onClick, opts)
		opts = opts or {}
		local T = Configuration.Theme
		local H = sub and touchH(36) or touchH(24)
		local b = new("TextButton", {
			Size = UDim2.new(1, 0, 0, H), BackgroundColor3 = T.MenuHover, BackgroundTransparency = 1, BorderSizePixel = 0,
			AutoButtonColor = false, Text = "", LayoutOrder = order, ZIndex = 3,
		}, parent)
		new("UICorner", { CornerRadius = UDim.new(0, 4) }, b)
		local right = 4
		local actions = opts.actions or {}
		for i = #actions, 1, -1 do
			local a = actions[i]
			local w = a[3] or 60
			local ab = new("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -right, 0.5, 0), Size = UDim2.fromOffset(w, touchH(20)),
				BackgroundColor3 = T.Header, BorderSizePixel = 0, AutoButtonColor = false, ZIndex = 4,
				Font = Enum.Font.SourceSans, TextSize = 13, TextColor3 = T.Text, Text = a[1],
			}, b)
			new("UICorner", { CornerRadius = UDim.new(0, 4) }, ab)
			watchHover(ab)
			ab.MouseEnter:Connect(function() ab.BackgroundColor3 = T.Accent; ab.TextColor3 = T.AccentText end)
			ab.MouseLeave:Connect(function() ab.BackgroundColor3 = T.Header; ab.TextColor3 = T.Text end)
			ab.MouseButton1Click:Connect(function() task.spawn(a[2]) end)
			right += w + 4
		end
		local lx = 6
		if opts.icon then
			local ic = new("ImageLabel", {
				Size = UDim2.fromOffset(16, 16), Position = UDim2.new(0, 6, 0.5, -8), BackgroundTransparency = 1, ZIndex = 4,
			}, b)
			if typeof(opts.icon) == "Instance" then pcall(applyIcon, ic, opts.icon) else pcall(applyClassIcon, ic, opts.icon) end
			lx = 28
		end
		new("TextLabel", {
			BackgroundTransparency = 1, Position = UDim2.fromOffset(lx, sub and 2 or 0), Size = UDim2.new(1, -(lx + right + 4), 0, sub and 18 or H),
			Font = opts.code and Enum.Font.RobotoMono or Enum.Font.SourceSans, TextSize = 14, TextColor3 = opts.color or T.Text, Text = title,
			TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 4,
		}, b)
		if sub then
			new("TextLabel", {
				BackgroundTransparency = 1, Position = UDim2.fromOffset(lx, 18), Size = UDim2.new(1, -(lx + right + 4), 0, 16),
				Font = Enum.Font.RobotoMono, TextSize = 12, TextColor3 = T.Dim, Text = sub,
				TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 4,
			}, b)
		end
		watchHover(b)
		b.MouseEnter:Connect(function() b.BackgroundTransparency = 0 end)
		b.MouseLeave:Connect(function() b.BackgroundTransparency = 1 end)
		if onClick then b.MouseButton1Click:Connect(function() task.spawn(onClick) end) end
		return b
	end

	function U.code(parent, order, placeholder, height)
		local box, holder = Delve.apps.input(parent, order, placeholder, height or 140)
		return box, holder
	end

	function U.poll(win, dt, fn)
		task.spawn(function()
			while win.frame and win.frame.Parent do
				if win.frame.Visible then pcall(fn) end
				task.wait(dt)
			end
		end)
	end
end

task.spawn(function()
	local t0 = os.clock()
	while not Delve.apps and os.clock() - t0 < 30 do task.wait(0.1) end
	local Apps = Delve.apps
	if not Apps then return end
	local CS = game:GetService("CollectionService")
	local Http = game:GetService("HttpService")
	Delve.menuHooks = Delve.menuHooks or {}
	Delve.extraMenu = function(sel, list, item, sep)
		local multi = #list > 1
		sep()
		item("Copy Name", nil, true, function()
			local names = {}
			for _, i in ipairs(list) do names[#names + 1] = i.Name end
			K.copy(table.concat(names, "\n"), "name")
		end)
		item("Copy Class Name", nil, not multi, function() K.copy(sel.ClassName, "class name") end)
		item("Copy As Variable", nil, not multi, function()
			local n = sel.Name:gsub("[^%w_]", "")
			if n == "" or n:match("^%d") then n = "obj" .. n end
			K.copy("local " .. n .. " = " .. K.ser(sel), "variable")
		end)
		item("Copy Tags", nil, true, function()
			local out = {}
			for _, i in ipairs(list) do for _, t in ipairs(CS:GetTags(i)) do out[#out + 1] = t end end
			K.copy(table.concat(out, ", "), "tags")
		end)
		item("Copy Attributes", nil, not multi, function() K.copy(K.ser(sel:GetAttributes(), 3), "attributes") end)
		item("Select Parent", nil, sel.Parent ~= nil and sel.Parent ~= game, function() Delve.goTo(sel.Parent) end)
		item("Select Same Class", nil, not multi, function() Delve.search("class:" .. sel.ClassName) end)
		item("Tag Editor", nil, true, function() Delve.tags.open() end)
		if ALL_KNOWING and (sel:IsA("RemoteEvent") or sel:IsA("RemoteFunction") or sel:IsA("UnreliableRemoteEvent")) then
			item("Spy This Remote", nil, true, function() Delve.spy.open(); Delve.spy.watch(sel) end)
			item("Block This Remote", nil, true, function() Delve.spy.block(sel, true) end)
		end
		for _, fn in ipairs(Delve.menuHooks) do pcall(fn, sel, list, item, sep) end
	end

	do
		local Tags = {}
		Delve.tags = Tags

		local function picked()
			local out = {}
			for _, i in ipairs(State.selection) do if i and i.Parent ~= nil then out[#out + 1] = i end end
			if #out == 0 and State.selected and State.selected.Parent ~= nil then out[1] = State.selected end
			return out
		end

		local function quoteTag(t) return t:find("%s") and ('"' .. t .. '"') or t end

		local function parseValue(text, current)
			local t = K.trim(text)
			local kind = typeof(current)
			if kind == "string" then return text end
			if kind == "number" then return tonumber(t) end
			if kind == "boolean" then return t:lower() == "true" end
			if t == "true" then return true end
			if t == "false" then return false end
			if tonumber(t) then return tonumber(t) end
			local v, err = K.eval(t)
			if v == nil and err then return text end
			return v
		end

		function Tags.selectTagged(tg)
			local list = {}
			for _, i in ipairs(CS:GetTagged(tg)) do
				if i.Parent ~= nil then list[#list + 1] = i end
			end
			if #list == 0 then notify("Nothing is tagged " .. tg) return end
			for _, i in ipairs(list) do reveal(i) end
			afterChange(list)
			notify(string.format("Selected %d instance(s) tagged %s", #list, tg))
		end

		local function build()
			local win = Apps.window("tageditor", "Tag Editor")
			local scroll, nextOrder = K.ui.page(win.pane.body)
			local head = K.ui.text(scroll, nextOrder(), "Nothing selected", { bold = true, size = 15, height = 24 })

			Apps.title(scroll, nextOrder(), "Tags")
			local tagBox = K.ui.box(scroll, nextOrder())
			local addRow = Apps.row(scroll, nextOrder())
			local addInput, addHolder = Apps.input(addRow, 1, "Tag name")
			addHolder.Size = UDim2.new(1, -190, 0, touchH(26))
			local addBtn = Apps.button(addRow, "Add Tag", 2)
			local selBtn = Apps.button(addRow, "Select Tagged", 3)

			Apps.title(scroll, nextOrder(), "Attributes")
			local attrBox = K.ui.box(scroll, nextOrder())
			local attrRow = Apps.row(scroll, nextOrder())
			local attrName, an = Apps.input(attrRow, 1, "Name")
			an.Size = UDim2.new(0.35, -4, 0, touchH(26))
			local attrVal, av = Apps.input(attrRow, 2, "Value")
			av.Size = UDim2.new(0.65, -60, 0, touchH(26))
			local setBtn = Apps.button(attrRow, "Set", 3)

			Apps.title(scroll, nextOrder(), "All Tags")
			local allRow = Apps.row(scroll, nextOrder())
			local allFilter, af = Apps.input(allRow, 1, "Filter tags")
			af.Size = UDim2.new(1, -90, 0, touchH(26))
			local rescan = Apps.button(allRow, "Rescan", 2)
			local allBox = K.ui.box(scroll, nextOrder())
			local status = K.ui.text(scroll, nextOrder(), "", { dim = true, wrap = true, size = 13 })

			local lastSig = ""
			local function signature(list)
				local parts = {}
				for _, i in ipairs(list) do
					parts[#parts + 1] = tostring(i)
					local ok, tg = pcall(CS.GetTags, CS, i)
					if ok then parts[#parts + 1] = table.concat(tg, ",") end
					local okA, at = pcall(i.GetAttributes, i)
					if okA then
						local keys = {}
						for k, v in pairs(at) do keys[#keys + 1] = k .. "=" .. K.ser(v, 1) end
						table.sort(keys)
						parts[#parts + 1] = table.concat(keys, ",")
					end
				end
				return table.concat(parts, "|")
			end

			local renderSelection
			renderSelection = function(force)
				local list = picked()
				local sig = signature(list)
				if sig == lastSig and not force then return end
				lastSig = sig
				if #list == 0 then head.Text = "Nothing selected"
				elseif #list == 1 then head.Text = list[1].ClassName .. "  " .. list[1]:GetFullName()
				else head.Text = #list .. " instances selected" end
				K.ui.clear(tagBox)
				local counts, order = {}, {}
				for _, i in ipairs(list) do
					for _, tg in ipairs(CS:GetTags(i)) do
						if not counts[tg] then counts[tg] = 0; order[#order + 1] = tg end
						counts[tg] += 1
					end
				end
				table.sort(order, function(a, b) return a:lower() < b:lower() end)
				for n, tg in ipairs(order) do
					local sub = #list > 1 and string.format("on %d of %d", counts[tg], #list) or nil
					K.ui.item(tagBox, n, tg, sub, function() Delve.search("tag:" .. quoteTag(tg)) end, {
						actions = {
							{ "Select All", function() Tags.selectTagged(tg) end, 70 },
							{ "Remove", function()
								for _, i in ipairs(list) do pcall(CS.RemoveTag, CS, i, tg) end
								renderSelection(true)
							end, 60 },
						},
					})
				end
				K.ui.clear(attrBox)
				local target = list[1]
				if not target then return end
				local attrs = target:GetAttributes()
				local keys = {}
				for k in pairs(attrs) do keys[#keys + 1] = k end
				table.sort(keys, function(a, b) return a:lower() < b:lower() end)
				for n, k in ipairs(keys) do
					local v = attrs[k]
					local row = new("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, touchH(26)), LayoutOrder = n, ZIndex = 3 }, attrBox)
					new("TextLabel", {
						BackgroundTransparency = 1, Size = UDim2.new(0.35, -4, 1, 0), ZIndex = 3, Font = Enum.Font.SourceSans, TextSize = 14,
						TextColor3 = Configuration.Theme.Text, Text = k .. "  (" .. typeof(v) .. ")", TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
					}, row)
					local valBox, holder = Apps.input(row, 1, "")
					holder.Position = UDim2.new(0.35, 0, 0, 0)
					holder.Size = UDim2.new(0.65, -70, 1, 0)
					valBox.Text = typeof(v) == "string" and v or (typeof(v) == "number" or typeof(v) == "boolean") and tostring(v) or K.ser(v, 2)
					valBox.FocusLost:Connect(function()
						local nv = parseValue(valBox.Text, v)
						for _, i in ipairs(list) do pcall(i.SetAttribute, i, k, nv) end
						renderSelection(true)
					end)
					local del = Apps.button(row, "Remove", 2)
					del.AnchorPoint = Vector2.new(1, 0)
					del.Position = UDim2.new(1, 0, 0, 1)
					del.MouseButton1Click:Connect(function()
						for _, i in ipairs(list) do pcall(i.SetAttribute, i, k, nil) end
						renderSelection(true)
					end)
				end
			end

			local function renderAll(force)
				local M = K.scanMeta(force)
				K.ui.clear(allBox)
				local f = allFilter.Text:lower()
				local n = 0
				for _, tg in ipairs(M.tagList) do
					if f == "" or tg:lower():find(f, 1, true) then
						n += 1
						if n > 300 then break end
						K.ui.item(allBox, n, tg, M.tags[tg] .. " instance(s)", function() Delve.search("tag:" .. quoteTag(tg)) end, {
							actions = {
								{ "Select All", function() Tags.selectTagged(tg) end, 70 },
								{ "Add", function()
									for _, i in ipairs(picked()) do pcall(CS.AddTag, CS, i, tg) end
									renderSelection(true)
								end, 44 },
							},
						})
					end
				end
				status.Text = string.format("%d tag(s) and %d attribute name(s) across the game.", #M.tagList, #M.attrList)
			end

			local function addTag()
				local tg = K.trim(addInput.Text)
				if tg == "" then return end
				local list = picked()
				if #list == 0 then status.Text = "Select something first." return end
				for _, i in ipairs(list) do pcall(CS.AddTag, CS, i, tg) end
				addInput.Text = ""
				K.meta.at = -1e9
				renderSelection(true)
			end
			addBtn.MouseButton1Click:Connect(addTag)
			addInput.FocusLost:Connect(function(enter) if enter then addTag() end end)
			selBtn.MouseButton1Click:Connect(function()
				local tg = K.trim(addInput.Text)
				if tg ~= "" then Tags.selectTagged(tg) end
			end)
			setBtn.MouseButton1Click:Connect(function()
				local name = K.trim(attrName.Text)
				if name == "" then status.Text = "Give the attribute a name." return end
				local text = attrVal.Text
				local v = tonumber(text) or (text == "true" and true) or (text == "false" and false) or nil
				if v == nil then
					local ev = K.eval(text)
					v = ev ~= nil and ev or text
				end
				for _, i in ipairs(picked()) do
					local ok, err = pcall(i.SetAttribute, i, name, v)
					if not ok then status.Text = tostring(err) end
				end
				renderSelection(true)
			end)
			rescan.MouseButton1Click:Connect(function() task.spawn(renderAll, true) end)
			allFilter:GetPropertyChangedSignal("Text"):Connect(function() renderAll(false) end)

			K.ui.poll(win, 0.3, function() renderSelection(false) end)
			task.spawn(renderAll, false)
			win.refresh = function() renderSelection(true); task.spawn(renderAll, false) end
			return win
		end

		function Tags.open()
			if not Tags.win then Tags.win = build() end
			Tags.win.show(52)
			Tags.win.refresh()
		end

		Apps.add({ name = "Tag Editor", icon = "Folder", fallback = "Folder", image = function() return K.lxIcon("tags") end, open = Tags.open })
	end

end)
