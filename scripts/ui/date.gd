extends Label

func _process(_delta):
	var current_datetime_str = Time.get_datetime_string_from_system()
	var datetime_components = current_datetime_str.split("T")
	
	var date_components = datetime_components[0].split("-")
	var time_components = datetime_components[1].split(":")
	
	var year = int(date_components[0]) - 30
	var month = int(date_components[1])
	var day = int(date_components[2])
	var hour = int(time_components[0])
	var minute = int(time_components[1])

	var dst_info = Time.get_datetime_dict_from_system(true)
	var dst = dst_info.dst 

	if dst:
		hour += 1
		if hour >= 24:
			hour -= 24
			day += 1

	var formatted_minute = "%02d" % minute

	var meridian = "AM"
	if hour >= 12:
		meridian = "PM"
		if hour > 12:
			hour -= 12

	var date_line1 = meridian + "   " + str(hour) + ":" + formatted_minute
	var date_line2 = month_to_abbreviation(month) + "." + " " + str(day) + " " + str(year)
	text = date_line1 + "\n" + date_line2

func month_to_abbreviation(month):
	match month:
		1: return "Jan"
		2: return "Feb"
		3: return "Mar"
		4: return "Apr"
		5: return "May"
		6: return "Jun"
		7: return "Jul"
		8: return "Aug"
		9: return "Sep"
		10: return "Oct"
		11: return "Nov"
		12: return "Dec"
