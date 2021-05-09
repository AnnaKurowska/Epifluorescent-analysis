dir = getDir("Choose a Directory");
listFiles(dir);

function listFiles(dir) {

	list = getFileList(dir);
	for (i=0; i<list.length; i++) {
    	if (endsWith(list[i], ".tif"))
	    	open(dir + list[i]); 
	    	run("Split Channels");
	    	selectWindow("C1-" + list[i]);
	    	setMinAndMax(100, 200);
	    	selectWindow("C2-" + list[i]);
	    	setMinAndMax(300, 400);
	    	selectWindow("C3-" + list[i]);
	    	setMinAndMax(100, 300);
	    	selectWindow("C4-" + list[i]);
	    	setMinAndMax(100, 3000);

}