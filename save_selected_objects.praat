# Save selected objects (2025)
# published by mercepratrubio created with wendyelviragarcia and ebrenc :)

# This script will save the current selected objects open in praat.
# Before running it, make sure to select all items you wish to save.
# The name of the files will be the same as the name they were uploaded to the object list.
# It will rewrite any files with matching names: watch out not to lose any files you want to keep.

form Input desired settings
	comment Remember to select all the files you wish to save!

	comment Where do you want the files to be saved?
		sentence folder C:\Users\User\Desktop\prova
	comment What type of objects do you want to save?
		boolean textgrids 1
		boolean audios 1
	comment Do you want to remove the selected objects once saved?
		boolean yes_remove 0

	
endform


select all

if textgrids = 1
	textgrids# = selected# ("TextGrid")
  
   		for i to size (textgrids#)
       		selectObject: textgrids# [i]

       		nom$ = selected$("TextGrid")
		Save as text file: folder$+ "/" + nom$ + ".TextGrid"

   		endfor

		# Restore selection:
   		selectObject (textgrids#)

		if yes_remove = 1
			removeObject: textgrids#

		endif

endif

if audios = 1
	audios# = selected# ("Sound")
  
   		for i to size (audios#)
       		selectObject: audios# [i]

       		nom$ = selected$("Sound")
		Save as WAV file: folder$+ "/" + nom$ + ".wav"

   	endfor
   	
	# Restore selection:
   	selectObject (audios#)

	if yes_remove = 1
		removeObject: audios#
	endif

endif

writeInfoLine: "Completed"
appendInfoLine: "Objects saved at:" + folder$
   