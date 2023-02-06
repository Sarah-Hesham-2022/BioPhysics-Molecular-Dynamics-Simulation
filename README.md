# BioPhysics-Molecular-Dynamics-Simulation-
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

![image](https://user-images.githubusercontent.com/112272836/216963715-d6f27589-1b50-48c4-897c-03e0d6ef2751.png)

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

•If you don’t have any non-protein molecules (such as ions), the default parameter files will be just fine. Parameter files for different types of molecules can be found in the VMD installation folder: “C:\Program Files\University of Illinois\VMD\plugins\noarch\tcl\readcharmmpar1.3”  To avoid any crash during the NAMD run; add all possible parameter files that may be needed for your molecule especially if you don’t have enough information about the atom types that exist in your loaded molecule.

•Select the following checkboxes from the timesteps section:  Minimization  Molecular dynamics

•Modify the temperature in which the simulation will be carried out: Edit → Ensemble →NVT stands for number, volume and temperature

![image](https://user-images.githubusercontent.com/112272836/216968846-e46574a2-b147-4955-9143-2f30199b2ac7.png)

•Set temperature to 310 KO ( equivalent to 37 CO ) Select periodic boundary conditions checkbox ( to tell the NAMD to keep the volume of the cube the same through out the simulation, which hold “v” in NVT constant). 

![image](https://user-images.githubusercontent.com/112272836/216968911-a5431201-782a-4742-9b3c-15908ea41d12.png)

•Edit the periodic boundary conditions with the dimensions and origin calculated above.

![image](https://user-images.githubusercontent.com/112272836/216969003-ac795d14-ddfa-4f77-8e21-badad04af0b7.png)

Step 4:

•	Run MD Simulation

•	Now the configuration file is set up, and NAMD is ready to run the simulation: 

• Click on the run NAMD button, and observe the status. 

•	Check your working director and observe the files generated, if the simulation is performing well you should see two output files in your folder: 

•	.dcd file: is coordinate trajectory output file. This file stores the trajectory of all atom position coordinates which you can convert into PDB files. 

•	.xst file: is extended system (periodic cell) trajectory output file. This file essentially record the trajectory of the cell boundaries over the run time.

![image](https://user-images.githubusercontent.com/112272836/216969207-a5760edc-3bf0-407c-bf7c-db6be7379846.png)

Step 5:

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

Step 6: 

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








