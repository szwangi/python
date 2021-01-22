olt_area = raw_input("OLT area (hex): ")

def switch_area(area):
	switcher = {
	"00": "ROMA",
	"0": "ROMA",
	"01": "MILANO",
	"1": "MILANO",
	"02": "BOLOGNA",
	"2": "BOLOGNA",
	"03": "NAPOLI",
	"3": "NAPOLI",
	"04": "PALERMO",
	"4": "PALERMO",
	"F2": "NET_NW",
	"f2": "NET_NW",
	"F3": "NET_NE",
	"f3": "NET_NE",
	"F4": "NET_CENTER",
	"f4": "NET_CENTER",
	"F5": "NET_SE",
	"f5": "NET_SE",
	"F6": "NET_SW",
	"f6": "NET_SW"
	}
	print switcher.get(area, "Invalid area")

area = switch_area(olt_area)
