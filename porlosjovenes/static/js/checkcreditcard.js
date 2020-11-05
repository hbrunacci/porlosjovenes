function checkCreditCard(e, r) {
	var t = [];
	t[0] = {
		name: "Visa",
		length: "13,16",
		prefixes: "4",
		checkdigit: !0
	}, t[1] = {
		name: "MasterCard",
		length: "16",
		prefixes: "51,52,53,54,55",
		checkdigit: !0
	}, t[2] = {
		name: "DinersClub",
		length: "14,16",
		prefixes: "36,38,54,55",
		checkdigit: !0
	}, t[3] = {
		name: "CarteBlanche",
		length: "14",
		prefixes: "300,301,302,303,304,305",
		checkdigit: !0
	}, t[4] = {
		name: "AmEx",
		length: "15",
		prefixes: "34,37",
		checkdigit: !0
	}, t[5] = {
		name: "Discover",
		length: "16",
		prefixes: "6011,622,64,65",
		checkdigit: !0
	}, t[6] = {
		name: "JCB",
		length: "16",
		prefixes: "35",
		checkdigit: !0
	}, t[7] = {
		name: "enRoute",
		length: "15",
		prefixes: "2014,2149",
		checkdigit: !0
	}, t[8] = {
		name: "Solo",
		length: "16,18,19",
		prefixes: "6334,6767",
		checkdigit: !0
	}, t[9] = {
		name: "Switch",
		length: "16,18,19",
		prefixes: "4903,4905,4911,4936,564182,633110,6333,6759",
		checkdigit: !0
	}, t[10] = {
		name: "Maestro",
		length: "12,13,14,15,16,18,19",
		prefixes: "5018,5020,5038,6304,6759,6761,6762,6763",
		checkdigit: !0
	}, t[11] = {
		name: "VisaElectron",
		length: "16",
		prefixes: "4",
		checkdigit: !0
	}, t[12] = {
		name: "LaserCard",
		length: "16,17,18,19",
		prefixes: "6304,6706,6771,6709",
		checkdigit: !0
	}, t[13] = {
		name: "Cabal",
		length: "16",
		prefixes: "5896,6042",
		checkdigit: !1
	};
	for (var c = -1, i = 0; i < t.length; i++)
		if (r.toLowerCase() === t[i].name.toLowerCase()) {
			c = i;
			break
		}
	if (-1 === c) return ccErrorNo = 0, !1;
	if (0 === e.length) return ccErrorNo = 1, !1;
	e = e.replace(/\s/g, "");
	var n = e,
		a = /^[0-9]{13,19}$/;
	if (!a.exec(n)) return ccErrorNo = 2, !1;
	if (t[c].checkdigit) {
		var h, g = 0,
			o = 1;
		for (i = n.length - 1; i >= 0; i--) h = Number(n.charAt(i)) * o, h > 9 && (g += 1, h -= 10), g += h, o = 1 == o ? 2 : 1;
		if (g % 10 !== 0) return ccErrorNo = 3, !1
	}
	var s = !1,
		l = !1,
		f,
		x = [];
	for (f = t[c].prefixes.split(","), i = 0; i < f.length; i++) {
		var m = new RegExp("^" + f[i]);
		m.test(n) && (l = !0)
	}
	if (!l) return ccErrorNo = 3, !1;
	for (x = t[c].length.split(","), o = 0; o < x.length; o++) n.length == x[o] && (s = !0);
	return s ? !0 : (ccErrorNo = 4, !1)
}
var ccErrorNo = 0,
	ccErrors = new Array;
ccErrors[0] = txt_tarj_des, ccErrors[1] = txt_falta_num, ccErrors[2] = txt_tarj_num_fmt, ccErrors[3] = txt_tarj_num_inv, ccErrors[4] = txt_tarj_num_dig;