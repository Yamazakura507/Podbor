; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [164 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [328 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 122
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 121
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 135
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 152
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 5: System.Security.Cryptography.Primitives => 0x410f24b => 144
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 52
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 134
	i32 149972175, ; 8: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 144
	i32 159306688, ; 9: System.ComponentModel.Annotations => 0x97ed3c0 => 100
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 68
	i32 182336117, ; 11: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 86
	i32 195452805, ; 12: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 13: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 14: System.ComponentModel => 0xc38ff48 => 104
	i32 231409092, ; 15: System.Linq.Parallel => 0xdcb05c4 => 116
	i32 280992041, ; 16: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 17: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 18: Xamarin.AndroidX.Activity.dll => 0x13031348 => 64
	i32 336156722, ; 19: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 20: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 75
	i32 356389973, ; 21: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364942007, ; 22: SkiaSharp.Extended.UI => 0x15c092b7 => 57
	i32 367780167, ; 23: System.IO.Pipes => 0x15ebe147 => 114
	i32 374914964, ; 24: System.Transactions.Local => 0x1658bf94 => 154
	i32 375677976, ; 25: System.Net.ServicePoint.dll => 0x16646418 => 126
	i32 379916513, ; 26: System.Threading.Thread.dll => 0x16a510e1 => 152
	i32 382590210, ; 27: SkiaSharp.Extended.dll => 0x16cddd02 => 56
	i32 385762202, ; 28: System.Memory.dll => 0x16fe439a => 118
	i32 395744057, ; 29: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 30: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 31: System.Collections => 0x1a61054f => 99
	i32 450948140, ; 32: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 74
	i32 451504562, ; 33: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 145
	i32 456227837, ; 34: System.Web.HttpUtility.dll => 0x1b317bfd => 155
	i32 469710990, ; 35: System.dll => 0x1bff388e => 158
	i32 498788369, ; 36: System.ObjectModel => 0x1dbae811 => 129
	i32 500358224, ; 37: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 38: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 504833739, ; 39: SkiaSharp.SceneGraph => 0x1e1726cb => 58
	i32 513247710, ; 40: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 46
	i32 525008092, ; 41: SkiaSharp.dll => 0x1f4afcdc => 55
	i32 539058512, ; 42: Microsoft.Extensions.Logging => 0x20216150 => 43
	i32 586578074, ; 43: MimeKit => 0x22f6789a => 53
	i32 592146354, ; 44: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 45: CommunityToolkit.Maui => 0x239cf51b => 36
	i32 613668793, ; 46: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 141
	i32 627609679, ; 47: Xamarin.AndroidX.CustomView => 0x2568904f => 72
	i32 627931235, ; 48: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 49: System.Text.Encodings.Web.dll => 0x27787397 => 148
	i32 672442732, ; 50: System.Collections.Concurrent => 0x2814a96c => 95
	i32 683518922, ; 51: System.Net.Security => 0x28bdabca => 125
	i32 688181140, ; 52: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 53: System.Xml.Linq.dll => 0x29293ff5 => 156
	i32 690602616, ; 54: SkiaSharp.Skottie.dll => 0x2929c278 => 59
	i32 706645707, ; 55: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709152836, ; 56: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 63
	i32 709557578, ; 57: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 58: System.Runtime.Loader.dll => 0x2b15ed29 => 136
	i32 738469988, ; 59: SkiaSharp.SceneGraph.dll => 0x2c042864 => 58
	i32 759454413, ; 60: System.Net.Requests => 0x2d445acd => 124
	i32 762598435, ; 61: System.IO.Pipes.dll => 0x2d745423 => 114
	i32 775507847, ; 62: System.IO.Compression => 0x2e394f87 => 113
	i32 777317022, ; 63: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 778804420, ; 64: SkiaSharp.Extended.UI.dll => 0x2e6b9cc4 => 57
	i32 789151979, ; 65: Microsoft.Extensions.Options => 0x2f0980eb => 45
	i32 804715423, ; 66: System.Data.Common => 0x2ff6fb9f => 106
	i32 823281589, ; 67: System.Private.Uri.dll => 0x311247b5 => 130
	i32 830298997, ; 68: System.IO.Compression.Brotli => 0x317d5b75 => 112
	i32 904024072, ; 69: System.ComponentModel.Primitives.dll => 0x35e25008 => 102
	i32 926902833, ; 70: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 71: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 75
	i32 992768348, ; 72: System.Collections.dll => 0x3b2c715c => 99
	i32 1012816738, ; 73: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 85
	i32 1019214401, ; 74: System.Drawing => 0x3cbffa41 => 110
	i32 1028951442, ; 75: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 42
	i32 1029334545, ; 76: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 77: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 65
	i32 1036536393, ; 78: System.Drawing.Primitives.dll => 0x3dc84a49 => 109
	i32 1044663988, ; 79: System.Linq.Expressions.dll => 0x3e444eb4 => 115
	i32 1052210849, ; 80: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 77
	i32 1082857460, ; 81: System.ComponentModel.TypeConverter => 0x408b17f4 => 103
	i32 1084122840, ; 82: Xamarin.Kotlin.StdLib => 0x409e66d8 => 90
	i32 1098259244, ; 83: System => 0x41761b2c => 158
	i32 1118262833, ; 84: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 85: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 86: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 82
	i32 1203215381, ; 87: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 88: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 89: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 90: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 73
	i32 1324164729, ; 91: System.Linq => 0x4eed2679 => 117
	i32 1373134921, ; 92: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 93: Xamarin.AndroidX.SavedState => 0x52114ed3 => 85
	i32 1406073936, ; 94: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 69
	i32 1408764838, ; 95: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 138
	i32 1411638395, ; 96: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 133
	i32 1430672901, ; 97: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 98: System.Formats.Asn1.dll => 0x568cd628 => 111
	i32 1458022317, ; 99: System.Net.Security.dll => 0x56e7a7ad => 125
	i32 1461004990, ; 100: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 101: System.Collections.Immutable.dll => 0x5718a9ef => 96
	i32 1462112819, ; 102: System.IO.Compression.dll => 0x57261233 => 113
	i32 1469204771, ; 103: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 66
	i32 1470490898, ; 104: Microsoft.Extensions.Primitives => 0x57a5e912 => 46
	i32 1479771757, ; 105: System.Collections.Immutable => 0x5833866d => 96
	i32 1480492111, ; 106: System.IO.Compression.Brotli.dll => 0x583e844f => 112
	i32 1487239319, ; 107: Microsoft.Win32.Primitives => 0x58a57897 => 93
	i32 1493001747, ; 108: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1511525525, ; 109: MySqlConnector => 0x5a180c95 => 54
	i32 1514721132, ; 110: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 111: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 150
	i32 1551623176, ; 112: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 113: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 79
	i32 1623212457, ; 114: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 61
	i32 1624863272, ; 115: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 88
	i32 1634654947, ; 116: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 37
	i32 1636350590, ; 117: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 71
	i32 1639515021, ; 118: System.Net.Http.dll => 0x61b9038d => 119
	i32 1639986890, ; 119: System.Text.RegularExpressions => 0x61c036ca => 150
	i32 1641389582, ; 120: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 101
	i32 1657153582, ; 121: System.Runtime => 0x62c6282e => 139
	i32 1658251792, ; 122: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 89
	i32 1677501392, ; 123: System.Net.Primitives.dll => 0x63fca3d0 => 123
	i32 1679769178, ; 124: System.Security.Cryptography => 0x641f3e5a => 146
	i32 1696967625, ; 125: System.Security.Cryptography.Csp => 0x6525abc9 => 142
	i32 1724472758, ; 126: SkiaSharp.Extended => 0x66c95db6 => 56
	i32 1729485958, ; 127: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 67
	i32 1733338956, ; 128: MailKit => 0x6750a74c => 38
	i32 1736233607, ; 129: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 130: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 131: System.Transactions.Local.dll => 0x67fe8db2 => 154
	i32 1750313021, ; 132: Microsoft.Win32.Primitives.dll => 0x6853a83d => 93
	i32 1763938596, ; 133: System.Diagnostics.TraceSource.dll => 0x69239124 => 108
	i32 1766324549, ; 134: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 86
	i32 1770582343, ; 135: Microsoft.Extensions.Logging.dll => 0x6988f147 => 43
	i32 1780572499, ; 136: Mono.Android.Runtime.dll => 0x6a216153 => 162
	i32 1782862114, ; 137: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1783002880, ; 138: Podbor => 0x6a467700 => 92
	i32 1788241197, ; 139: Xamarin.AndroidX.Fragment => 0x6a96652d => 74
	i32 1793755602, ; 140: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 141: Xamarin.AndroidX.Loader => 0x6bcd3296 => 79
	i32 1813058853, ; 142: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 90
	i32 1813201214, ; 143: Xamarin.Google.Android.Material => 0x6c13413e => 89
	i32 1818569960, ; 144: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 83
	i32 1824175904, ; 145: System.Text.Encoding.Extensions => 0x6cbab720 => 147
	i32 1824722060, ; 146: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 138
	i32 1828688058, ; 147: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 44
	i32 1842015223, ; 148: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 149: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 150: System.Linq.Expressions => 0x6ec71a65 => 115
	i32 1875935024, ; 151: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 152: System.Collections.NonGeneric.dll => 0x71dc7c8b => 97
	i32 1939592360, ; 153: System.Private.Xml.Linq => 0x739bd4a8 => 131
	i32 1968388702, ; 154: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 39
	i32 2003115576, ; 155: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 156: System.Buffers.dll => 0x77ec19b4 => 94
	i32 2019465201, ; 157: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 77
	i32 2025202353, ; 158: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2026931361, ; 159: MailKit.dll => 0x78d084a1 => 38
	i32 2045470958, ; 160: System.Private.Xml => 0x79eb68ee => 132
	i32 2055257422, ; 161: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 76
	i32 2066184531, ; 162: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 163: System.Diagnostics.TraceSource => 0x7b6f419e => 108
	i32 2079903147, ; 164: System.Runtime.dll => 0x7bf8cdab => 139
	i32 2090596640, ; 165: System.Numerics.Vectors => 0x7c9bf920 => 128
	i32 2127167465, ; 166: System.Console => 0x7ec9ffe9 => 105
	i32 2142473426, ; 167: System.Collections.Specialized => 0x7fb38cd2 => 98
	i32 2159891885, ; 168: Microsoft.Maui => 0x80bd55ad => 50
	i32 2169148018, ; 169: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 170: Microsoft.Extensions.Options.dll => 0x820d22b3 => 45
	i32 2192057212, ; 171: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 44
	i32 2193016926, ; 172: System.ObjectModel.dll => 0x82b6c85e => 129
	i32 2201107256, ; 173: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 91
	i32 2201231467, ; 174: System.Net.Http => 0x8334206b => 119
	i32 2207618523, ; 175: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2222056684, ; 176: System.Threading.Tasks.Parallel => 0x8471e4ec => 151
	i32 2266799131, ; 177: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 40
	i32 2270573516, ; 178: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 179: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 84
	i32 2295906218, ; 180: System.Net.Sockets => 0x88d8bfaa => 127
	i32 2298471582, ; 181: System.Net.Mail => 0x88ffe49e => 120
	i32 2303942373, ; 182: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 183: System.Private.CoreLib.dll => 0x896b7878 => 160
	i32 2320631194, ; 184: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 151
	i32 2353062107, ; 185: System.Net.Primitives => 0x8c40e0db => 123
	i32 2364201794, ; 186: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 62
	i32 2368005991, ; 187: System.Xml.ReaderWriter.dll => 0x8d24e767 => 157
	i32 2371007202, ; 188: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 39
	i32 2378619854, ; 189: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 142
	i32 2395872292, ; 190: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 191: System.Web.HttpUtility => 0x8f24faee => 155
	i32 2427813419, ; 192: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 193: System.Console.dll => 0x912896e5 => 105
	i32 2458678730, ; 194: System.Net.Sockets.dll => 0x928c75ca => 127
	i32 2459001652, ; 195: System.Linq.Parallel.dll => 0x92916334 => 116
	i32 2471841756, ; 196: netstandard.dll => 0x93554fdc => 159
	i32 2475788418, ; 197: Java.Interop.dll => 0x93918882 => 161
	i32 2480646305, ; 198: Microsoft.Maui.Controls => 0x93dba8a1 => 48
	i32 2483903535, ; 199: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 101
	i32 2484371297, ; 200: System.Net.ServicePoint => 0x94147f61 => 126
	i32 2498657740, ; 201: BouncyCastle.Cryptography.dll => 0x94ee7dcc => 35
	i32 2550873716, ; 202: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 203: System.Text.Encodings.Web => 0x9930ee42 => 148
	i32 2585220780, ; 204: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 147
	i32 2593496499, ; 205: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 206: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 91
	i32 2617129537, ; 207: System.Private.Xml.dll => 0x9bfe3a41 => 132
	i32 2620871830, ; 208: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 71
	i32 2625339995, ; 209: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 62
	i32 2626831493, ; 210: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 211: System.Runtime.Loader => 0x9ec4cf01 => 136
	i32 2665622720, ; 212: System.Drawing.Primitives => 0x9ee22cc0 => 109
	i32 2676780864, ; 213: System.Data.Common.dll => 0x9f8c6f40 => 106
	i32 2717744543, ; 214: System.Security.Claims => 0xa1fd7d9f => 140
	i32 2724373263, ; 215: System.Runtime.Numerics.dll => 0xa262a30f => 137
	i32 2732626843, ; 216: Xamarin.AndroidX.Activity => 0xa2e0939b => 64
	i32 2737747696, ; 217: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 66
	i32 2752995522, ; 218: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 219: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 49
	i32 2764765095, ; 220: Microsoft.Maui.dll => 0xa4caf7a7 => 50
	i32 2778768386, ; 221: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 87
	i32 2785988530, ; 222: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 223: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 60
	i32 2801831435, ; 224: Microsoft.Maui.Graphics => 0xa7008e0b => 52
	i32 2806116107, ; 225: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 226: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 69
	i32 2831556043, ; 227: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 228: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 87
	i32 2861189240, ; 229: Microsoft.Maui.Essentials => 0xaa8a4878 => 51
	i32 2868488919, ; 230: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 37
	i32 2909740682, ; 231: System.Private.CoreLib => 0xad6f1e8a => 160
	i32 2912489636, ; 232: SkiaSharp.Views.Android => 0xad9910a4 => 60
	i32 2916838712, ; 233: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 88
	i32 2919462931, ; 234: System.Numerics.Vectors.dll => 0xae037813 => 128
	i32 2959614098, ; 235: System.ComponentModel.dll => 0xb0682092 => 104
	i32 2972252294, ; 236: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 141
	i32 2978675010, ; 237: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 73
	i32 3038032645, ; 238: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 239: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 80
	i32 3059408633, ; 240: Mono.Android.Runtime => 0xb65adef9 => 162
	i32 3059793426, ; 241: System.ComponentModel.Primitives => 0xb660be12 => 102
	i32 3077302341, ; 242: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3087854663, ; 243: Podbor.dll => 0xb80cec47 => 92
	i32 3090735792, ; 244: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 145
	i32 3099732863, ; 245: System.Security.Claims.dll => 0xb8c22b7f => 140
	i32 3103600923, ; 246: System.Formats.Asn1 => 0xb8fd311b => 111
	i32 3171180504, ; 247: MimeKit.dll => 0xbd045fd8 => 53
	i32 3178803400, ; 248: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 81
	i32 3220365878, ; 249: System.Threading => 0xbff2e236 => 153
	i32 3258312781, ; 250: Xamarin.AndroidX.CardView => 0xc235e84d => 67
	i32 3280506390, ; 251: System.ComponentModel.Annotations.dll => 0xc3888e16 => 100
	i32 3290767353, ; 252: System.Security.Cryptography.Encoding => 0xc4251ff9 => 143
	i32 3305363605, ; 253: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 254: System.Net.Requests.dll => 0xc5b097e4 => 124
	i32 3317135071, ; 255: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 72
	i32 3340387945, ; 256: SkiaSharp => 0xc71a4669 => 55
	i32 3346324047, ; 257: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 82
	i32 3357674450, ; 258: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 259: System.Text.Json => 0xc82afec1 => 149
	i32 3362522851, ; 260: Xamarin.AndroidX.Core => 0xc86c06e3 => 70
	i32 3366347497, ; 261: Java.Interop => 0xc8a662e9 => 161
	i32 3374999561, ; 262: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 84
	i32 3381016424, ; 263: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 264: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 133
	i32 3428513518, ; 265: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 41
	i32 3430777524, ; 266: netstandard => 0xcc7d82b4 => 159
	i32 3452344032, ; 267: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 47
	i32 3463511458, ; 268: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 269: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 103
	i32 3473156932, ; 270: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 61
	i32 3476120550, ; 271: Mono.Android => 0xcf3163e6 => 163
	i32 3479583265, ; 272: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 273: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 274: System.Text.Json.dll => 0xcfbaacae => 149
	i32 3509114376, ; 275: System.Xml.Linq => 0xd128d608 => 156
	i32 3580758918, ; 276: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3605570793, ; 277: BouncyCastle.Cryptography => 0xd6e8a4e9 => 35
	i32 3608519521, ; 278: System.Linq.dll => 0xd715a361 => 117
	i32 3641597786, ; 279: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 76
	i32 3643446276, ; 280: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 281: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 81
	i32 3657292374, ; 282: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 40
	i32 3660523487, ; 283: System.Net.NetworkInformation => 0xda2f27df => 122
	i32 3663323240, ; 284: SkiaSharp.Skottie => 0xda59e068 => 59
	i32 3672681054, ; 285: Mono.Android.dll => 0xdae8aa5e => 163
	i32 3697841164, ; 286: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3716563718, ; 287: System.Runtime.Intrinsics => 0xdd864306 => 135
	i32 3724971120, ; 288: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 80
	i32 3732100267, ; 289: System.Net.NameResolution => 0xde7354ab => 121
	i32 3748608112, ; 290: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 107
	i32 3786282454, ; 291: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 68
	i32 3792276235, ; 292: System.Collections.NonGeneric => 0xe2098b0b => 97
	i32 3800979733, ; 293: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 47
	i32 3802395368, ; 294: System.Collections.Specialized.dll => 0xe2a3f2e8 => 98
	i32 3807198597, ; 295: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 63
	i32 3817368567, ; 296: CommunityToolkit.Maui.dll => 0xe3886bf7 => 36
	i32 3823082795, ; 297: System.Security.Cryptography.dll => 0xe3df9d2b => 146
	i32 3841636137, ; 298: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 42
	i32 3844307129, ; 299: System.Net.Mail.dll => 0xe52378b9 => 120
	i32 3849253459, ; 300: System.Runtime.InteropServices.dll => 0xe56ef253 => 134
	i32 3875112723, ; 301: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 143
	i32 3889960447, ; 302: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 303: System.Collections.Concurrent.dll => 0xe839deed => 95
	i32 3896760992, ; 304: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 70
	i32 3928044579, ; 305: System.Xml.ReaderWriter => 0xea213423 => 157
	i32 3931092270, ; 306: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 83
	i32 3955647286, ; 307: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 65
	i32 3980434154, ; 308: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 309: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 310: System.Memory => 0xeff49a63 => 118
	i32 4046471985, ; 311: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 49
	i32 4068434129, ; 312: System.Private.Xml.Linq.dll => 0xf27f60d1 => 131
	i32 4073602200, ; 313: System.Threading.dll => 0xf2ce3c98 => 153
	i32 4079385022, ; 314: MySqlConnector.dll => 0xf32679be => 54
	i32 4094352644, ; 315: Microsoft.Maui.Essentials.dll => 0xf40add04 => 51
	i32 4099507663, ; 316: System.Drawing.dll => 0xf45985cf => 110
	i32 4100113165, ; 317: System.Private.Uri => 0xf462c30d => 130
	i32 4102112229, ; 318: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 319: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 320: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 41
	i32 4150914736, ; 321: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 322: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 78
	i32 4213026141, ; 323: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 107
	i32 4260525087, ; 324: System.Buffers => 0xfdf2741f => 94
	i32 4271975918, ; 325: Microsoft.Maui.Controls.dll => 0xfea12dee => 48
	i32 4274976490, ; 326: System.Runtime.Numerics => 0xfecef6ea => 137
	i32 4292120959 ; 327: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 78
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [328 x i32] [
	i32 122, ; 0
	i32 121, ; 1
	i32 135, ; 2
	i32 152, ; 3
	i32 33, ; 4
	i32 144, ; 5
	i32 52, ; 6
	i32 134, ; 7
	i32 144, ; 8
	i32 100, ; 9
	i32 68, ; 10
	i32 86, ; 11
	i32 30, ; 12
	i32 31, ; 13
	i32 104, ; 14
	i32 116, ; 15
	i32 2, ; 16
	i32 30, ; 17
	i32 64, ; 18
	i32 15, ; 19
	i32 75, ; 20
	i32 14, ; 21
	i32 57, ; 22
	i32 114, ; 23
	i32 154, ; 24
	i32 126, ; 25
	i32 152, ; 26
	i32 56, ; 27
	i32 118, ; 28
	i32 34, ; 29
	i32 26, ; 30
	i32 99, ; 31
	i32 74, ; 32
	i32 145, ; 33
	i32 155, ; 34
	i32 158, ; 35
	i32 129, ; 36
	i32 13, ; 37
	i32 7, ; 38
	i32 58, ; 39
	i32 46, ; 40
	i32 55, ; 41
	i32 43, ; 42
	i32 53, ; 43
	i32 21, ; 44
	i32 36, ; 45
	i32 141, ; 46
	i32 72, ; 47
	i32 19, ; 48
	i32 148, ; 49
	i32 95, ; 50
	i32 125, ; 51
	i32 1, ; 52
	i32 156, ; 53
	i32 59, ; 54
	i32 16, ; 55
	i32 63, ; 56
	i32 4, ; 57
	i32 136, ; 58
	i32 58, ; 59
	i32 124, ; 60
	i32 114, ; 61
	i32 113, ; 62
	i32 25, ; 63
	i32 57, ; 64
	i32 45, ; 65
	i32 106, ; 66
	i32 130, ; 67
	i32 112, ; 68
	i32 102, ; 69
	i32 28, ; 70
	i32 75, ; 71
	i32 99, ; 72
	i32 85, ; 73
	i32 110, ; 74
	i32 42, ; 75
	i32 3, ; 76
	i32 65, ; 77
	i32 109, ; 78
	i32 115, ; 79
	i32 77, ; 80
	i32 103, ; 81
	i32 90, ; 82
	i32 158, ; 83
	i32 16, ; 84
	i32 22, ; 85
	i32 82, ; 86
	i32 20, ; 87
	i32 18, ; 88
	i32 2, ; 89
	i32 73, ; 90
	i32 117, ; 91
	i32 32, ; 92
	i32 85, ; 93
	i32 69, ; 94
	i32 138, ; 95
	i32 133, ; 96
	i32 0, ; 97
	i32 111, ; 98
	i32 125, ; 99
	i32 6, ; 100
	i32 96, ; 101
	i32 113, ; 102
	i32 66, ; 103
	i32 46, ; 104
	i32 96, ; 105
	i32 112, ; 106
	i32 93, ; 107
	i32 10, ; 108
	i32 54, ; 109
	i32 5, ; 110
	i32 150, ; 111
	i32 25, ; 112
	i32 79, ; 113
	i32 61, ; 114
	i32 88, ; 115
	i32 37, ; 116
	i32 71, ; 117
	i32 119, ; 118
	i32 150, ; 119
	i32 101, ; 120
	i32 139, ; 121
	i32 89, ; 122
	i32 123, ; 123
	i32 146, ; 124
	i32 142, ; 125
	i32 56, ; 126
	i32 67, ; 127
	i32 38, ; 128
	i32 23, ; 129
	i32 1, ; 130
	i32 154, ; 131
	i32 93, ; 132
	i32 108, ; 133
	i32 86, ; 134
	i32 43, ; 135
	i32 162, ; 136
	i32 17, ; 137
	i32 92, ; 138
	i32 74, ; 139
	i32 9, ; 140
	i32 79, ; 141
	i32 90, ; 142
	i32 89, ; 143
	i32 83, ; 144
	i32 147, ; 145
	i32 138, ; 146
	i32 44, ; 147
	i32 29, ; 148
	i32 26, ; 149
	i32 115, ; 150
	i32 8, ; 151
	i32 97, ; 152
	i32 131, ; 153
	i32 39, ; 154
	i32 5, ; 155
	i32 94, ; 156
	i32 77, ; 157
	i32 0, ; 158
	i32 38, ; 159
	i32 132, ; 160
	i32 76, ; 161
	i32 4, ; 162
	i32 108, ; 163
	i32 139, ; 164
	i32 128, ; 165
	i32 105, ; 166
	i32 98, ; 167
	i32 50, ; 168
	i32 12, ; 169
	i32 45, ; 170
	i32 44, ; 171
	i32 129, ; 172
	i32 91, ; 173
	i32 119, ; 174
	i32 14, ; 175
	i32 151, ; 176
	i32 40, ; 177
	i32 8, ; 178
	i32 84, ; 179
	i32 127, ; 180
	i32 120, ; 181
	i32 18, ; 182
	i32 160, ; 183
	i32 151, ; 184
	i32 123, ; 185
	i32 62, ; 186
	i32 157, ; 187
	i32 39, ; 188
	i32 142, ; 189
	i32 13, ; 190
	i32 155, ; 191
	i32 10, ; 192
	i32 105, ; 193
	i32 127, ; 194
	i32 116, ; 195
	i32 159, ; 196
	i32 161, ; 197
	i32 48, ; 198
	i32 101, ; 199
	i32 126, ; 200
	i32 35, ; 201
	i32 11, ; 202
	i32 148, ; 203
	i32 147, ; 204
	i32 20, ; 205
	i32 91, ; 206
	i32 132, ; 207
	i32 71, ; 208
	i32 62, ; 209
	i32 15, ; 210
	i32 136, ; 211
	i32 109, ; 212
	i32 106, ; 213
	i32 140, ; 214
	i32 137, ; 215
	i32 64, ; 216
	i32 66, ; 217
	i32 21, ; 218
	i32 49, ; 219
	i32 50, ; 220
	i32 87, ; 221
	i32 27, ; 222
	i32 60, ; 223
	i32 52, ; 224
	i32 6, ; 225
	i32 69, ; 226
	i32 19, ; 227
	i32 87, ; 228
	i32 51, ; 229
	i32 37, ; 230
	i32 160, ; 231
	i32 60, ; 232
	i32 88, ; 233
	i32 128, ; 234
	i32 104, ; 235
	i32 141, ; 236
	i32 73, ; 237
	i32 34, ; 238
	i32 80, ; 239
	i32 162, ; 240
	i32 102, ; 241
	i32 12, ; 242
	i32 92, ; 243
	i32 145, ; 244
	i32 140, ; 245
	i32 111, ; 246
	i32 53, ; 247
	i32 81, ; 248
	i32 153, ; 249
	i32 67, ; 250
	i32 100, ; 251
	i32 143, ; 252
	i32 7, ; 253
	i32 124, ; 254
	i32 72, ; 255
	i32 55, ; 256
	i32 82, ; 257
	i32 24, ; 258
	i32 149, ; 259
	i32 70, ; 260
	i32 161, ; 261
	i32 84, ; 262
	i32 3, ; 263
	i32 133, ; 264
	i32 41, ; 265
	i32 159, ; 266
	i32 47, ; 267
	i32 11, ; 268
	i32 103, ; 269
	i32 61, ; 270
	i32 163, ; 271
	i32 24, ; 272
	i32 23, ; 273
	i32 149, ; 274
	i32 156, ; 275
	i32 31, ; 276
	i32 35, ; 277
	i32 117, ; 278
	i32 76, ; 279
	i32 28, ; 280
	i32 81, ; 281
	i32 40, ; 282
	i32 122, ; 283
	i32 59, ; 284
	i32 163, ; 285
	i32 33, ; 286
	i32 135, ; 287
	i32 80, ; 288
	i32 121, ; 289
	i32 107, ; 290
	i32 68, ; 291
	i32 97, ; 292
	i32 47, ; 293
	i32 98, ; 294
	i32 63, ; 295
	i32 36, ; 296
	i32 146, ; 297
	i32 42, ; 298
	i32 120, ; 299
	i32 134, ; 300
	i32 143, ; 301
	i32 32, ; 302
	i32 95, ; 303
	i32 70, ; 304
	i32 157, ; 305
	i32 83, ; 306
	i32 65, ; 307
	i32 27, ; 308
	i32 9, ; 309
	i32 118, ; 310
	i32 49, ; 311
	i32 131, ; 312
	i32 153, ; 313
	i32 54, ; 314
	i32 51, ; 315
	i32 110, ; 316
	i32 130, ; 317
	i32 22, ; 318
	i32 17, ; 319
	i32 41, ; 320
	i32 29, ; 321
	i32 78, ; 322
	i32 107, ; 323
	i32 94, ; 324
	i32 48, ; 325
	i32 137, ; 326
	i32 78 ; 327
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
