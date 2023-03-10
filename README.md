# BioPhysics-Molecular-Dynamics-Simulation
Using VMD and NAMD for molecular dynamics simulation of protein PDB files.

-Steps done are listed below:

● Build Protein Structure File.

● Protein Solvation.

● Run Molecular Dynamic simulation using Parameter Files.

● DCD trajectory file analysis (Plot the RMSD vs. frame number)

-First ,let us explain how to do these steps using Visualization Molecular Dynamics (VMD) and Nanoscale Molecular Dynamics (NAMD) bioinformatics tools.

![image](https://user-images.githubusercontent.com/112272836/216963108-8e3932c3-6f99-41c5-aa9b-731acfc61486.png)

https://www.ks.uiuc.edu/

![image](https://user-images.githubusercontent.com/112272836/216963247-92ecf055-eada-4e17-bd03-b116ba788cc4.png)

![image](https://user-images.githubusercontent.com/112272836/216963313-74de396c-6fad-472b-9865-94f9db6a3327.png)

![image](https://user-images.githubusercontent.com/112272836/216963354-86016fd6-9023-4659-9211-d12e645058b7.png)

https://www.rcsb.org/

![image](https://user-images.githubusercontent.com/112272836/216963389-fd34c88b-3dde-4baf-8169-1eae26a250d8.png)

![image](https://user-images.githubusercontent.com/112272836/216963451-83ee4397-fa23-497a-a812-dcff35e9be51.png)

![image](https://user-images.githubusercontent.com/112272836/216963486-a97bdec0-17f1-4856-848c-e61fd834dafc.png)

-Now after becoming familiar with using these tools ,let us take a look at the the actual results done here after applying all these steps on the 1j4n.pdb file molecule.

-Here are links, to know more about the molecule:

https://www.rcsb.org/structure/1j4n

https://www.ebi.ac.uk/pdbe/entry/pdb/1j4n

https://www.ncbi.nlm.nih.gov/Structure/pdb/1J4N

https://pdbj.org/mine/summary/1j4n

-In order to run any MD simulation, NAMD requires at least four things:

1)	A Protein Data Bank (pdb) file which stores atomic coordinates and/or velocities for the system. 

2)	Protein Structure File (psf) which stores structural information of the protein, such as various types of bonding interactions. 

3)	A force field parameter file. A force field is a mathematical expression of the potential which atoms in the system experience. CHARMM, X-PLOR, AMBER, and GROMACS are four types of force fields, and NAMD is able to use all of them. The parameter file defines bond strengths, equilibrium lengths, etc. 

4)	A configuration file, in which the user specifies all the options that NAMD should adopt in running a simulation. The configuration file tells NAMD how the simulation is to be run.

•	Steps:

•	Download the PDB file: 1j4n(.pdb) from the Protein Data Bank website.

•	Open the VMD program from the start menu to start a new VMD session. Start → Programs → VMD

•	Create a folder as your working space. Place the downloaded protein file 1j4n.pdb inside the folder.

•	Then change the directory in the VMD shell to set your working space as the current working directory. 

•	cd < Folder Path>

•	Any generated output files during your current VMD session will be stored in that folder.


![image](https://user-images.githubusercontent.com/112272836/216967485-5f5b46f9-d5bb-4b8d-971a-6d17ff21c1e0.png)

-Step1:

•	Generate Protein Structure File (PSF) 

•	Load the molecule into VMD: File → New Molecule → Browse (choose 1j4n.pdb protein file) → Load.

![image](https://user-images.githubusercontent.com/112272836/216967555-4de84c67-d59b-4ca8-bcca-4447a6700bfe.png)

•	Build Protein Structure File: Extensions → Modeling → Automatic PSF Builder

![image](https://user-images.githubusercontent.com/112272836/216967752-af283143-97dd-40e3-bed4-9a2eeae7005c.png)

•	From the Automatic PSF Builder Window apply the following in order: 

a. Load input files

b. Guess and split chains using current selections. 

c. Create chains 

d. Apply patches and finish PSF/PDB (optional if PSF is generated from the third step)

![image](https://user-images.githubusercontent.com/112272836/216967778-89621694-fdff-43b9-a00b-68760033fc29.png)

→ Note that the X-ray structure from the Protein Data Bank does not contain the hydrogen atoms of Ubiquitin molecule. 

→ Because X-ray crystallography usually cannot resolve hydrogen atom since their sizes are too small to interact with the radiation and since they contain only a single electron.

→After these steps: hydrogens have been generated as hydrogen doesn’t come naturally with the PDB file. Moreover, two files are generated: a new pdb file (.pdb) that now contain the hydrogen atoms and the corresponding protein structure file (.psf).

•	Delete current molecules in VMD Main:

![image](https://user-images.githubusercontent.com/112272836/216967804-9fcaf40d-a231-4c69-8ade-785db8b6e3e0.png)

•	Step2: 

•	Solvating the Protein

•	The protein needs to be solvated, i.e., put inside water, to more closely resemble the cellular environment. 

•	1. Load the auto generated PSF file to the VMD main first, then load on top of it the new PDB (with hydrogen atoms) and make sure the frames column has changed from 1 to 0

![image](https://user-images.githubusercontent.com/112272836/216968028-143ff67c-be28-469a-9b6c-3bedf50261fc.png)

•	2. Create a Water Box around the molecule to simulate the cellular environment:

Extensions → Modeling → Add Solvation Box

![image](https://user-images.githubusercontent.com/112272836/216968133-76cd96d4-81a3-49d0-a321-ad93580e575b.png)

![image](https://user-images.githubusercontent.com/112272836/216968162-2a4b6afe-29db-4480-a248-bb42ed6f49f7.png)

•	After these steps, a water box will be create to surround the protein and two files will be generated respectively: a modified .pdb file to include the water box and the corresponding .psf file. 

•	Step 3:

•	Configuration File Preparation

•	Add the NAMD application path to the end of PATH environment variable:

![image](https://user-images.githubusercontent.com/112272836/216968262-130e5f4e-b796-4f7c-bce2-b1fc16dff0ab.png)

•	1.Load the solvated protein molecule “PSF” into the VMD main. 

•	2. Load on top of the PSF file, the solvated protein molecule PDB file. 

•	3. Open the VMD TK console

![image](https://user-images.githubusercontent.com/112272836/216968404-999a08d0-fbde-47e8-886d-2d54ef0569c4.png)

•	4. Run the following command to select all atoms of the molecule: set everyone [atomselect top all]

•	5. Run the following command to extract the minimum and maximum coordinates of the water box: measure minmax $everyone

![image](https://user-images.githubusercontent.com/112272836/216968497-5d1914ee-5bb1-456c-96dd-0cf5828d664f.png)

![image](https://user-images.githubusercontent.com/112272836/216968527-ed44cefa-2f73-42bf-b5bb-f0e0201de7d0.png)

![image](https://user-images.githubusercontent.com/112272836/216968548-f3dc50e6-9b05-4569-9c6a-8a9f6659d2b3.png)

-Open the NAMD graphical interface from the VMD main: Extensions → Simulation → NAMD Graphical Interface

![image](https://user-images.githubusercontent.com/112272836/216968638-517b4cae-0a01-4302-a9d1-0278c67b01b3.png)

•You can rename the simulation base name to another informative name or leave it as it is; let it be 1j4n_wb_md to refer to molecular dynamics

•Select suitable parameter files for the loaded molecule.

•If you don’t have any non-protein molecules (such as ions), the default parameter files will be just fine. Parameter files for different types of molecules can be found in the VMD installation folder: "C:\Program Files\University of Illinois\VMD\plugins\noarch\tcl\readcharmmpar1.3" 

-To avoid any crash during the NAMD run; add all possible parameter files that may be needed for your molecule especially if you don’t have enough information about the atom types that exist in your loaded molecule.

•Select the following checkboxes from the timesteps section:  Minimization  Molecular dynamics

•Modify the temperature in which the simulation will be carried out: Edit → Ensemble →NVT stands for number, volume and temperature

![image](https://user-images.githubusercontent.com/112272836/216968846-e46574a2-b147-4955-9143-2f30199b2ac7.png)

•Set temperature to 310 KO ( equivalent to 37 CO ) Select periodic boundary conditions checkbox ( to tell the NAMD to keep the volume of the cube the same through out the simulation, which hold “v” in NVT constant). 

![image](https://user-images.githubusercontent.com/112272836/216968911-a5431201-782a-4742-9b3c-15908ea41d12.png)

•Edit the periodic boundary conditions with the dimensions and origin calculated above.

![image](https://user-images.githubusercontent.com/112272836/216969003-ac795d14-ddfa-4f77-8e21-badad04af0b7.png)

-Step 4:

•	Run MD Simulation

•	Now the configuration file is set up, and NAMD is ready to run the simulation: 

• Click on the run NAMD button, and observe the status. 

•	Check your working director and observe the files generated, if the simulation is performing well you should see two output files in your folder: 

•	.dcd file: is coordinate trajectory output file. This file stores the trajectory of all atom position coordinates which you can convert into PDB files. 

•	.xst file: is extended system (periodic cell) trajectory output file. This file essentially record the trajectory of the cell boundaries over the run time.

![image](https://user-images.githubusercontent.com/112272836/216969207-a5760edc-3bf0-407c-bf7c-db6be7379846.png)

-Step 5:

•	Loading Trajectory File

•	Trajectory files are typically large binary files that contain the time varying atomic coordinates for the system. Each set of coordinates corresponds to one frame in time. 

•	An example of a trajectory file is a DCD file. 

•	Trajectory files usually do not contain structural information as found in protein structure files (PSF). Therefore, we must first load the structure file, and then add the trajectory data to the same molecule, so that VMD has access to both the structure and trajectory information. 

•	1. Load the solvated protein PSF file: File → New Molecule → Browse (choose 1j4n_wb.psf protein file) → Load. 

•	2. Load the DCD trajectory file on top of the solvated protein PSF file: File → New Molecule → Browse (choose 1j4n_wb_md.dcd trajectory file) → Load.

![image](https://user-images.githubusercontent.com/112272836/216969352-ece31b88-e99b-4263-bb40-718021068fe8.png)

•	3.Display Molecule using Different Representations: Graphics → Representations

![image](https://user-images.githubusercontent.com/112272836/216969434-49845823-be6d-4b5e-82d4-987473d4e425.png)

![image](https://user-images.githubusercontent.com/112272836/216969461-a16319ca-0432-4daf-baf5-5abebb33cf27.png)

![image](https://user-images.githubusercontent.com/112272836/216969486-f36c179f-87ba-48a7-9363-0c56ea6ff087.png)

-Step 6: 

•	RMSD Analysis

![image](https://user-images.githubusercontent.com/112272836/216969572-888e5925-4b5d-4d5e-a6cd-dd9b757c0f18.png)

•	Analyze the DCD trajectory file: Extensions → Analysis → RMSD Trajectory Tool 

•	The active molecule should be the Protein Structure File loaded in the main window of the VMD.

•	The selection for which RMSD will be computed is all of the protein atoms, excluding hydrogen atoms (since the noh checkbox is on). 

• The RMSD will be calculated for each frame (time t1 in Eq. 1) with the reference to frame 0 (time t2 in Eq. 1). Make sure the Plot checkbox is selected. 

•	Align Step: This will align each frame of the trajectory with respect to the reference frame (in this case, frame 0) to minimize RMSD, by applying only rigid-body translations and rotations. This step is not necessary, but is desirable in most cases, because we are interested only in RMSD that arises from the fluctuations of the structure and not from the displacements and rotations of the molecule as a whole. The result of the alignment can be seen in the OpenGL display. 

•	RMSD Step: The protein RMSD (in °Angstroms) vs. frame number is displayed in a plot

![image](https://user-images.githubusercontent.com/112272836/216969727-7a0859f0-a317-44fc-8f5e-e9df314cfd7e.png)

![image](https://user-images.githubusercontent.com/112272836/216969753-036ccd02-1e92-4e64-a408-004834591cb1.png)

![image](https://user-images.githubusercontent.com/112272836/216969777-4426c63f-216f-4cb2-b539-6eb411e395fb.png)

![image](https://user-images.githubusercontent.com/112272836/216969821-87e1675e-099a-4c6c-b767-7fb0797b2502.png)

![image](https://user-images.githubusercontent.com/112272836/216969871-bb6b8dd6-d751-45ee-b6e4-04a914c1694e.png)

-PDB Uploading

![image](https://user-images.githubusercontent.com/112272836/216971210-f846e5e4-0d30-4f43-9b71-c32f2a3ae11e.png)

-Automatics PSF Building

![image](https://user-images.githubusercontent.com/112272836/216971258-6916f8fd-6c59-4c9e-8b52-834cd566e0ae.png)

-PSF and PDB Uploading 

![image](https://user-images.githubusercontent.com/112272836/216971316-6c460f72-34f8-4c63-9939-57a1a9e313bc.png)

-Solvate Box Creation

![image](https://user-images.githubusercontent.com/112272836/216971387-273ea344-ff58-4dda-87d7-165548504a79.png)

![image](https://user-images.githubusercontent.com/112272836/216971414-1a771f95-fec0-492a-9c42-464e72eb01a3.png)

![image](https://user-images.githubusercontent.com/112272836/216971438-ab899284-9012-49b8-a417-5c0362a10382.png)

-Solvate Atoms Number 10827

![image](https://user-images.githubusercontent.com/112272836/216971515-24d61d04-4c54-470c-833b-a54fc525e0d3.png)

-NAMD Status Running

![image](https://user-images.githubusercontent.com/112272836/216971565-7e6a1e2f-28b0-43eb-baec-c695d4adea65.png)

-NAMD Visualization

![image](https://user-images.githubusercontent.com/112272836/216971617-3ce2e5f9-cefe-442e-b978-a87de5356af8.png)

-PSF and DCD Uploading

![image](https://user-images.githubusercontent.com/112272836/216971668-9864a528-615b-4c52-82c5-f89f6148c158.png)

-Graphical Representation Creation Water and Protein 

![image](https://user-images.githubusercontent.com/112272836/216971748-e7a35c05-34fd-4390-b7f7-2da5cd7dc370.png)

![image](https://user-images.githubusercontent.com/112272836/216971773-a0371ac7-d68e-40a1-b6ad-602b11e2970e.png)

-Align for RMSD

![image](https://user-images.githubusercontent.com/112272836/216971820-d377ecb8-c338-4f41-bdb6-0bdcc6c8ce22.png)

-Files Generated

![image](https://user-images.githubusercontent.com/112272836/216971891-e4565e68-b01a-49bd-a7f8-2941c1207162.png)

-Now we can also prepare the protein trajectory files:

1. Download and install VideoMach:

http://www.gromada.com/VideoMach.html

![image](https://user-images.githubusercontent.com/112272836/216983967-0379896d-3516-4fe2-a14c-e198ddb585ad.png)

![image](https://user-images.githubusercontent.com/112272836/216984002-5c1f36d7-7eff-4f10-9801-8189e0d7f237.png)

![image](https://user-images.githubusercontent.com/112272836/216984052-77f0da07-7ec2-4dac-a570-4e56d208aae2.png)

![image](https://user-images.githubusercontent.com/112272836/216984119-5b585d64-4475-48d8-92d7-c0b1d9d818f8.png)

![image](https://user-images.githubusercontent.com/112272836/216984153-df7d5400-4669-40c6-a285-4c62b61f5026.png)

![image](https://user-images.githubusercontent.com/112272836/216984202-2aaac20e-a835-48bd-bd34-18d9fc13fc74.png)

![image](https://user-images.githubusercontent.com/112272836/216984248-0dc13ccf-bb49-489b-972c-d950752a756b.png)

![image](https://user-images.githubusercontent.com/112272836/216984298-2faf89c8-1210-448f-bb7c-a40873abc77b.png)

![image](https://user-images.githubusercontent.com/112272836/216984371-7cd62173-dcb3-470f-a392-0737c87c4451.png)

![image](https://user-images.githubusercontent.com/112272836/216984424-b5f2ea74-c9f4-4cdd-991f-82d36028fda7.png)

![image](https://user-images.githubusercontent.com/112272836/216984481-ad3e637b-9277-4f4c-a8ba-57a62dd1e39f.png)

![image](https://user-images.githubusercontent.com/112272836/216984546-863fdbf9-d0f0-48f0-a30d-860b6cdd8232.png)

![image](https://user-images.githubusercontent.com/112272836/216984579-57785b96-5cae-47f7-87b9-c4f27bfdf2ce.png)

![image](https://user-images.githubusercontent.com/112272836/216984619-9a4f0b5b-1ed2-49bd-b87c-484febc1ab45.png)

![image](https://user-images.githubusercontent.com/112272836/216984654-5ba1e334-5d06-4d31-b6a0-022cb3a83463.png)

![image](https://user-images.githubusercontent.com/112272836/216984703-8152530e-9005-40a4-9535-b57363db05de.png)

-Results of the trajectory and video making are added ,but this time applied on 1ubq.pdb molecule and not 1j4n.pdb, in order to carry them out, you will have to prepare all needed files first by following steps in task 1.

-Here are links to know more about the 1ubq.pdb molecule:

https://www.rcsb.org/structure/1UBQ

https://www.ncbi.nlm.nih.gov/Structure/pdb/1UBQ

https://pdbj.org/mine/summary/1ubq

https://www.ebi.ac.uk/pdbe/entry/pdb/1ubq/index

![image](https://user-images.githubusercontent.com/112272836/216980407-abb7acb8-639b-45e0-9884-f211aa8a3192.png)

![image](https://user-images.githubusercontent.com/112272836/216980507-e99ac0ef-3302-424f-abb1-fda7555d292e.png)

-In task one we generated a water box around the protein but !? 

-What about if we want to make it a sphere instead???

-Let us write a TCL/TK Script to help us through this mission.

![image](https://user-images.githubusercontent.com/112272836/216981116-c8f55d80-8f50-481e-8f61-40fd0e4e7ce5.png)

-Results after uploading TCL Script on 1j4n:

-Script to immerse our protein 1j4n.pdb in a sphere of water just large enough to cover it

-This script will place 1j4n in the smallest possible water sphere

- which completely immerses the protein.

- The output of the tcl script will be the center and radius of the water sphere.

-Determine the center of mass of the molecule and store the coordinates

-Solvate the molecule in a water box with enough padding (15 Angestrom)

-Determine which water molecules need to be deleted and use a for loop to delete them

-First Upload Script to run after setting working directory as usual:

![image](https://user-images.githubusercontent.com/112272836/216981602-8c3279e7-94b6-4c91-8b68-de23051cf99f.png)

-Final Console Output

![image](https://user-images.githubusercontent.com/112272836/216981658-8965d6c7-c52a-4de8-ae64-762e6d4bc8b1.png)

![image](https://user-images.githubusercontent.com/112272836/216981690-e2404f56-7f43-467d-aca2-239f88b53d67.png)

-Final Result 

![image](https://user-images.githubusercontent.com/112272836/216981789-4dfb202a-3777-451e-b389-9860f3ac9b05.png)

![image](https://user-images.githubusercontent.com/112272836/216981859-4ffa7cc8-4efe-4f77-a009-52bc492bad04.png)

-PSF and PDB Uploading :

![image](https://user-images.githubusercontent.com/112272836/216981940-c5472fb9-d119-4691-8cef-cec2c7b082e0.png)

-The question here is what kind of center was calculated???

![image](https://user-images.githubusercontent.com/112272836/216982049-95511e91-564c-44fb-b748-6892240b190c.png)

-Next:

-Solvation Applied

![image](https://user-images.githubusercontent.com/112272836/216982125-ce8ff5ee-fe57-4ff1-8156-0682ec43d638.png)

![image](https://user-images.githubusercontent.com/112272836/216982153-bbfc1e26-3aee-40f4-a6e7-1a17c6678701.png)

-Solvation Number of Atoms 

![image](https://user-images.githubusercontent.com/112272836/216982227-f0526eec-1dd4-4771-a820-b799c7a478cc.png)

-Number of Atoms after deletion of del_atoms

![image](https://user-images.githubusercontent.com/112272836/216982282-aa60cd58-5092-47b2-b3e0-5c425a7ea059.png)

-New Solvated results after deletion

![image](https://user-images.githubusercontent.com/112272836/216982348-289eb121-e2df-4b70-b939-e4898ce16b42.png)

![image](https://user-images.githubusercontent.com/112272836/216982365-9c706054-7a1f-4daa-8060-d6afa192a08d.png)

-Final New generated files:

![image](https://user-images.githubusercontent.com/112272836/216982438-561b7a36-f3b0-4e02-b831-c1d493bc9a32.png)

![image](https://user-images.githubusercontent.com/112272836/216987568-aaa25d87-6d43-4c96-b551-ab222eff464a.png)

-When carrying out these steps, you can face many technical issues related to the interaction between VMD, NAMD and your operating system.

-The 2 most commonly repeated ones here are :

1) You have to add the NAMD execution file path to your environment path BEFORE applying the steps of getting configuration files preparation, to be safe just do it at as a first step in applying this project.

2) Sometimes VMD doesn't work when you set the current directory (cd) in its cmd with a path having spaces in it.

-So to avoid any consequences of problem number 2 , don't use for example : "File Path/Folder" , instead use a path : "FilePath/Folder" .
