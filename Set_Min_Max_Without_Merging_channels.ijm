## Macro used for images with 4 channels; DAPI, Cy3, Cy5 and GFP. The macro runs through all folders holding 4 channels images each from the main folder.
 # Then the macro adjusts the min and max brightness values of 4 channels DAPI, Cy3, Cy5, GFP without merging or saving the pictures. 
 # mix and max values for each channel must be set manually

dir = getDir("Choose a Directory");
listFiles(dir);

function listFiles(dir) {

	list = getFileList(dir);
	for (i=0; i<list.length; i++) {
    	if (endsWith(list[i], ".tif"))
	    	open(dir + list[i]); 
	    	run("Split Channels");
	    	selectWindow("C1-" + list[i]);
	    	setMinAndMax(min, max);
	    	selectWindow("C2-" + list[i]);
	    	setMinAndMax(min, max);
	    	selectWindow("C3-" + list[i]);
	    	setMinAndMax(min, max);
	    	selectWindow("C4-" + list[i]);
	    	setMinAndMax(min, max);

}
