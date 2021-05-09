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
  	open(folder_of_interest + folders[i] +  subfolders[j] + "Pos0/" + Cy3);
    selectWindow(Cy3);
    setMinAndMax(366, 2500);
    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0/" + Dapi);
    selectWindow(Dapi);
    setMinAndMax(30, 2600);
    open(folder_of_interest + folders[i] + subfolders[j]  + "Pos0/" + Cy5);
    selectWindow(Cy5);
    setMinAndMax(30, 2600);
    open(folder_of_interest + folders[i] + subfolders[j] + "Pos0/" + Gfp);
    selectWindow(Gfp);
    setMinAndMax(30, 2600);
	run("Merge Channels...", "c1=" + Cy5 + " c2=" + Cy3 + " c3=" + Gfp + " c5=" + Dapi + " create");
	makeRectangle(636, 528, 1239, 1164, 20);
	run("Split Channels");
	run("Duplicate...", "duplicate");
	selectWindow("C1-Composite");
	saveAs("Tiff", "/Volumes/LaCie 1/IF/AK/Cut_folder/" + "C1-composite" + ".tif");
	close();
	selectWindow("C2-Composite");
	saveAs("Tiff", "/Volumes/LaCie 1/IF/AK/Cut_folder/" + "C2-composite" + ".tif");
	close();
	selectWindow("C3-Composite");
	saveAs("Tiff", "/Volumes/LaCie 1/IF/AK/Cut_folder/" + "C3-composite" + ".tif");
	close();
	selectWindow("C4-Composite");
	saveAs("Tiff", "/Volumes/LaCie 1/IF/AK/Cut_folder/" + "C4-composite" + ".tif");
	close();	
  }
