folders = getFileList("/Volumes/LaCie/IF/AK/siRNA 16_04_21/");

for (i=0; i < folders.length; i++) {
  subfolders = getFileList("/Volumes/LaCie/IF/AK/siRNA 16_04_21/" + folders[i]);
  for (j= 0; j <subfolders.length; j++){
  	print("/Volumes/LaCie/IF/AK/siRNA 16_04_21/" + folders[i] + subfolders[j]);
  	open("/Volumes/LaCie/IF/AK/siRNA 16_04_21/" + folders[i] +  subfolders[j] + "Pos0/img_000000000_Cy3_000.tif");
    selectWindow("img_000000000_Cy3_000.tif");
    setMinAndMax(100, 2500);
    open("/Volumes/LaCie/IF/AK/siRNA 16_04_21/" + folders[i] + subfolders[j] + "Pos0/img_000000000_Dapi_000.tif");
    selectWindow("img_000000000_Dapi_000.tif");
    setMinAndMax(30, 7000);
	run("Merge Channels...", "c1=img_000000000_Cy3_000.tif + channel1 c3=img_000000000_Dapi_000.tif + channel2 create");
 		length = lengthOf(subfolders[j]);
		name = substring(subfolders[j], 0, length-1);
	saveAs("Tiff", "/Volumes/LaCie/IF/AK/siRNA 16_04_21/" + folders[i] + subfolders[j] + name[i] + ".tif");
  }
}