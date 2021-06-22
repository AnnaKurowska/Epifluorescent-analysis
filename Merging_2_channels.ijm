## Macro used for immages with 2 channels; Cy3 and DAPI (but other channels can be used instead). The macro runs through all folders holding 2 separate channel images each from the main folder.
 # Then the macro adjusts the min and max brightness values of 2 channels and then merges 2 channels into a stack image that it saves in the folder of each image. 
 # mix and max values for each channel must be set manually

folder_of_interest = getDir("Choose a Directory")

Dapi = "img_000000000_Dapi_000.tif"
Cy3 = "img_000000000_Cy3_000.tif" ## if desired, change the channel to be merged here

folders = getFileList(folder_of_interest);

for (i=0; i < folders.length; i++) {
  subfolders = getFileList(folder_of_interest + folders[i]);
  for (j= 0; j <subfolders.length; j++){
  	print(folder_of_interest + folders[i] + subfolders[j]);
  	    open(folder_of_interest + folders[i] +  subfolders[j] + "Pos0/" + Cy3);
	    selectWindow(Cy3);
	    setMinAndMax(min, max);
	    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0/" + Dapi);
	    selectWindow(Dapi);
	    setMinAndMax(min, max);
 run("Merge Channels...", "c1=" + Cy3 + " + channel1 c3=" + Dapi + " + channel2 create");
 	length = lengthOf(subfolders[j]);
	name = substring(subfolders[j], 0, length-1);
 saveAs("tiff", folder_of_interest + folders[i] + subfolders[j] + name + ".tif");
 close();
  }
}
