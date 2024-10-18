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

@assembly_image_cache = dso_local local_unnamed_addr global [297 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [330 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 123
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 122
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 136
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 153
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 5: System.Security.Cryptography.Primitives => 0x410f24b => 145
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 54
	i32 117431740, ; 7: System.Runtime.InteropServices => 0x6ffddbc => 135
	i32 149972175, ; 8: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 145
	i32 159306688, ; 9: System.ComponentModel.Annotations => 0x97ed3c0 => 102
	i32 165246403, ; 10: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 11: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 195452805, ; 12: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 13: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 14: System.ComponentModel => 0xc38ff48 => 106
	i32 280992041, ; 15: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 16: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 336156722, ; 18: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 356389973, ; 20: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364942007, ; 21: SkiaSharp.Extended.UI => 0x15c092b7 => 59
	i32 367780167, ; 22: System.IO.Pipes => 0x15ebe147 => 116
	i32 374914964, ; 23: System.Transactions.Local => 0x1658bf94 => 155
	i32 375677976, ; 24: System.Net.ServicePoint.dll => 0x16646418 => 127
	i32 379916513, ; 25: System.Threading.Thread.dll => 0x16a510e1 => 153
	i32 382590210, ; 26: SkiaSharp.Extended.dll => 0x16cddd02 => 58
	i32 385762202, ; 27: System.Memory.dll => 0x16fe439a => 119
	i32 395744057, ; 28: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 29: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 30: System.Collections => 0x1a61054f => 101
	i32 450948140, ; 31: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 451504562, ; 32: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 146
	i32 456227837, ; 33: System.Web.HttpUtility.dll => 0x1b317bfd => 156
	i32 469710990, ; 34: System.dll => 0x1bff388e => 159
	i32 498788369, ; 35: System.ObjectModel => 0x1dbae811 => 130
	i32 500358224, ; 36: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 37: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 504833739, ; 38: SkiaSharp.SceneGraph => 0x1e1726cb => 60
	i32 513247710, ; 39: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 48
	i32 525008092, ; 40: SkiaSharp.dll => 0x1f4afcdc => 57
	i32 539058512, ; 41: Microsoft.Extensions.Logging => 0x20216150 => 44
	i32 586578074, ; 42: MimeKit => 0x22f6789a => 55
	i32 592146354, ; 43: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 44: CommunityToolkit.Maui => 0x239cf51b => 36
	i32 613668793, ; 45: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 142
	i32 627609679, ; 46: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 47: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 48: System.Text.Encodings.Web.dll => 0x27787397 => 149
	i32 672442732, ; 49: System.Collections.Concurrent => 0x2814a96c => 97
	i32 683518922, ; 50: System.Net.Security => 0x28bdabca => 126
	i32 688181140, ; 51: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 52: System.Xml.Linq.dll => 0x29293ff5 => 157
	i32 690602616, ; 53: SkiaSharp.Skottie.dll => 0x2929c278 => 61
	i32 706645707, ; 54: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709152836, ; 55: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 65
	i32 709557578, ; 56: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 57: System.Runtime.Loader.dll => 0x2b15ed29 => 137
	i32 738469988, ; 58: SkiaSharp.SceneGraph.dll => 0x2c042864 => 60
	i32 759454413, ; 59: System.Net.Requests => 0x2d445acd => 125
	i32 762598435, ; 60: System.IO.Pipes.dll => 0x2d745423 => 116
	i32 775507847, ; 61: System.IO.Compression => 0x2e394f87 => 115
	i32 777317022, ; 62: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 778804420, ; 63: SkiaSharp.Extended.UI.dll => 0x2e6b9cc4 => 59
	i32 789151979, ; 64: Microsoft.Extensions.Options => 0x2f0980eb => 47
	i32 804715423, ; 65: System.Data.Common => 0x2ff6fb9f => 108
	i32 823281589, ; 66: System.Private.Uri.dll => 0x311247b5 => 131
	i32 830298997, ; 67: System.IO.Compression.Brotli => 0x317d5b75 => 114
	i32 904024072, ; 68: System.ComponentModel.Primitives.dll => 0x35e25008 => 104
	i32 926902833, ; 69: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 70: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 992768348, ; 71: System.Collections.dll => 0x3b2c715c => 101
	i32 1012816738, ; 72: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1019214401, ; 73: System.Drawing => 0x3cbffa41 => 112
	i32 1028951442, ; 74: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 43
	i32 1029334545, ; 75: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 76: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1036536393, ; 77: System.Drawing.Primitives.dll => 0x3dc84a49 => 111
	i32 1044663988, ; 78: System.Linq.Expressions.dll => 0x3e444eb4 => 117
	i32 1052210849, ; 79: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 80: System.ComponentModel.TypeConverter => 0x408b17f4 => 105
	i32 1084122840, ; 81: Xamarin.Kotlin.StdLib => 0x409e66d8 => 92
	i32 1098259244, ; 82: System => 0x41761b2c => 159
	i32 1118262833, ; 83: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1127624469, ; 84: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 46
	i32 1168523401, ; 85: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 86: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1203215381, ; 87: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 88: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 89: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 90: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1324164729, ; 91: System.Linq => 0x4eed2679 => 118
	i32 1373134921, ; 92: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 93: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1406073936, ; 94: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1408764838, ; 95: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 139
	i32 1411638395, ; 96: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 134
	i32 1430672901, ; 97: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 98: System.Formats.Asn1.dll => 0x568cd628 => 113
	i32 1458022317, ; 99: System.Net.Security.dll => 0x56e7a7ad => 126
	i32 1461004990, ; 100: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 101: System.Collections.Immutable.dll => 0x5718a9ef => 98
	i32 1462112819, ; 102: System.IO.Compression.dll => 0x57261233 => 115
	i32 1469204771, ; 103: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 104: Microsoft.Extensions.Primitives => 0x57a5e912 => 48
	i32 1479771757, ; 105: System.Collections.Immutable => 0x5833866d => 98
	i32 1480492111, ; 106: System.IO.Compression.Brotli.dll => 0x583e844f => 114
	i32 1487239319, ; 107: Microsoft.Win32.Primitives => 0x58a57897 => 95
	i32 1493001747, ; 108: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1511525525, ; 109: MySqlConnector => 0x5a180c95 => 56
	i32 1514721132, ; 110: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 111: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 151
	i32 1551623176, ; 112: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 113: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1623212457, ; 114: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 63
	i32 1624863272, ; 115: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1634654947, ; 116: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 37
	i32 1636350590, ; 117: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 118: System.Net.Http.dll => 0x61b9038d => 120
	i32 1639986890, ; 119: System.Text.RegularExpressions => 0x61c036ca => 151
	i32 1641389582, ; 120: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 103
	i32 1657153582, ; 121: System.Runtime => 0x62c6282e => 140
	i32 1658251792, ; 122: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 91
	i32 1677501392, ; 123: System.Net.Primitives.dll => 0x63fca3d0 => 124
	i32 1679769178, ; 124: System.Security.Cryptography => 0x641f3e5a => 147
	i32 1696967625, ; 125: System.Security.Cryptography.Csp => 0x6525abc9 => 143
	i32 1724472758, ; 126: SkiaSharp.Extended => 0x66c95db6 => 58
	i32 1729485958, ; 127: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1733338956, ; 128: MailKit => 0x6750a74c => 38
	i32 1736233607, ; 129: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 130: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 131: System.Transactions.Local.dll => 0x67fe8db2 => 155
	i32 1750313021, ; 132: Microsoft.Win32.Primitives.dll => 0x6853a83d => 95
	i32 1763938596, ; 133: System.Diagnostics.TraceSource.dll => 0x69239124 => 110
	i32 1766324549, ; 134: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 135: Microsoft.Extensions.Logging.dll => 0x6988f147 => 44
	i32 1780572499, ; 136: Mono.Android.Runtime.dll => 0x6a216153 => 163
	i32 1782862114, ; 137: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1783002880, ; 138: Podbor => 0x6a467700 => 94
	i32 1788241197, ; 139: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 140: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 141: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 142: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 92
	i32 1813201214, ; 143: Xamarin.Google.Android.Material => 0x6c13413e => 91
	i32 1818569960, ; 144: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1824175904, ; 145: System.Text.Encoding.Extensions => 0x6cbab720 => 148
	i32 1824722060, ; 146: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 139
	i32 1828688058, ; 147: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 45
	i32 1842015223, ; 148: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 149: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 150: System.Linq.Expressions => 0x6ec71a65 => 117
	i32 1875935024, ; 151: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 152: System.Collections.NonGeneric.dll => 0x71dc7c8b => 99
	i32 1939592360, ; 153: System.Private.Xml.Linq => 0x739bd4a8 => 132
	i32 1968388702, ; 154: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 40
	i32 2003115576, ; 155: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 156: System.Buffers.dll => 0x77ec19b4 => 96
	i32 2019465201, ; 157: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 158: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2026931361, ; 159: MailKit.dll => 0x78d084a1 => 38
	i32 2045470958, ; 160: System.Private.Xml => 0x79eb68ee => 133
	i32 2055257422, ; 161: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 162: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 163: System.Diagnostics.TraceSource => 0x7b6f419e => 110
	i32 2079903147, ; 164: System.Runtime.dll => 0x7bf8cdab => 140
	i32 2090596640, ; 165: System.Numerics.Vectors => 0x7c9bf920 => 129
	i32 2127167465, ; 166: System.Console => 0x7ec9ffe9 => 107
	i32 2142473426, ; 167: System.Collections.Specialized => 0x7fb38cd2 => 100
	i32 2159891885, ; 168: Microsoft.Maui => 0x80bd55ad => 52
	i32 2169148018, ; 169: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 170: Microsoft.Extensions.Options.dll => 0x820d22b3 => 47
	i32 2188602587, ; 171: Microcharts.Maui => 0x82736cdb => 39
	i32 2192057212, ; 172: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 45
	i32 2193016926, ; 173: System.ObjectModel.dll => 0x82b6c85e => 130
	i32 2201107256, ; 174: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 93
	i32 2201231467, ; 175: System.Net.Http => 0x8334206b => 120
	i32 2207618523, ; 176: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2222056684, ; 177: System.Threading.Tasks.Parallel => 0x8471e4ec => 152
	i32 2266799131, ; 178: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 41
	i32 2270573516, ; 179: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 180: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2295906218, ; 181: System.Net.Sockets => 0x88d8bfaa => 128
	i32 2298471582, ; 182: System.Net.Mail => 0x88ffe49e => 121
	i32 2303942373, ; 183: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 184: System.Private.CoreLib.dll => 0x896b7878 => 161
	i32 2320631194, ; 185: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 152
	i32 2353062107, ; 186: System.Net.Primitives => 0x8c40e0db => 124
	i32 2364201794, ; 187: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 64
	i32 2368005991, ; 188: System.Xml.ReaderWriter.dll => 0x8d24e767 => 158
	i32 2371007202, ; 189: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 40
	i32 2378619854, ; 190: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 143
	i32 2395872292, ; 191: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 192: System.Web.HttpUtility => 0x8f24faee => 156
	i32 2427813419, ; 193: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 194: System.Console.dll => 0x912896e5 => 107
	i32 2458678730, ; 195: System.Net.Sockets.dll => 0x928c75ca => 128
	i32 2471841756, ; 196: netstandard.dll => 0x93554fdc => 160
	i32 2475788418, ; 197: Java.Interop.dll => 0x93918882 => 162
	i32 2480646305, ; 198: Microsoft.Maui.Controls => 0x93dba8a1 => 50
	i32 2483903535, ; 199: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 103
	i32 2484371297, ; 200: System.Net.ServicePoint => 0x94147f61 => 127
	i32 2498657740, ; 201: BouncyCastle.Cryptography.dll => 0x94ee7dcc => 35
	i32 2550873716, ; 202: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 203: System.Text.Encodings.Web => 0x9930ee42 => 149
	i32 2585220780, ; 204: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 148
	i32 2593496499, ; 205: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 206: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 93
	i32 2616218305, ; 207: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 46
	i32 2617129537, ; 208: System.Private.Xml.dll => 0x9bfe3a41 => 133
	i32 2620871830, ; 209: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2625339995, ; 210: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 64
	i32 2626831493, ; 211: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 212: System.Runtime.Loader => 0x9ec4cf01 => 137
	i32 2665622720, ; 213: System.Drawing.Primitives => 0x9ee22cc0 => 111
	i32 2676780864, ; 214: System.Data.Common.dll => 0x9f8c6f40 => 108
	i32 2717744543, ; 215: System.Security.Claims => 0xa1fd7d9f => 141
	i32 2724373263, ; 216: System.Runtime.Numerics.dll => 0xa262a30f => 138
	i32 2732626843, ; 217: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2737747696, ; 218: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2752995522, ; 219: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 220: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 51
	i32 2764765095, ; 221: Microsoft.Maui.dll => 0xa4caf7a7 => 52
	i32 2778768386, ; 222: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2785988530, ; 223: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 224: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 62
	i32 2801831435, ; 225: Microsoft.Maui.Graphics => 0xa7008e0b => 54
	i32 2806116107, ; 226: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 227: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 228: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 229: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2861189240, ; 230: Microsoft.Maui.Essentials => 0xaa8a4878 => 53
	i32 2868488919, ; 231: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 37
	i32 2909740682, ; 232: System.Private.CoreLib => 0xad6f1e8a => 161
	i32 2912489636, ; 233: SkiaSharp.Views.Android => 0xad9910a4 => 62
	i32 2916838712, ; 234: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 235: System.Numerics.Vectors.dll => 0xae037813 => 129
	i32 2959614098, ; 236: System.ComponentModel.dll => 0xb0682092 => 106
	i32 2972252294, ; 237: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 142
	i32 2978675010, ; 238: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3038032645, ; 239: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 240: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3059408633, ; 241: Mono.Android.Runtime => 0xb65adef9 => 163
	i32 3059793426, ; 242: System.ComponentModel.Primitives => 0xb660be12 => 104
	i32 3077302341, ; 243: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3087854663, ; 244: Podbor.dll => 0xb80cec47 => 94
	i32 3090735792, ; 245: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 146
	i32 3099732863, ; 246: System.Security.Claims.dll => 0xb8c22b7f => 141
	i32 3103600923, ; 247: System.Formats.Asn1 => 0xb8fd311b => 113
	i32 3171180504, ; 248: MimeKit.dll => 0xbd045fd8 => 55
	i32 3178803400, ; 249: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3220365878, ; 250: System.Threading => 0xbff2e236 => 154
	i32 3258312781, ; 251: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3280506390, ; 252: System.ComponentModel.Annotations.dll => 0xc3888e16 => 102
	i32 3290767353, ; 253: System.Security.Cryptography.Encoding => 0xc4251ff9 => 144
	i32 3305363605, ; 254: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 255: System.Net.Requests.dll => 0xc5b097e4 => 125
	i32 3317135071, ; 256: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3340387945, ; 257: SkiaSharp => 0xc71a4669 => 57
	i32 3346324047, ; 258: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3357674450, ; 259: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 260: System.Text.Json => 0xc82afec1 => 150
	i32 3362522851, ; 261: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 262: Java.Interop => 0xc8a662e9 => 162
	i32 3374999561, ; 263: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3381016424, ; 264: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 265: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 134
	i32 3428513518, ; 266: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 42
	i32 3430777524, ; 267: netstandard => 0xcc7d82b4 => 160
	i32 3452344032, ; 268: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 49
	i32 3463511458, ; 269: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 270: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 105
	i32 3473156932, ; 271: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 63
	i32 3476120550, ; 272: Mono.Android => 0xcf3163e6 => 164
	i32 3479583265, ; 273: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 274: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 275: System.Text.Json.dll => 0xcfbaacae => 150
	i32 3509114376, ; 276: System.Xml.Linq => 0xd128d608 => 157
	i32 3580758918, ; 277: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3605570793, ; 278: BouncyCastle.Cryptography => 0xd6e8a4e9 => 35
	i32 3608519521, ; 279: System.Linq.dll => 0xd715a361 => 118
	i32 3641597786, ; 280: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 281: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 282: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3657292374, ; 283: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 41
	i32 3660523487, ; 284: System.Net.NetworkInformation => 0xda2f27df => 123
	i32 3663323240, ; 285: SkiaSharp.Skottie => 0xda59e068 => 61
	i32 3672681054, ; 286: Mono.Android.dll => 0xdae8aa5e => 164
	i32 3697841164, ; 287: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3716563718, ; 288: System.Runtime.Intrinsics => 0xdd864306 => 136
	i32 3724971120, ; 289: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3732100267, ; 290: System.Net.NameResolution => 0xde7354ab => 122
	i32 3748608112, ; 291: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 109
	i32 3786282454, ; 292: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 293: System.Collections.NonGeneric => 0xe2098b0b => 99
	i32 3800979733, ; 294: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 49
	i32 3802395368, ; 295: System.Collections.Specialized.dll => 0xe2a3f2e8 => 100
	i32 3807198597, ; 296: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 65
	i32 3817368567, ; 297: CommunityToolkit.Maui.dll => 0xe3886bf7 => 36
	i32 3823082795, ; 298: System.Security.Cryptography.dll => 0xe3df9d2b => 147
	i32 3841636137, ; 299: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 43
	i32 3844307129, ; 300: System.Net.Mail.dll => 0xe52378b9 => 121
	i32 3849253459, ; 301: System.Runtime.InteropServices.dll => 0xe56ef253 => 135
	i32 3875112723, ; 302: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 144
	i32 3889960447, ; 303: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 304: System.Collections.Concurrent.dll => 0xe839deed => 97
	i32 3896760992, ; 305: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3928044579, ; 306: System.Xml.ReaderWriter => 0xea213423 => 158
	i32 3931092270, ; 307: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3955647286, ; 308: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3980434154, ; 309: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 310: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 311: System.Memory => 0xeff49a63 => 119
	i32 4046471985, ; 312: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 51
	i32 4068434129, ; 313: System.Private.Xml.Linq.dll => 0xf27f60d1 => 132
	i32 4073602200, ; 314: System.Threading.dll => 0xf2ce3c98 => 154
	i32 4079385022, ; 315: MySqlConnector.dll => 0xf32679be => 56
	i32 4094352644, ; 316: Microsoft.Maui.Essentials.dll => 0xf40add04 => 53
	i32 4099507663, ; 317: System.Drawing.dll => 0xf45985cf => 112
	i32 4100113165, ; 318: System.Private.Uri => 0xf462c30d => 131
	i32 4102112229, ; 319: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 320: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 321: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 42
	i32 4150914736, ; 322: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 323: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4189085287, ; 324: Microcharts.Maui.dll => 0xf9b05e67 => 39
	i32 4213026141, ; 325: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 109
	i32 4260525087, ; 326: System.Buffers => 0xfdf2741f => 96
	i32 4271975918, ; 327: Microsoft.Maui.Controls.dll => 0xfea12dee => 50
	i32 4274976490, ; 328: System.Runtime.Numerics => 0xfecef6ea => 138
	i32 4292120959 ; 329: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [330 x i32] [
	i32 123, ; 0
	i32 122, ; 1
	i32 136, ; 2
	i32 153, ; 3
	i32 33, ; 4
	i32 145, ; 5
	i32 54, ; 6
	i32 135, ; 7
	i32 145, ; 8
	i32 102, ; 9
	i32 70, ; 10
	i32 88, ; 11
	i32 30, ; 12
	i32 31, ; 13
	i32 106, ; 14
	i32 2, ; 15
	i32 30, ; 16
	i32 66, ; 17
	i32 15, ; 18
	i32 77, ; 19
	i32 14, ; 20
	i32 59, ; 21
	i32 116, ; 22
	i32 155, ; 23
	i32 127, ; 24
	i32 153, ; 25
	i32 58, ; 26
	i32 119, ; 27
	i32 34, ; 28
	i32 26, ; 29
	i32 101, ; 30
	i32 76, ; 31
	i32 146, ; 32
	i32 156, ; 33
	i32 159, ; 34
	i32 130, ; 35
	i32 13, ; 36
	i32 7, ; 37
	i32 60, ; 38
	i32 48, ; 39
	i32 57, ; 40
	i32 44, ; 41
	i32 55, ; 42
	i32 21, ; 43
	i32 36, ; 44
	i32 142, ; 45
	i32 74, ; 46
	i32 19, ; 47
	i32 149, ; 48
	i32 97, ; 49
	i32 126, ; 50
	i32 1, ; 51
	i32 157, ; 52
	i32 61, ; 53
	i32 16, ; 54
	i32 65, ; 55
	i32 4, ; 56
	i32 137, ; 57
	i32 60, ; 58
	i32 125, ; 59
	i32 116, ; 60
	i32 115, ; 61
	i32 25, ; 62
	i32 59, ; 63
	i32 47, ; 64
	i32 108, ; 65
	i32 131, ; 66
	i32 114, ; 67
	i32 104, ; 68
	i32 28, ; 69
	i32 77, ; 70
	i32 101, ; 71
	i32 87, ; 72
	i32 112, ; 73
	i32 43, ; 74
	i32 3, ; 75
	i32 67, ; 76
	i32 111, ; 77
	i32 117, ; 78
	i32 79, ; 79
	i32 105, ; 80
	i32 92, ; 81
	i32 159, ; 82
	i32 16, ; 83
	i32 46, ; 84
	i32 22, ; 85
	i32 84, ; 86
	i32 20, ; 87
	i32 18, ; 88
	i32 2, ; 89
	i32 75, ; 90
	i32 118, ; 91
	i32 32, ; 92
	i32 87, ; 93
	i32 71, ; 94
	i32 139, ; 95
	i32 134, ; 96
	i32 0, ; 97
	i32 113, ; 98
	i32 126, ; 99
	i32 6, ; 100
	i32 98, ; 101
	i32 115, ; 102
	i32 68, ; 103
	i32 48, ; 104
	i32 98, ; 105
	i32 114, ; 106
	i32 95, ; 107
	i32 10, ; 108
	i32 56, ; 109
	i32 5, ; 110
	i32 151, ; 111
	i32 25, ; 112
	i32 81, ; 113
	i32 63, ; 114
	i32 90, ; 115
	i32 37, ; 116
	i32 73, ; 117
	i32 120, ; 118
	i32 151, ; 119
	i32 103, ; 120
	i32 140, ; 121
	i32 91, ; 122
	i32 124, ; 123
	i32 147, ; 124
	i32 143, ; 125
	i32 58, ; 126
	i32 69, ; 127
	i32 38, ; 128
	i32 23, ; 129
	i32 1, ; 130
	i32 155, ; 131
	i32 95, ; 132
	i32 110, ; 133
	i32 88, ; 134
	i32 44, ; 135
	i32 163, ; 136
	i32 17, ; 137
	i32 94, ; 138
	i32 76, ; 139
	i32 9, ; 140
	i32 81, ; 141
	i32 92, ; 142
	i32 91, ; 143
	i32 85, ; 144
	i32 148, ; 145
	i32 139, ; 146
	i32 45, ; 147
	i32 29, ; 148
	i32 26, ; 149
	i32 117, ; 150
	i32 8, ; 151
	i32 99, ; 152
	i32 132, ; 153
	i32 40, ; 154
	i32 5, ; 155
	i32 96, ; 156
	i32 79, ; 157
	i32 0, ; 158
	i32 38, ; 159
	i32 133, ; 160
	i32 78, ; 161
	i32 4, ; 162
	i32 110, ; 163
	i32 140, ; 164
	i32 129, ; 165
	i32 107, ; 166
	i32 100, ; 167
	i32 52, ; 168
	i32 12, ; 169
	i32 47, ; 170
	i32 39, ; 171
	i32 45, ; 172
	i32 130, ; 173
	i32 93, ; 174
	i32 120, ; 175
	i32 14, ; 176
	i32 152, ; 177
	i32 41, ; 178
	i32 8, ; 179
	i32 86, ; 180
	i32 128, ; 181
	i32 121, ; 182
	i32 18, ; 183
	i32 161, ; 184
	i32 152, ; 185
	i32 124, ; 186
	i32 64, ; 187
	i32 158, ; 188
	i32 40, ; 189
	i32 143, ; 190
	i32 13, ; 191
	i32 156, ; 192
	i32 10, ; 193
	i32 107, ; 194
	i32 128, ; 195
	i32 160, ; 196
	i32 162, ; 197
	i32 50, ; 198
	i32 103, ; 199
	i32 127, ; 200
	i32 35, ; 201
	i32 11, ; 202
	i32 149, ; 203
	i32 148, ; 204
	i32 20, ; 205
	i32 93, ; 206
	i32 46, ; 207
	i32 133, ; 208
	i32 73, ; 209
	i32 64, ; 210
	i32 15, ; 211
	i32 137, ; 212
	i32 111, ; 213
	i32 108, ; 214
	i32 141, ; 215
	i32 138, ; 216
	i32 66, ; 217
	i32 68, ; 218
	i32 21, ; 219
	i32 51, ; 220
	i32 52, ; 221
	i32 89, ; 222
	i32 27, ; 223
	i32 62, ; 224
	i32 54, ; 225
	i32 6, ; 226
	i32 71, ; 227
	i32 19, ; 228
	i32 89, ; 229
	i32 53, ; 230
	i32 37, ; 231
	i32 161, ; 232
	i32 62, ; 233
	i32 90, ; 234
	i32 129, ; 235
	i32 106, ; 236
	i32 142, ; 237
	i32 75, ; 238
	i32 34, ; 239
	i32 82, ; 240
	i32 163, ; 241
	i32 104, ; 242
	i32 12, ; 243
	i32 94, ; 244
	i32 146, ; 245
	i32 141, ; 246
	i32 113, ; 247
	i32 55, ; 248
	i32 83, ; 249
	i32 154, ; 250
	i32 69, ; 251
	i32 102, ; 252
	i32 144, ; 253
	i32 7, ; 254
	i32 125, ; 255
	i32 74, ; 256
	i32 57, ; 257
	i32 84, ; 258
	i32 24, ; 259
	i32 150, ; 260
	i32 72, ; 261
	i32 162, ; 262
	i32 86, ; 263
	i32 3, ; 264
	i32 134, ; 265
	i32 42, ; 266
	i32 160, ; 267
	i32 49, ; 268
	i32 11, ; 269
	i32 105, ; 270
	i32 63, ; 271
	i32 164, ; 272
	i32 24, ; 273
	i32 23, ; 274
	i32 150, ; 275
	i32 157, ; 276
	i32 31, ; 277
	i32 35, ; 278
	i32 118, ; 279
	i32 78, ; 280
	i32 28, ; 281
	i32 83, ; 282
	i32 41, ; 283
	i32 123, ; 284
	i32 61, ; 285
	i32 164, ; 286
	i32 33, ; 287
	i32 136, ; 288
	i32 82, ; 289
	i32 122, ; 290
	i32 109, ; 291
	i32 70, ; 292
	i32 99, ; 293
	i32 49, ; 294
	i32 100, ; 295
	i32 65, ; 296
	i32 36, ; 297
	i32 147, ; 298
	i32 43, ; 299
	i32 121, ; 300
	i32 135, ; 301
	i32 144, ; 302
	i32 32, ; 303
	i32 97, ; 304
	i32 72, ; 305
	i32 158, ; 306
	i32 85, ; 307
	i32 67, ; 308
	i32 27, ; 309
	i32 9, ; 310
	i32 119, ; 311
	i32 51, ; 312
	i32 132, ; 313
	i32 154, ; 314
	i32 56, ; 315
	i32 53, ; 316
	i32 112, ; 317
	i32 131, ; 318
	i32 22, ; 319
	i32 17, ; 320
	i32 42, ; 321
	i32 29, ; 322
	i32 80, ; 323
	i32 39, ; 324
	i32 109, ; 325
	i32 96, ; 326
	i32 50, ; 327
	i32 138, ; 328
	i32 80 ; 329
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
