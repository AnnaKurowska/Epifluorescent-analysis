folder_of_interest = getDir("Choose a Directory")

Dapi = "img_000000000_Dapi_000.tif"
Cy3 = "img_000000000_Cy3_000.tif"

folders = getFileList(folder_of_interest);

for (i=0; i < folders.length; i++) {
  subfolders = getFileList(folder_of_interest + folders[i]);
  for (j= 0; j <subfolders.length; j++){
  	print(folder_of_interest + folders[i] + subfolders[j]);
  	open(folder_of_interest + folders[i] +  subfolders[j] + "Pos0/" + Cy3);
    selectWindow(Cy3);
    setMinAndMax(366, 2500);
    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0/" + Dapi);
    selectWindow(Dapi);
    setMinAndMax(30, 2600);
	run("Merge Channels...", "c1=" + Cy3 + " + channel1 c3=" + Dapi + " + channel2 create");
 		length = lengthOf(subfolders[j]);
		name = substring(subfolders[j], 0, length-1);
	saveAs("tiff", folder_of_interest + folders[i] + subfolders[j] + name + ".tif");
	close();
  }
}