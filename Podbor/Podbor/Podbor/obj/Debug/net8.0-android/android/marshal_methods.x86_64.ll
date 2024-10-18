; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [165 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [330 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 48
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 164
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 53
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 117
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 70
	i64 225432268808147330, ; 5: Microcharts.Maui => 0x320e5743f385182 => 39
	i64 232391251801502327, ; 6: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 87
	i64 308826992458506653, ; 7: SkiaSharp.Extended.dll => 0x4492c836e8aa19d => 58
	i64 545109961164950392, ; 8: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 750875890346172408, ; 9: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 153
	i64 799765834175365804, ; 10: System.ComponentModel.dll => 0xb1956c9f18442ac => 106
	i64 849051935479314978, ; 11: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 12: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 75
	i64 1120440138749646132, ; 13: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 91
	i64 1121665720830085036, ; 14: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 15: System.Drawing.dll => 0x119be62002c19ebb => 112
	i64 1369545283391376210, ; 16: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 83
	i64 1433520707554318520, ; 17: SkiaSharp.Extended.UI.dll => 0x13e4e37d07f118b8 => 59
	i64 1476839205573959279, ; 18: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 124
	i64 1486715745332614827, ; 19: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 50
	i64 1513467482682125403, ; 20: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 163
	i64 1537168428375924959, ; 21: System.Threading.Thread.dll => 0x15551e8a954ae0df => 153
	i64 1556147632182429976, ; 22: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 23: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 68
	i64 1628611045998245443, ; 24: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 80
	i64 1735388228521408345, ; 25: System.Net.Mail.dll => 0x181556663c69b759 => 121
	i64 1743969030606105336, ; 26: System.Memory.dll => 0x1833d297e88f2af8 => 119
	i64 1767386781656293639, ; 27: System.Private.Uri.dll => 0x188704e9f5582107 => 131
	i64 1795316252682057001, ; 28: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 67
	i64 1835311033149317475, ; 29: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 30: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 87
	i64 1875417405349196092, ; 31: System.Drawing.Primitives => 0x1a06d2319b6c713c => 111
	i64 1881198190668717030, ; 32: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 33: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 51
	i64 1959996714666907089, ; 34: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1963507636676687784, ; 35: MimeKit => 0x1b3fc7cadde177a8 => 55
	i64 1972385128188460614, ; 36: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 142
	i64 1981742497975770890, ; 37: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 79
	i64 1983698669889758782, ; 38: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 39: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 40: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 111
	i64 2200176636225660136, ; 41: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 46
	i64 2262844636196693701, ; 42: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 75
	i64 2287834202362508563, ; 43: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 97
	i64 2302323944321350744, ; 44: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 78
	i64 2335503487726329082, ; 46: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 149
	i64 2337758774805907496, ; 47: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 134
	i64 2470498323731680442, ; 48: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 71
	i64 2497223385847772520, ; 49: System.Runtime => 0x22a7eb7046413568 => 140
	i64 2547086958574651984, ; 50: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 66
	i64 2602673633151553063, ; 51: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2632269733008246987, ; 52: System.Net.NameResolution => 0x2487b36034f808cb => 122
	i64 2656907746661064104, ; 53: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 42
	i64 2662981627730767622, ; 54: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2783046991838674048, ; 55: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 134
	i64 2895129759130297543, ; 56: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 57: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 91
	i64 3110390492489056344, ; 58: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 143
	i64 3289520064315143713, ; 59: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 77
	i64 3311221304742556517, ; 60: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 129
	i64 3325875462027654285, ; 61: System.Runtime.Numerics => 0x2e27e21c8958b48d => 138
	i64 3328853167529574890, ; 62: System.Net.Sockets.dll => 0x2e327651a008c1ea => 128
	i64 3344514922410554693, ; 63: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 93
	i64 3414639567687375782, ; 64: SkiaSharp.Views.Maui.Controls => 0x2f633c9863ffdba6 => 63
	i64 3429672777697402584, ; 65: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 53
	i64 3494946837667399002, ; 66: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 40
	i64 3522470458906976663, ; 67: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 88
	i64 3551103847008531295, ; 68: System.Private.CoreLib.dll => 0x31480e226177735f => 161
	i64 3567343442040498961, ; 69: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 70: System.Runtime.dll => 0x319037675df7e556 => 140
	i64 3638003163729360188, ; 71: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 41
	i64 3647754201059316852, ; 72: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 158
	i64 3655542548057982301, ; 73: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 40
	i64 3716579019761409177, ; 74: netstandard.dll => 0x3393f0ed5c8c5c99 => 160
	i64 3727469159507183293, ; 75: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3869221888984012293, ; 76: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 44
	i64 3890352374528606784, ; 77: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 51
	i64 3919223565570527920, ; 78: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 144
	i64 3933965368022646939, ; 79: System.Net.Requests => 0x369840a8bfadc09b => 125
	i64 3966267475168208030, ; 80: System.Memory => 0x370b03412596249e => 119
	i64 4073500526318903918, ; 81: System.Private.Xml.dll => 0x3887fb25779ae26e => 133
	i64 4073631083018132676, ; 82: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 49
	i64 4120493066591692148, ; 83: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 84: System.ComponentModel => 0x39a7562737acb67e => 106
	i64 4168469861834746866, ; 85: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 141
	i64 4187479170553454871, ; 86: System.Linq.Expressions => 0x3a1cea1e912fa117 => 117
	i64 4205801962323029395, ; 87: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 105
	i64 4306612231831054753, ; 88: SkiaSharp.SceneGraph.dll => 0x3bc42901e7a469a1 => 60
	i64 4356591372459378815, ; 89: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4373617458794931033, ; 90: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 116
	i64 4477672992252076438, ; 91: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 156
	i64 4679594760078841447, ; 92: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 93: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 102
	i64 4794310189461587505, ; 94: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 66
	i64 4795410492532947900, ; 95: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 88
	i64 4809057822547766521, ; 96: System.Drawing => 0x42bd349c3145ecf9 => 112
	i64 4814660307502931973, ; 97: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 122
	i64 4853321196694829351, ; 98: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 137
	i64 5103417709280584325, ; 99: System.Collections.Specialized => 0x46d2fb5e161b6285 => 100
	i64 5182934613077526976, ; 100: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 100
	i64 5290786973231294105, ; 101: System.Runtime.Loader => 0x496ca6b869b72699 => 137
	i64 5382384903084550500, ; 102: MailKit.dll => 0x4ab2128d60c7a964 => 38
	i64 5471532531798518949, ; 103: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 104: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 105: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 114
	i64 5573260873512690141, ; 106: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 147
	i64 5650097808083101034, ; 107: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 142
	i64 5692067934154308417, ; 108: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 90
	i64 5979151488806146654, ; 109: System.Formats.Asn1 => 0x52fa3699a489d25e => 113
	i64 5984759512290286505, ; 110: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 145
	i64 6068057819846744445, ; 111: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 112: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 113: System.Text.Json.dll => 0x565a67a0ffe264a7 => 150
	i64 6251069312384999852, ; 114: System.Transactions.Local => 0x56c0426b870da1ac => 155
	i64 6268464631992009879, ; 115: SkiaSharp.Skottie => 0x56fe0f5efcfbc497 => 61
	i64 6357457916754632952, ; 116: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 78
	i64 6433271170595107064, ; 118: MimeKit.dll => 0x5947920b731530f8 => 55
	i64 6478287442656530074, ; 119: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 120: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 74
	i64 6560151584539558821, ; 121: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 47
	i64 6671798237668743565, ; 122: SkiaSharp => 0x5c96fd260152998d => 57
	i64 6743165466166707109, ; 123: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 124: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 125: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 110
	i64 6876862101832370452, ; 126: System.Xml.Linq => 0x5f6f85a57d108914 => 157
	i64 6894844156784520562, ; 127: System.Numerics.Vectors => 0x5faf683aead1ad72 => 129
	i64 7060896174307865760, ; 128: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 152
	i64 7083547580668757502, ; 129: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 132
	i64 7105430439328552570, ; 130: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 65
	i64 7220009545223068405, ; 131: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 132: System.Linq => 0x64e71ccf51a90a5a => 118
	i64 7314237870106916923, ; 133: SkiaSharp.Views.Maui.Core.dll => 0x65816497226eb83b => 64
	i64 7316205155833392065, ; 134: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 95
	i64 7377312882064240630, ; 135: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 105
	i64 7488575175965059935, ; 136: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 157
	i64 7489048572193775167, ; 137: System.ObjectModel => 0x67ee71ff6b419e3f => 130
	i64 7654504624184590948, ; 138: System.Net.Http => 0x6a3a4366801b8264 => 120
	i64 7694700312542370399, ; 139: System.Net.Mail => 0x6ac9112a7e2cda5f => 121
	i64 7702918024138448955, ; 140: MySqlConnector => 0x6ae6432192b9e03b => 56
	i64 7708790323521193081, ; 141: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 142: System.Private.CoreLib => 0x6b0ff375198b9c17 => 161
	i64 7723873813026311384, ; 143: SkiaSharp.Views.Maui.Controls.dll => 0x6b30b64f63600cd8 => 63
	i64 7735352534559001595, ; 144: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 92
	i64 7836164640616011524, ; 145: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 68
	i64 7927939710195668715, ; 146: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 62
	i64 8031450141206250471, ; 147: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 136
	i64 8064050204834738623, ; 148: System.Collections.dll => 0x6fe942efa61731bf => 101
	i64 8083354569033831015, ; 149: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 77
	i64 8087206902342787202, ; 150: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 109
	i64 8167236081217502503, ; 151: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 162
	i64 8185542183669246576, ; 152: System.Collections => 0x7198e33f4794aa70 => 101
	i64 8246048515196606205, ; 153: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 54
	i64 8368701292315763008, ; 154: System.Security.Cryptography => 0x7423997c6fd56140 => 147
	i64 8400357532724379117, ; 155: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 85
	i64 8518412311883997971, ; 156: System.Collections.Immutable => 0x76377add7c28e313 => 98
	i64 8563666267364444763, ; 157: System.Private.Uri => 0x76d841191140ca5b => 131
	i64 8599632406834268464, ; 158: CommunityToolkit.Maui => 0x7758081c784b4930 => 36
	i64 8614108721271900878, ; 159: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 160: Java.Interop => 0x77b654e585b55834 => 162
	i64 8639588376636138208, ; 161: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 84
	i64 8677882282824630478, ; 162: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 163: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 109
	i64 9045785047181495996, ; 164: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9138683372487561558, ; 165: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 143
	i64 9286073997824813334, ; 166: BouncyCastle.Cryptography => 0x80dec319ee56e916 => 35
	i64 9312692141327339315, ; 167: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 90
	i64 9324707631942237306, ; 168: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 67
	i64 9334813198578103615, ; 169: SkiaSharp.Extended.UI => 0x818beb2569e0353f => 59
	i64 9659729154652888475, ; 170: System.Text.RegularExpressions => 0x860e407c9991dd9b => 151
	i64 9678050649315576968, ; 171: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 71
	i64 9702891218465930390, ; 172: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 99
	i64 9808709177481450983, ; 173: Mono.Android.dll => 0x881f890734e555e7 => 164
	i64 9956195530459977388, ; 174: Microsoft.Maui => 0x8a2b8315b36616ac => 52
	i64 9991543690424095600, ; 175: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10017511394021241210, ; 176: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 46
	i64 10038780035334861115, ; 177: System.Net.Http.dll => 0x8b50e941206af13b => 120
	i64 10051358222726253779, ; 178: System.Private.Xml => 0x8b7d990c97ccccd3 => 133
	i64 10092835686693276772, ; 179: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 50
	i64 10105485790837105934, ; 180: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 152
	i64 10143853363526200146, ; 181: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 182: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 74
	i64 10236703004850800690, ; 183: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 127
	i64 10406448008575299332, ; 184: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 93
	i64 10430153318873392755, ; 185: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 72
	i64 10506226065143327199, ; 186: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10670374202010151210, ; 187: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 95
	i64 10785150219063592792, ; 188: System.Net.Primitives => 0x95ac8cfb68830758 => 124
	i64 10880838204485145808, ; 189: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 36
	i64 11002576679268595294, ; 190: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 45
	i64 11009005086950030778, ; 191: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 52
	i64 11090768353599813002, ; 192: Podbor => 0x99ea530e6275f58a => 94
	i64 11103970607964515343, ; 193: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 194: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 89
	i64 11220793807500858938, ; 195: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 196: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 47
	i64 11340910727871153756, ; 197: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 73
	i64 11481869442598199266, ; 198: Microcharts.Maui.dll => 0x9f57cb6cab7a5fe2 => 39
	i64 11485890710487134646, ; 199: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 135
	i64 11518296021396496455, ; 200: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 201: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 89
	i64 11530571088791430846, ; 202: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 44
	i64 11597940890313164233, ; 203: netstandard => 0xa0f429ca8d1805c9 => 160
	i64 11705530742807338875, ; 204: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 12040886584167504988, ; 205: System.Net.ServicePoint => 0xa719d28d8e121c5c => 127
	i64 12102847907131387746, ; 206: System.Buffers => 0xa7f5f40c43256f62 => 96
	i64 12145679461940342714, ; 207: System.Text.Json => 0xa88e1f1ebcb62fba => 150
	i64 12269460666702402136, ; 208: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 98
	i64 12341818387765915815, ; 209: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 37
	i64 12451044538927396471, ; 210: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 76
	i64 12466513435562512481, ; 211: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 81
	i64 12475113361194491050, ; 212: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 213: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 110
	i64 12538491095302438457, ; 214: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 69
	i64 12550732019250633519, ; 215: System.IO.Compression => 0xae2d28465e8e1b2f => 115
	i64 12551451704392164662, ; 216: MySqlConnector.dll => 0xae2fb6d31fc42536 => 56
	i64 12681088699309157496, ; 217: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 218: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 70
	i64 12708922737231849740, ; 219: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 148
	i64 12823819093633476069, ; 220: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12835242264250840079, ; 221: System.IO.Pipes => 0xb21ff0d5d6c0740f => 116
	i64 12843321153144804894, ; 222: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 48
	i64 13068258254871114833, ; 223: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 139
	i64 13154545759872849719, ; 224: Podbor.dll => 0xb68e55ac3ed79737 => 94
	i64 13221551921002590604, ; 225: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 226: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 227: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 163
	i64 13381594904270902445, ; 228: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 229: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 92
	i64 13467053111158216594, ; 230: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 231: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 232: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 233: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13717397318615465333, ; 234: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 104
	i64 13755568601956062840, ; 235: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 236: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 237: System.Console.dll => 0xc0a5f3cade5c6774 => 107
	i64 13959074834287824816, ; 238: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 76
	i64 13961013029440053076, ; 239: MailKit => 0xc1bf7b61b45fdf54 => 38
	i64 14100563506285742564, ; 240: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 241: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 69
	i64 14125464355221830302, ; 242: System.Threading.dll => 0xc407bafdbc707a9e => 154
	i64 14254574811015963973, ; 243: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 148
	i64 14327709162229390963, ; 244: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 146
	i64 14461014870687870182, ; 245: System.Net.Requests.dll => 0xc8afd8683afdece6 => 125
	i64 14464374589798375073, ; 246: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 247: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 248: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 149
	i64 14552901170081803662, ; 249: SkiaSharp.Views.Maui.Core => 0xc9f64a827617ad8e => 64
	i64 14556034074661724008, ; 250: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 37
	i64 14561513370130550166, ; 251: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 145
	i64 14622043554576106986, ; 252: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 139
	i64 14669215534098758659, ; 253: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 42
	i64 14690985099581930927, ; 254: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 156
	i64 14705122255218365489, ; 255: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 256: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14832630590065248058, ; 257: System.Security.Claims => 0xcdd816ef5d6e873a => 141
	i64 14852515768018889994, ; 258: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 73
	i64 14892012299694389861, ; 259: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 260: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 261: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 43
	i64 14987728460634540364, ; 262: System.IO.Compression.dll => 0xcfff1ba06622494c => 115
	i64 15015154896917945444, ; 263: System.Net.Security.dll => 0xd0608bd33642dc64 => 126
	i64 15076659072870671916, ; 264: System.ObjectModel.dll => 0xd13b0d8c1620662c => 130
	i64 15101927338945785474, ; 265: SkiaSharp.SceneGraph => 0xd194d2e6bd9fae82 => 60
	i64 15111608613780139878, ; 266: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 267: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 114
	i64 15133485256822086103, ; 268: System.Linq.dll => 0xd204f0a9127dd9d7 => 118
	i64 15227001540531775957, ; 269: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 41
	i64 15370334346939861994, ; 270: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 72
	i64 15391712275433856905, ; 271: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 43
	i64 15527772828719725935, ; 272: System.Console => 0xd77dbb1e38cd3d6f => 107
	i64 15536481058354060254, ; 273: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15541854775306130054, ; 274: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 146
	i64 15557562860424774966, ; 275: System.Net.Sockets => 0xd7e790fe7a6dc536 => 128
	i64 15582737692548360875, ; 276: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 80
	i64 15609085926864131306, ; 277: System.dll => 0xd89e9cf3334914ea => 159
	i64 15620612276725577442, ; 278: BouncyCastle.Cryptography.dll => 0xd8c7901aa85576e2 => 35
	i64 15661133872274321916, ; 279: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 158
	i64 15664356999916475676, ; 280: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 281: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 282: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15928521404965645318, ; 283: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 49
	i64 16018552496348375205, ; 284: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 123
	i64 16154507427712707110, ; 285: System => 0xe03056ea4e39aa26 => 159
	i64 16219561732052121626, ; 286: System.Net.Security => 0xe1177575db7c781a => 126
	i64 16288847719894691167, ; 287: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 288: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 45
	i64 16324796876805858114, ; 289: SkiaSharp.dll => 0xe28d5444586b6342 => 57
	i64 16454459195343277943, ; 290: System.Net.NetworkInformation => 0xe459fb756d988f77 => 123
	i64 16649148416072044166, ; 291: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 54
	i64 16677317093839702854, ; 292: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 85
	i64 16737807731308835127, ; 293: System.Runtime.Intrinsics => 0xe848a3736f733137 => 136
	i64 16856067890322379635, ; 294: System.Data.Common.dll => 0xe9ecc87060889373 => 108
	i64 16890310621557459193, ; 295: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 151
	i64 16942731696432749159, ; 296: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16961387572093531548, ; 297: SkiaSharp.Extended => 0xeb62f421ac5c359c => 58
	i64 16998075588627545693, ; 298: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 83
	i64 17008137082415910100, ; 299: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 99
	i64 17031351772568316411, ; 300: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 82
	i64 17062143951396181894, ; 301: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 104
	i64 17089008752050867324, ; 302: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 303: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 102
	i64 17201328579425343169, ; 304: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 103
	i64 17202182880784296190, ; 305: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 144
	i64 17230721278011714856, ; 306: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 132
	i64 17234219099804750107, ; 307: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 155
	i64 17260702271250283638, ; 308: System.Data.Common => 0xef8a5543bba6bc76 => 108
	i64 17342750010158924305, ; 309: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 310: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 311: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 312: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17671790519499593115, ; 313: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 62
	i64 17702523067201099846, ; 314: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 315: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 81
	i64 17710060891934109755, ; 316: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 79
	i64 17712670374920797664, ; 317: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 135
	i64 17777860260071588075, ; 318: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 138
	i64 17808848867378959707, ; 319: SkiaSharp.Skottie.dll => 0xf725bdb086bd955b => 61
	i64 17838668724098252521, ; 320: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 96
	i64 18025913125965088385, ; 321: System.Threading => 0xfa28e87b91334681 => 154
	i64 18099568558057551825, ; 322: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 323: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 82
	i64 18146411883821974900, ; 324: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 113
	i64 18146811631844267958, ; 325: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 103
	i64 18203743254473369877, ; 326: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 65
	i64 18245806341561545090, ; 327: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 97
	i64 18305135509493619199, ; 328: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 84
	i64 18324163916253801303 ; 329: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [330 x i32] [
	i32 48, ; 0
	i32 164, ; 1
	i32 53, ; 2
	i32 117, ; 3
	i32 70, ; 4
	i32 39, ; 5
	i32 87, ; 6
	i32 58, ; 7
	i32 7, ; 8
	i32 153, ; 9
	i32 106, ; 10
	i32 10, ; 11
	i32 75, ; 12
	i32 91, ; 13
	i32 18, ; 14
	i32 112, ; 15
	i32 83, ; 16
	i32 59, ; 17
	i32 124, ; 18
	i32 50, ; 19
	i32 163, ; 20
	i32 153, ; 21
	i32 16, ; 22
	i32 68, ; 23
	i32 80, ; 24
	i32 121, ; 25
	i32 119, ; 26
	i32 131, ; 27
	i32 67, ; 28
	i32 6, ; 29
	i32 87, ; 30
	i32 111, ; 31
	i32 28, ; 32
	i32 51, ; 33
	i32 28, ; 34
	i32 55, ; 35
	i32 142, ; 36
	i32 79, ; 37
	i32 2, ; 38
	i32 20, ; 39
	i32 111, ; 40
	i32 46, ; 41
	i32 75, ; 42
	i32 97, ; 43
	i32 24, ; 44
	i32 78, ; 45
	i32 149, ; 46
	i32 134, ; 47
	i32 71, ; 48
	i32 140, ; 49
	i32 66, ; 50
	i32 27, ; 51
	i32 122, ; 52
	i32 42, ; 53
	i32 2, ; 54
	i32 134, ; 55
	i32 7, ; 56
	i32 91, ; 57
	i32 143, ; 58
	i32 77, ; 59
	i32 129, ; 60
	i32 138, ; 61
	i32 128, ; 62
	i32 93, ; 63
	i32 63, ; 64
	i32 53, ; 65
	i32 40, ; 66
	i32 88, ; 67
	i32 161, ; 68
	i32 22, ; 69
	i32 140, ; 70
	i32 41, ; 71
	i32 158, ; 72
	i32 40, ; 73
	i32 160, ; 74
	i32 86, ; 75
	i32 44, ; 76
	i32 51, ; 77
	i32 144, ; 78
	i32 125, ; 79
	i32 119, ; 80
	i32 133, ; 81
	i32 49, ; 82
	i32 33, ; 83
	i32 106, ; 84
	i32 141, ; 85
	i32 117, ; 86
	i32 105, ; 87
	i32 60, ; 88
	i32 30, ; 89
	i32 116, ; 90
	i32 156, ; 91
	i32 0, ; 92
	i32 102, ; 93
	i32 66, ; 94
	i32 88, ; 95
	i32 112, ; 96
	i32 122, ; 97
	i32 137, ; 98
	i32 100, ; 99
	i32 100, ; 100
	i32 137, ; 101
	i32 38, ; 102
	i32 26, ; 103
	i32 29, ; 104
	i32 114, ; 105
	i32 147, ; 106
	i32 142, ; 107
	i32 90, ; 108
	i32 113, ; 109
	i32 145, ; 110
	i32 23, ; 111
	i32 23, ; 112
	i32 150, ; 113
	i32 155, ; 114
	i32 61, ; 115
	i32 34, ; 116
	i32 78, ; 117
	i32 55, ; 118
	i32 11, ; 119
	i32 74, ; 120
	i32 47, ; 121
	i32 57, ; 122
	i32 19, ; 123
	i32 22, ; 124
	i32 110, ; 125
	i32 157, ; 126
	i32 129, ; 127
	i32 152, ; 128
	i32 132, ; 129
	i32 65, ; 130
	i32 26, ; 131
	i32 118, ; 132
	i32 64, ; 133
	i32 95, ; 134
	i32 105, ; 135
	i32 157, ; 136
	i32 130, ; 137
	i32 120, ; 138
	i32 121, ; 139
	i32 56, ; 140
	i32 17, ; 141
	i32 161, ; 142
	i32 63, ; 143
	i32 92, ; 144
	i32 68, ; 145
	i32 62, ; 146
	i32 136, ; 147
	i32 101, ; 148
	i32 77, ; 149
	i32 109, ; 150
	i32 162, ; 151
	i32 101, ; 152
	i32 54, ; 153
	i32 147, ; 154
	i32 85, ; 155
	i32 98, ; 156
	i32 131, ; 157
	i32 36, ; 158
	i32 21, ; 159
	i32 162, ; 160
	i32 84, ; 161
	i32 21, ; 162
	i32 109, ; 163
	i32 31, ; 164
	i32 143, ; 165
	i32 35, ; 166
	i32 90, ; 167
	i32 67, ; 168
	i32 59, ; 169
	i32 151, ; 170
	i32 71, ; 171
	i32 99, ; 172
	i32 164, ; 173
	i32 52, ; 174
	i32 6, ; 175
	i32 46, ; 176
	i32 120, ; 177
	i32 133, ; 178
	i32 50, ; 179
	i32 152, ; 180
	i32 3, ; 181
	i32 74, ; 182
	i32 127, ; 183
	i32 93, ; 184
	i32 72, ; 185
	i32 1, ; 186
	i32 95, ; 187
	i32 124, ; 188
	i32 36, ; 189
	i32 45, ; 190
	i32 52, ; 191
	i32 94, ; 192
	i32 12, ; 193
	i32 89, ; 194
	i32 15, ; 195
	i32 47, ; 196
	i32 73, ; 197
	i32 39, ; 198
	i32 135, ; 199
	i32 13, ; 200
	i32 89, ; 201
	i32 44, ; 202
	i32 160, ; 203
	i32 9, ; 204
	i32 127, ; 205
	i32 96, ; 206
	i32 150, ; 207
	i32 98, ; 208
	i32 37, ; 209
	i32 76, ; 210
	i32 81, ; 211
	i32 34, ; 212
	i32 110, ; 213
	i32 69, ; 214
	i32 115, ; 215
	i32 56, ; 216
	i32 14, ; 217
	i32 70, ; 218
	i32 148, ; 219
	i32 27, ; 220
	i32 116, ; 221
	i32 48, ; 222
	i32 139, ; 223
	i32 94, ; 224
	i32 1, ; 225
	i32 15, ; 226
	i32 163, ; 227
	i32 9, ; 228
	i32 92, ; 229
	i32 29, ; 230
	i32 30, ; 231
	i32 13, ; 232
	i32 86, ; 233
	i32 104, ; 234
	i32 8, ; 235
	i32 11, ; 236
	i32 107, ; 237
	i32 76, ; 238
	i32 38, ; 239
	i32 3, ; 240
	i32 69, ; 241
	i32 154, ; 242
	i32 148, ; 243
	i32 146, ; 244
	i32 125, ; 245
	i32 24, ; 246
	i32 5, ; 247
	i32 149, ; 248
	i32 64, ; 249
	i32 37, ; 250
	i32 145, ; 251
	i32 139, ; 252
	i32 42, ; 253
	i32 156, ; 254
	i32 16, ; 255
	i32 32, ; 256
	i32 141, ; 257
	i32 73, ; 258
	i32 33, ; 259
	i32 0, ; 260
	i32 43, ; 261
	i32 115, ; 262
	i32 126, ; 263
	i32 130, ; 264
	i32 60, ; 265
	i32 17, ; 266
	i32 114, ; 267
	i32 118, ; 268
	i32 41, ; 269
	i32 72, ; 270
	i32 43, ; 271
	i32 107, ; 272
	i32 4, ; 273
	i32 146, ; 274
	i32 128, ; 275
	i32 80, ; 276
	i32 159, ; 277
	i32 35, ; 278
	i32 158, ; 279
	i32 4, ; 280
	i32 12, ; 281
	i32 5, ; 282
	i32 49, ; 283
	i32 123, ; 284
	i32 159, ; 285
	i32 126, ; 286
	i32 18, ; 287
	i32 45, ; 288
	i32 57, ; 289
	i32 123, ; 290
	i32 54, ; 291
	i32 85, ; 292
	i32 136, ; 293
	i32 108, ; 294
	i32 151, ; 295
	i32 25, ; 296
	i32 58, ; 297
	i32 83, ; 298
	i32 99, ; 299
	i32 82, ; 300
	i32 104, ; 301
	i32 32, ; 302
	i32 102, ; 303
	i32 103, ; 304
	i32 144, ; 305
	i32 132, ; 306
	i32 155, ; 307
	i32 108, ; 308
	i32 10, ; 309
	i32 25, ; 310
	i32 8, ; 311
	i32 20, ; 312
	i32 62, ; 313
	i32 31, ; 314
	i32 81, ; 315
	i32 79, ; 316
	i32 135, ; 317
	i32 138, ; 318
	i32 61, ; 319
	i32 96, ; 320
	i32 154, ; 321
	i32 19, ; 322
	i32 82, ; 323
	i32 113, ; 324
	i32 103, ; 325
	i32 65, ; 326
	i32 97, ; 327
	i32 84, ; 328
	i32 14 ; 329
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
