## Macro used for immages with 4 channels; DAPI, Cy3, Cy5 and GFP. The macro runs through all folders holding 4 separate channel images each from the main folder.
 # Then the macro adjusts the min and max brightness values of 4 channels DAPI, Cy3, Cy5, GFP and then merges 4 channels into a stack image that it saves in the
 # folder of each image. 
 # mix and max values for each channel must be set manually

folder_of_interest = getDir("Choose a Directory")

Dapi = "img_000000000_Dapi_000.tif"
Cy3 = "img_000000000_Cy3_000.tif"
Cy5 = "img_000000000_Cy5_000.tif"
Gfp = "img_000000000_GFP_000.tif"

folders = getFileList(folder_of_interest);
for (i=0; i < folders.length; i++) {
  subfolders = getFileList(folder_of_interest + folders[i]);
  for (j= 0; j <subfolders.length; j++){
  	print(folder_of_interest + folders[i] + subfolders[j]);
  	open(folder_of_interest + folders[i] +  subfolders[j] + "Pos0\\" + Cy3);
    selectWindow(Cy3);
    setMinAndMax(min, max);
    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0\\" + Dapi);
    selectWindow(Dapi);
    setMinAndMax(min, max);
    open(folder_of_interest + folders[i] + subfolders[j]  + "Pos0\\" + Cy5);
    selectWindow(Cy5);
    setMinAndMax(min, max);
    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0\\" + Gfp);
    selectWindow(Gfp);
    setMinAndMax(min, max);
	run("Merge Channels...", "c1=" + Cy5 + " c2=" + Cy3 + " c3=" + Gfp + " c5=" + Dapi + " create");
 		length = lengthOf(subfolders[j]);
		name = substring(subfolders[j], 0, length-1);
	saveAs("tiff", folder_of_interest + folders[i] + subfolders[j] + name + ".tif");
	close();
  }

