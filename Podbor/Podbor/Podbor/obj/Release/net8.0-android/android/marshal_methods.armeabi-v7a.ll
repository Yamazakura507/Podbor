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

@assembly_image_cache = dso_local local_unnamed_addr global [147 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [294 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 113
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 112
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 135
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 124
	i32 165246403, ; 6: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 61
	i32 182336117, ; 7: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 79
	i32 195452805, ; 8: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 9: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 10: System.ComponentModel => 0xc38ff48 => 96
	i32 280992041, ; 11: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 57
	i32 336156722, ; 14: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 68
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364942007, ; 17: SkiaSharp.Extended.UI => 0x15c092b7 => 51
	i32 367780167, ; 18: System.IO.Pipes => 0x15ebe147 => 106
	i32 374914964, ; 19: System.Transactions.Local => 0x1658bf94 => 137
	i32 375677976, ; 20: System.Net.ServicePoint.dll => 0x16646418 => 117
	i32 379916513, ; 21: System.Threading.Thread.dll => 0x16a510e1 => 135
	i32 382590210, ; 22: SkiaSharp.Extended.dll => 0x16cddd02 => 50
	i32 385762202, ; 23: System.Memory.dll => 0x16fe439a => 109
	i32 395744057, ; 24: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 25: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 26: System.Collections => 0x1a61054f => 92
	i32 450948140, ; 27: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 67
	i32 469710990, ; 28: System.dll => 0x1bff388e => 141
	i32 498788369, ; 29: System.ObjectModel => 0x1dbae811 => 120
	i32 500358224, ; 30: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 31: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 504833739, ; 32: SkiaSharp.SceneGraph => 0x1e1726cb => 52
	i32 513247710, ; 33: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 525008092, ; 34: SkiaSharp.dll => 0x1f4afcdc => 49
	i32 539058512, ; 35: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 592146354, ; 36: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 37: Xamarin.AndroidX.CustomView => 0x2568904f => 65
	i32 627931235, ; 38: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 39: System.Text.Encodings.Web.dll => 0x27787397 => 132
	i32 672442732, ; 40: System.Collections.Concurrent => 0x2814a96c => 88
	i32 683518922, ; 41: System.Net.Security => 0x28bdabca => 116
	i32 688181140, ; 42: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 43: System.Xml.Linq.dll => 0x29293ff5 => 138
	i32 690602616, ; 44: SkiaSharp.Skottie.dll => 0x2929c278 => 53
	i32 706645707, ; 45: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 46: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 47: System.Runtime.Loader.dll => 0x2b15ed29 => 125
	i32 738469988, ; 48: SkiaSharp.SceneGraph.dll => 0x2c042864 => 52
	i32 759454413, ; 49: System.Net.Requests => 0x2d445acd => 115
	i32 762598435, ; 50: System.IO.Pipes.dll => 0x2d745423 => 106
	i32 775507847, ; 51: System.IO.Compression => 0x2e394f87 => 105
	i32 777317022, ; 52: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 778804420, ; 53: SkiaSharp.Extended.UI.dll => 0x2e6b9cc4 => 51
	i32 789151979, ; 54: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 804715423, ; 55: System.Data.Common => 0x2ff6fb9f => 98
	i32 823281589, ; 56: System.Private.Uri.dll => 0x311247b5 => 121
	i32 830298997, ; 57: System.IO.Compression.Brotli => 0x317d5b75 => 104
	i32 904024072, ; 58: System.ComponentModel.Primitives.dll => 0x35e25008 => 94
	i32 926902833, ; 59: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 60: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 68
	i32 992768348, ; 61: System.Collections.dll => 0x3b2c715c => 92
	i32 1012816738, ; 62: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 78
	i32 1019214401, ; 63: System.Drawing => 0x3cbffa41 => 102
	i32 1028951442, ; 64: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1029334545, ; 65: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 66: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 58
	i32 1036536393, ; 67: System.Drawing.Primitives.dll => 0x3dc84a49 => 101
	i32 1044663988, ; 68: System.Linq.Expressions.dll => 0x3e444eb4 => 107
	i32 1052210849, ; 69: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 70
	i32 1082857460, ; 70: System.ComponentModel.TypeConverter => 0x408b17f4 => 95
	i32 1084122840, ; 71: Xamarin.Kotlin.StdLib => 0x409e66d8 => 83
	i32 1098259244, ; 72: System => 0x41761b2c => 141
	i32 1118262833, ; 73: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 74: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 75: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 75
	i32 1203215381, ; 76: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 77: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 78: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 79: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 66
	i32 1324164729, ; 80: System.Linq => 0x4eed2679 => 108
	i32 1373134921, ; 81: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 82: Xamarin.AndroidX.SavedState => 0x52114ed3 => 78
	i32 1406073936, ; 83: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 62
	i32 1408764838, ; 84: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 127
	i32 1430672901, ; 85: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 86: System.Formats.Asn1.dll => 0x568cd628 => 103
	i32 1458022317, ; 87: System.Net.Security.dll => 0x56e7a7ad => 116
	i32 1461004990, ; 88: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 89: System.Collections.Immutable.dll => 0x5718a9ef => 89
	i32 1462112819, ; 90: System.IO.Compression.dll => 0x57261233 => 105
	i32 1469204771, ; 91: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 59
	i32 1470490898, ; 92: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1479771757, ; 93: System.Collections.Immutable => 0x5833866d => 89
	i32 1480492111, ; 94: System.IO.Compression.Brotli.dll => 0x583e844f => 104
	i32 1487239319, ; 95: Microsoft.Win32.Primitives => 0x58a57897 => 86
	i32 1493001747, ; 96: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1511525525, ; 97: MySqlConnector => 0x5a180c95 => 48
	i32 1514721132, ; 98: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 99: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 134
	i32 1551623176, ; 100: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 101: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 72
	i32 1623212457, ; 102: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 55
	i32 1624863272, ; 103: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 81
	i32 1636350590, ; 104: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 64
	i32 1639515021, ; 105: System.Net.Http.dll => 0x61b9038d => 110
	i32 1639986890, ; 106: System.Text.RegularExpressions => 0x61c036ca => 134
	i32 1641389582, ; 107: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 93
	i32 1657153582, ; 108: System.Runtime => 0x62c6282e => 128
	i32 1658251792, ; 109: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 82
	i32 1677501392, ; 110: System.Net.Primitives.dll => 0x63fca3d0 => 114
	i32 1679769178, ; 111: System.Security.Cryptography => 0x641f3e5a => 130
	i32 1724472758, ; 112: SkiaSharp.Extended => 0x66c95db6 => 50
	i32 1729485958, ; 113: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 60
	i32 1736233607, ; 114: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 115: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 116: System.Transactions.Local.dll => 0x67fe8db2 => 137
	i32 1750313021, ; 117: Microsoft.Win32.Primitives.dll => 0x6853a83d => 86
	i32 1763938596, ; 118: System.Diagnostics.TraceSource.dll => 0x69239124 => 100
	i32 1766324549, ; 119: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 79
	i32 1770582343, ; 120: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 121: Mono.Android.Runtime.dll => 0x6a216153 => 145
	i32 1782862114, ; 122: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1783002880, ; 123: Podbor => 0x6a467700 => 85
	i32 1788241197, ; 124: Xamarin.AndroidX.Fragment => 0x6a96652d => 67
	i32 1793755602, ; 125: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 126: Xamarin.AndroidX.Loader => 0x6bcd3296 => 72
	i32 1813058853, ; 127: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 83
	i32 1813201214, ; 128: Xamarin.Google.Android.Material => 0x6c13413e => 82
	i32 1818569960, ; 129: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 76
	i32 1824175904, ; 130: System.Text.Encoding.Extensions => 0x6cbab720 => 131
	i32 1824722060, ; 131: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 127
	i32 1828688058, ; 132: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1842015223, ; 133: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 134: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 135: System.Linq.Expressions => 0x6ec71a65 => 107
	i32 1875935024, ; 136: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 137: System.Collections.NonGeneric.dll => 0x71dc7c8b => 90
	i32 1939592360, ; 138: System.Private.Xml.Linq => 0x739bd4a8 => 122
	i32 1968388702, ; 139: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 140: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 141: System.Buffers.dll => 0x77ec19b4 => 87
	i32 2019465201, ; 142: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 70
	i32 2025202353, ; 143: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 144: System.Private.Xml => 0x79eb68ee => 123
	i32 2055257422, ; 145: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 69
	i32 2066184531, ; 146: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 147: System.Diagnostics.TraceSource => 0x7b6f419e => 100
	i32 2079903147, ; 148: System.Runtime.dll => 0x7bf8cdab => 128
	i32 2090596640, ; 149: System.Numerics.Vectors => 0x7c9bf920 => 119
	i32 2127167465, ; 150: System.Console => 0x7ec9ffe9 => 97
	i32 2142473426, ; 151: System.Collections.Specialized => 0x7fb38cd2 => 91
	i32 2143790110, ; 152: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 140
	i32 2159891885, ; 153: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 154: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 155: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 156: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 157: System.ObjectModel.dll => 0x82b6c85e => 120
	i32 2201107256, ; 158: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 84
	i32 2201231467, ; 159: System.Net.Http => 0x8334206b => 110
	i32 2207618523, ; 160: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 161: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2270573516, ; 162: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 163: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 77
	i32 2295906218, ; 164: System.Net.Sockets => 0x88d8bfaa => 118
	i32 2298471582, ; 165: System.Net.Mail => 0x88ffe49e => 111
	i32 2303942373, ; 166: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 167: System.Private.CoreLib.dll => 0x896b7878 => 143
	i32 2353062107, ; 168: System.Net.Primitives => 0x8c40e0db => 114
	i32 2364201794, ; 169: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 56
	i32 2368005991, ; 170: System.Xml.ReaderWriter.dll => 0x8d24e767 => 139
	i32 2371007202, ; 171: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 172: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 173: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 174: System.Console.dll => 0x912896e5 => 97
	i32 2458678730, ; 175: System.Net.Sockets.dll => 0x928c75ca => 118
	i32 2471841756, ; 176: netstandard.dll => 0x93554fdc => 142
	i32 2475788418, ; 177: Java.Interop.dll => 0x93918882 => 144
	i32 2480646305, ; 178: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2483903535, ; 179: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 93
	i32 2484371297, ; 180: System.Net.ServicePoint => 0x94147f61 => 117
	i32 2550873716, ; 181: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 182: System.Text.Encodings.Web => 0x9930ee42 => 132
	i32 2585220780, ; 183: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 131
	i32 2593496499, ; 184: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 185: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 84
	i32 2617129537, ; 186: System.Private.Xml.dll => 0x9bfe3a41 => 123
	i32 2620871830, ; 187: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 64
	i32 2625339995, ; 188: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 56
	i32 2626831493, ; 189: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 190: System.Runtime.Loader => 0x9ec4cf01 => 125
	i32 2665622720, ; 191: System.Drawing.Primitives => 0x9ee22cc0 => 101
	i32 2676780864, ; 192: System.Data.Common.dll => 0x9f8c6f40 => 98
	i32 2717744543, ; 193: System.Security.Claims => 0xa1fd7d9f => 129
	i32 2724373263, ; 194: System.Runtime.Numerics.dll => 0xa262a30f => 126
	i32 2732626843, ; 195: Xamarin.AndroidX.Activity => 0xa2e0939b => 57
	i32 2737747696, ; 196: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 59
	i32 2752995522, ; 197: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 198: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 199: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 200: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 80
	i32 2785988530, ; 201: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 202: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 54
	i32 2801831435, ; 203: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2806116107, ; 204: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 205: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 62
	i32 2831556043, ; 206: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 207: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 80
	i32 2861189240, ; 208: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 209: System.Private.CoreLib => 0xad6f1e8a => 143
	i32 2912489636, ; 210: SkiaSharp.Views.Android => 0xad9910a4 => 54
	i32 2916838712, ; 211: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 81
	i32 2919462931, ; 212: System.Numerics.Vectors.dll => 0xae037813 => 119
	i32 2959614098, ; 213: System.ComponentModel.dll => 0xb0682092 => 96
	i32 2978675010, ; 214: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 66
	i32 3038032645, ; 215: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 216: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 73
	i32 3059408633, ; 217: Mono.Android.Runtime => 0xb65adef9 => 145
	i32 3059793426, ; 218: System.ComponentModel.Primitives => 0xb660be12 => 94
	i32 3077302341, ; 219: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3087854663, ; 220: Podbor.dll => 0xb80cec47 => 85
	i32 3099732863, ; 221: System.Security.Claims.dll => 0xb8c22b7f => 129
	i32 3103600923, ; 222: System.Formats.Asn1 => 0xb8fd311b => 103
	i32 3178803400, ; 223: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 74
	i32 3220365878, ; 224: System.Threading => 0xbff2e236 => 136
	i32 3258312781, ; 225: Xamarin.AndroidX.CardView => 0xc235e84d => 60
	i32 3305363605, ; 226: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 227: System.Net.Requests.dll => 0xc5b097e4 => 115
	i32 3317135071, ; 228: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 65
	i32 3340387945, ; 229: SkiaSharp => 0xc71a4669 => 49
	i32 3346324047, ; 230: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 75
	i32 3357674450, ; 231: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 232: System.Text.Json => 0xc82afec1 => 133
	i32 3362522851, ; 233: Xamarin.AndroidX.Core => 0xc86c06e3 => 63
	i32 3366347497, ; 234: Java.Interop => 0xc8a662e9 => 144
	i32 3374999561, ; 235: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 77
	i32 3381016424, ; 236: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 237: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3430777524, ; 238: netstandard => 0xcc7d82b4 => 142
	i32 3463511458, ; 239: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 240: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 95
	i32 3473156932, ; 241: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 55
	i32 3476120550, ; 242: Mono.Android => 0xcf3163e6 => 146
	i32 3479583265, ; 243: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 244: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 245: System.Text.Json.dll => 0xcfbaacae => 133
	i32 3509114376, ; 246: System.Xml.Linq => 0xd128d608 => 138
	i32 3580758918, ; 247: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 248: System.Linq.dll => 0xd715a361 => 108
	i32 3641597786, ; 249: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 69
	i32 3643446276, ; 250: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 251: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 74
	i32 3657292374, ; 252: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3660523487, ; 253: System.Net.NetworkInformation => 0xda2f27df => 113
	i32 3663323240, ; 254: SkiaSharp.Skottie => 0xda59e068 => 53
	i32 3672681054, ; 255: Mono.Android.dll => 0xdae8aa5e => 146
	i32 3697841164, ; 256: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 257: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 73
	i32 3732100267, ; 258: System.Net.NameResolution => 0xde7354ab => 112
	i32 3748608112, ; 259: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 99
	i32 3786282454, ; 260: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 61
	i32 3792276235, ; 261: System.Collections.NonGeneric => 0xe2098b0b => 90
	i32 3802395368, ; 262: System.Collections.Specialized.dll => 0xe2a3f2e8 => 91
	i32 3823082795, ; 263: System.Security.Cryptography.dll => 0xe3df9d2b => 130
	i32 3841636137, ; 264: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3844307129, ; 265: System.Net.Mail.dll => 0xe52378b9 => 111
	i32 3849253459, ; 266: System.Runtime.InteropServices.dll => 0xe56ef253 => 124
	i32 3889960447, ; 267: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 268: System.Collections.Concurrent.dll => 0xe839deed => 88
	i32 3896760992, ; 269: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 63
	i32 3928044579, ; 270: System.Xml.ReaderWriter => 0xea213423 => 139
	i32 3931092270, ; 271: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 76
	i32 3955647286, ; 272: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 58
	i32 3980434154, ; 273: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 274: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 275: System.Memory => 0xeff49a63 => 109
	i32 4046471985, ; 276: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4068434129, ; 277: System.Private.Xml.Linq.dll => 0xf27f60d1 => 122
	i32 4073602200, ; 278: System.Threading.dll => 0xf2ce3c98 => 136
	i32 4079385022, ; 279: MySqlConnector.dll => 0xf32679be => 48
	i32 4094352644, ; 280: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4099507663, ; 281: System.Drawing.dll => 0xf45985cf => 102
	i32 4100113165, ; 282: System.Private.Uri => 0xf462c30d => 121
	i32 4102112229, ; 283: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 284: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 285: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4150914736, ; 286: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 287: System.Xml.XmlSerializer => 0xf7e95c85 => 140
	i32 4182413190, ; 288: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 71
	i32 4213026141, ; 289: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 99
	i32 4260525087, ; 290: System.Buffers => 0xfdf2741f => 87
	i32 4271975918, ; 291: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274976490, ; 292: System.Runtime.Numerics => 0xfecef6ea => 126
	i32 4292120959 ; 293: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 71
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [294 x i32] [
	i32 113, ; 0
	i32 112, ; 1
	i32 135, ; 2
	i32 33, ; 3
	i32 47, ; 4
	i32 124, ; 5
	i32 61, ; 6
	i32 79, ; 7
	i32 30, ; 8
	i32 31, ; 9
	i32 96, ; 10
	i32 2, ; 11
	i32 30, ; 12
	i32 57, ; 13
	i32 15, ; 14
	i32 68, ; 15
	i32 14, ; 16
	i32 51, ; 17
	i32 106, ; 18
	i32 137, ; 19
	i32 117, ; 20
	i32 135, ; 21
	i32 50, ; 22
	i32 109, ; 23
	i32 34, ; 24
	i32 26, ; 25
	i32 92, ; 26
	i32 67, ; 27
	i32 141, ; 28
	i32 120, ; 29
	i32 13, ; 30
	i32 7, ; 31
	i32 52, ; 32
	i32 42, ; 33
	i32 49, ; 34
	i32 39, ; 35
	i32 21, ; 36
	i32 65, ; 37
	i32 19, ; 38
	i32 132, ; 39
	i32 88, ; 40
	i32 116, ; 41
	i32 1, ; 42
	i32 138, ; 43
	i32 53, ; 44
	i32 16, ; 45
	i32 4, ; 46
	i32 125, ; 47
	i32 52, ; 48
	i32 115, ; 49
	i32 106, ; 50
	i32 105, ; 51
	i32 25, ; 52
	i32 51, ; 53
	i32 41, ; 54
	i32 98, ; 55
	i32 121, ; 56
	i32 104, ; 57
	i32 94, ; 58
	i32 28, ; 59
	i32 68, ; 60
	i32 92, ; 61
	i32 78, ; 62
	i32 102, ; 63
	i32 38, ; 64
	i32 3, ; 65
	i32 58, ; 66
	i32 101, ; 67
	i32 107, ; 68
	i32 70, ; 69
	i32 95, ; 70
	i32 83, ; 71
	i32 141, ; 72
	i32 16, ; 73
	i32 22, ; 74
	i32 75, ; 75
	i32 20, ; 76
	i32 18, ; 77
	i32 2, ; 78
	i32 66, ; 79
	i32 108, ; 80
	i32 32, ; 81
	i32 78, ; 82
	i32 62, ; 83
	i32 127, ; 84
	i32 0, ; 85
	i32 103, ; 86
	i32 116, ; 87
	i32 6, ; 88
	i32 89, ; 89
	i32 105, ; 90
	i32 59, ; 91
	i32 42, ; 92
	i32 89, ; 93
	i32 104, ; 94
	i32 86, ; 95
	i32 10, ; 96
	i32 48, ; 97
	i32 5, ; 98
	i32 134, ; 99
	i32 25, ; 100
	i32 72, ; 101
	i32 55, ; 102
	i32 81, ; 103
	i32 64, ; 104
	i32 110, ; 105
	i32 134, ; 106
	i32 93, ; 107
	i32 128, ; 108
	i32 82, ; 109
	i32 114, ; 110
	i32 130, ; 111
	i32 50, ; 112
	i32 60, ; 113
	i32 23, ; 114
	i32 1, ; 115
	i32 137, ; 116
	i32 86, ; 117
	i32 100, ; 118
	i32 79, ; 119
	i32 39, ; 120
	i32 145, ; 121
	i32 17, ; 122
	i32 85, ; 123
	i32 67, ; 124
	i32 9, ; 125
	i32 72, ; 126
	i32 83, ; 127
	i32 82, ; 128
	i32 76, ; 129
	i32 131, ; 130
	i32 127, ; 131
	i32 40, ; 132
	i32 29, ; 133
	i32 26, ; 134
	i32 107, ; 135
	i32 8, ; 136
	i32 90, ; 137
	i32 122, ; 138
	i32 35, ; 139
	i32 5, ; 140
	i32 87, ; 141
	i32 70, ; 142
	i32 0, ; 143
	i32 123, ; 144
	i32 69, ; 145
	i32 4, ; 146
	i32 100, ; 147
	i32 128, ; 148
	i32 119, ; 149
	i32 97, ; 150
	i32 91, ; 151
	i32 140, ; 152
	i32 45, ; 153
	i32 12, ; 154
	i32 41, ; 155
	i32 40, ; 156
	i32 120, ; 157
	i32 84, ; 158
	i32 110, ; 159
	i32 14, ; 160
	i32 36, ; 161
	i32 8, ; 162
	i32 77, ; 163
	i32 118, ; 164
	i32 111, ; 165
	i32 18, ; 166
	i32 143, ; 167
	i32 114, ; 168
	i32 56, ; 169
	i32 139, ; 170
	i32 35, ; 171
	i32 13, ; 172
	i32 10, ; 173
	i32 97, ; 174
	i32 118, ; 175
	i32 142, ; 176
	i32 144, ; 177
	i32 43, ; 178
	i32 93, ; 179
	i32 117, ; 180
	i32 11, ; 181
	i32 132, ; 182
	i32 131, ; 183
	i32 20, ; 184
	i32 84, ; 185
	i32 123, ; 186
	i32 64, ; 187
	i32 56, ; 188
	i32 15, ; 189
	i32 125, ; 190
	i32 101, ; 191
	i32 98, ; 192
	i32 129, ; 193
	i32 126, ; 194
	i32 57, ; 195
	i32 59, ; 196
	i32 21, ; 197
	i32 44, ; 198
	i32 45, ; 199
	i32 80, ; 200
	i32 27, ; 201
	i32 54, ; 202
	i32 47, ; 203
	i32 6, ; 204
	i32 62, ; 205
	i32 19, ; 206
	i32 80, ; 207
	i32 46, ; 208
	i32 143, ; 209
	i32 54, ; 210
	i32 81, ; 211
	i32 119, ; 212
	i32 96, ; 213
	i32 66, ; 214
	i32 34, ; 215
	i32 73, ; 216
	i32 145, ; 217
	i32 94, ; 218
	i32 12, ; 219
	i32 85, ; 220
	i32 129, ; 221
	i32 103, ; 222
	i32 74, ; 223
	i32 136, ; 224
	i32 60, ; 225
	i32 7, ; 226
	i32 115, ; 227
	i32 65, ; 228
	i32 49, ; 229
	i32 75, ; 230
	i32 24, ; 231
	i32 133, ; 232
	i32 63, ; 233
	i32 144, ; 234
	i32 77, ; 235
	i32 3, ; 236
	i32 37, ; 237
	i32 142, ; 238
	i32 11, ; 239
	i32 95, ; 240
	i32 55, ; 241
	i32 146, ; 242
	i32 24, ; 243
	i32 23, ; 244
	i32 133, ; 245
	i32 138, ; 246
	i32 31, ; 247
	i32 108, ; 248
	i32 69, ; 249
	i32 28, ; 250
	i32 74, ; 251
	i32 36, ; 252
	i32 113, ; 253
	i32 53, ; 254
	i32 146, ; 255
	i32 33, ; 256
	i32 73, ; 257
	i32 112, ; 258
	i32 99, ; 259
	i32 61, ; 260
	i32 90, ; 261
	i32 91, ; 262
	i32 130, ; 263
	i32 38, ; 264
	i32 111, ; 265
	i32 124, ; 266
	i32 32, ; 267
	i32 88, ; 268
	i32 63, ; 269
	i32 139, ; 270
	i32 76, ; 271
	i32 58, ; 272
	i32 27, ; 273
	i32 9, ; 274
	i32 109, ; 275
	i32 44, ; 276
	i32 122, ; 277
	i32 136, ; 278
	i32 48, ; 279
	i32 46, ; 280
	i32 102, ; 281
	i32 121, ; 282
	i32 22, ; 283
	i32 17, ; 284
	i32 37, ; 285
	i32 29, ; 286
	i32 140, ; 287
	i32 71, ; 288
	i32 99, ; 289
	i32 87, ; 290
	i32 43, ; 291
	i32 126, ; 292
	i32 71 ; 293
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
