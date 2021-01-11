def translate(input):
	map = {	"a": "y",
			"b": "h",
			"c": "e",
			"d": "s",
			"e": "o",
			"f": "c",
			"g": "v",
			"h": "x",
			"i": "d",
			"j": "u",
			"k": "i",
			"l": "g",
			"m": "l",
			"n": "b",
			"o": "k",
			"p": "r",
			"q": "z",
			"r": "t",
			"s": "n",
			"t": "w",
			"u": "j",
			"v": "p",
			"w": "f",
			"x": "m",
			"y": "a",
			"z": "q"	
		}
	output = ""
	for i in range(len(input)):
		if input[i] ==" ":
			output = output+input[i]
		else:
			output = output+str(map[input[i]])
		
	return output 


print("Case #1 :", end =  "" )
print(translate("ejp mysljylc kd kxveddknmc re jsicpdrysi"))
print("Case #2 :", end =  "" )
print(translate("rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd"))
print("Case #3 :", end =  "" )
print(translate("de kr kd eoya kw aej tysr re ujdr lkgc jv"))
print("Case #4 :", end =  "" )
print(translate("hello i am the google code jam test data"))
print("Case #5 :", end =  "" )
print(translate("how are you"))
print("Case #6 :", end =  "" )
print(translate("aynny iynny aynny iynny aynny iynny aynny iynny aynny iynny aynny iynny aynny iynny aynny ieeeeeeeee"))
print("Case #7 :", end =  "" )
print(translate("y n f i c w l b k u o m x s e v z p d r j g a t h a q set k oset xa ynfd"))
print("Case #8 :", end =  "" )
print(translate("schr rkxc tesr aej dksl tkrb xc"))
print("Case #9 :", end =  "" )
print(translate("wep rbedc tbe dvcyo ks y resljc ie ser dvcyo re erbcp vcevmc"))
print("Case #10:", end =  "" )
print(translate("seneia jsicpdrysid rbcx dksfc rbca ypc dvcyoksl xadrcpkcd ks rbc dvkpkr"))
print("Case #11:", end =  "" )
print(translate("rbkd kd de chfkrksl k bygc re le rbc nyrbpeex"))
print("Case #12:", end =  "" )
print(translate("kr tyd rbc ncdr ew rkxcd kr tyd rbc nmjpdr ew rkxcd"))
print("Case #13:", end =  "" )
print(translate("mcr mkvd ie tbyr bysid ie"))
print("Case #14:", end =  "" )
print(translate("rbkd bcpc kd ljsveticp yfrkgyrci rtcsra dcgcs fymkncp wjmm yjre se okfonyfo sykmrbpetksl xyabcx"))
print("Case #15:", end =  "" )
print(translate("k bygc ncdrci wpjkr dvkoc ysi xees set k dbymm ncdr aej rbc lja"))
print("Case #16:", end =  "" )
print(translate("eb byk kx ks jp fexvjrcp cyrksl aejp fbccqnjplcpd ysi leelmcpcdksl aejp rchrq"))
print("Case #17:", end =  "" )
print(translate("ys cac wep ys cac ysi y vklces wep y vklces"))
print("Case #18:", end =  "" )
print(translate("ymm aejp nydc ypc ncmesl re cppep rbc dveesa nypi"))
print("Case #19:", end =  "" )
print(translate("aej vkddci eww rbc fbkfocs myia"))
print("Case #20:", end =  "" )
print(translate("set kd rbc djxxcp ew ejp myfo ew ikdfesrcsr"))
print("Case #21:", end =  "" )
print(translate("na rbc vpkfoksl ew xa rbjxnd dexcrbksl tkfoci rbkd tya fexcd"))
print("Case #22:", end =  "" )
print(translate("ks y tepmi ew ikpctemgcd ysi mkesd dexcrkxcd rbc pypcdr fpcyrjpc kd y wpkcsi"))
print("Case #23:", end =  "" )
print(translate("lpccrksld fbccdc vevdkfmc rbc sjxncp aej bygc ikymci kd fjppcsrma ejr ew vepofbevd"))
print("Case #24:", end =  "" )
print(translate("tba ie vpelpyxxcpd ymtyad xkh jv bymmetccs ysi fbpkdrxyd"))
print("Case #25:", end =  "" )
print(translate("kx fexxysicp dbcvypi ysi rbkd kd xa wygepkrc vpenmcx es rbc leelmc feic uyx"))
print("Case #26:", end =  "" )
print(translate("w ew rte czjymd w ew esc czjymd esc"))
print("Case #27:", end =  "" )
print(translate("wep k ncrtccs rbpcc ysi s w ew k czjymd w ew k xksjd esc vmjd w ew k xksjd rte"))
print("Case #28:", end =  "" )
print(translate("bet ypc aej bemiksl jv ncfyjdc kx y veryre"))
print("Case #29:", end =  "" )
print(translate("ip qykjd ip qykjd ip qykjd ip qykjd eeeeeeeeeeeeb ip qykjd"))
print("Case #30:", end =  "" )
print(translate("tbeeeeeeeeeeeeeeeeeeeyyyyyyyyy k oset f vmjd vmjd"))











	
	
	
	
	
	
	
	
	
	
	
	
	
	
	