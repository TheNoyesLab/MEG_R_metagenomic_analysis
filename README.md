# MEG_R_metagenomic_analysis

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/TheNoyesLab/NoyesLab_R_analysis_Jupyter_notebook/HEAD)


# Opening the Notebook
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/TheNoyesLab/NoyesLab_R_analysis_Jupyter_notebook/HEAD)
The button above will take you directly to the Binder page where this notebook is hosted. Upon clicking the link, you will see the following page: 

<img width="550" alt="image" src="https://user-images.githubusercontent.com/61216360/114312186-650d5f80-9ab7-11eb-92a9-239b0c20db76.png">

Here, the Binder is loading up the Notebook. The notebook will take about 1-5 minutes to load most times, but occasionally (especially after updates are made), it could take upwards of 10-15 minutes to load in a worst-case scenario. Clicking on “Build Logs” will show you the current loading status. If you see the following message, then the loading should not take very long (1-5 minutes)

```
Found built image, launching. . .
Launching server. . .
```

# Binder Notebook Basics
## Home Page
When the notebook opens, you will see the following screen: 

<img width="550" alt="image" src="https://user-images.githubusercontent.com/61216360/114312314-e238d480-9ab7-11eb-92df-864eb9e07ded.png">

These are all the files contained within the notebook at the time of writing. It’s important to keep in mind that **these files are temporary and not stored on your computer, so you must download important files that are generated from this script.** The above image is annotated to show you the different file types that are currently stored in the notebook. 

## Downloading Files
It’s important to note that _directories cannot be downloaded directly._ Rather, they must be downloaded file by file. 

To download a given file, first click on the checkbox on the left side of the file name. Once selected, new options will appear towards the top of the screen that allow you to perform different actions with that selected file. Then, clicking the “Download” button will allow you to download the file to your computer. These steps are illustrated in the image below. 

<img width="550" alt="image" src="https://user-images.githubusercontent.com/61216360/114312397-262bd980-9ab8-11eb-988f-3f9f4384d1be.png">

## Uploading Files
When using this notebook, you’ll want to perform analysis on your own data and not the test data we’ve provided to you. This requires uploading your own data to the notebook. The image below illustrates the location of the upload button.

<img width="550" alt="image" src="https://user-images.githubusercontent.com/61216360/114312409-35ab2280-9ab8-11eb-86e5-cdb70e843e33.png">

This button opens up your default file explorer, which you can use to upload one or multiple files. Once you’ve selected your files, they will still not be fully uploaded until you select the blue “Upload” button as shown below. You will have to manually click the “Upload” button for each file that you upload to the notebook. 

<img width="550" alt="image" src="https://user-images.githubusercontent.com/61216360/114312417-3e035d80-9ab8-11eb-8131-9ceb97a2a028.png">

For this notebook, make sure you are first located within the Data directory when uploading all your necessary files, as that is where the actual notebook looks for them. 


# Using the Notebook
## Opening The Notebook
At the time of writing, the name of the file that you’ll want to open is called **“GUI_data_exploration.ipynb”**. 

## 1. Import UI Elements Scripts
All of the interface objects that you interact with throughout this script, as well as the core functionality of the notebook as a whole, are all incorporated into a separate Notebook file to avoid the clutter that would otherwise accumulate in the notebook that you’ll be using. In order to achieve this, however, we still must access that script before we do anything with this notebook file. The box in this section contains the code necessary to run that script and gives us access to all of these elements. 

As a user, you do not need to know anything more about this script other than the fact that it’s there and it **must** be run before all other code can be run. 

A common issue that I expect is that when Binder times out, users will naturally reload the notebook. However, they will likely forget that this block needs to be run and will instead skip down to the analysis portion of the script and run into errors. **When you run into errors after Binder times out (or just as a general troubleshooting step in most cases), rerun this block and see if that fixes the issue**.


## 2. Import Files
The notebook in its default state uses test data as a placeholder for where your actual data should go. Before completing this section, you should have already uploaded the files you want to analyze within the “Data” directory.

In this section, you will load up your AMR and/or microbiome data by clicking the dropdown menu and selecting the file that’s specified by the name to the left of the dropdown menu. Keep in mind that your data should ideally look exactly like the test data files that are already present. This will ensure that the staging script later on works as intended. We recommend taking a closer look at the test files to see what the format of these files is like, and adapting your files to be formatted just like the test data. 


## 3. Save the File Names
Once you have finished adding your data files in the dropdown in the previous step, this section allows you to save and validate the files you’ve selected. Clicking this button is required to advance. It sets the variables needed in future steps, and also outputs what the script believes to be the files that you’ve selected for analysis. 

If the names of the files in this output do not match up to what you expect to see, try rerunning the notebook again from the beginning using the circle icon in the top toolbar: <img width="26" alt="image" src="https://user-images.githubusercontent.com/61216360/114312643-eaddda80-9ab8-11eb-9a4f-a28e669575b9.png">

## 4. Identify Sample IDs (this section needs improvement)
In order for the script to properly identify the different samples that are present in your data, you must tell the notebook where to find this information within your files. Here, we ask you to point the notebook to the column in your metadata file that contains those sample IDs. For example, when looking at the test data, the file “test_AMR_metadata.csv” has its sample IDs within the column named “sample”.

In this section, we first give you the option to view the head of all the different .csv files that have been uploaded (hence why the dropdown is not as long as the one from section 2). After selecting a file, type the column name containing your sample IDs in the text box. 

## 5. Selecting Exploratory Variables (This section isn't complete, Need to add much more to this)
In this section, you will now define the type of analysis that you’d like to perform. Here, you can specify which variables to compare, which order to put them in, name the analysis, and create multiple different instances of them. This will use the metadata file that you selected earlier in the script in section 4 when selecting sample IDs. 

If we continue the example from earlier using the same “test_AMR_metadata.csv” file, 

## 6. Save Information from GUI Elements
After inputting the various analysis that you’d like to run in step 5, you will run the code block in step 6 to properly save the settings you’ve just set. Running this code will not print out any output or give you any initial validation that it worked, so you’ll have to have a little faith that it did something important.  

If you run into an error in this step, one possible cause is not having run the second code block in step 5. This code block initializes the variables that step 6 uses, so it’s important to run both code blocks in step 5 to avoid this.  

## 7. Outputting Information to .csv File
Getting close to the end here! At this point, you’ve let the script know which files to work with and how it should go about analyzing them. Now, we must save these variables into a .csv file. The idea of saving all these settings to a .csv file allows us to save time if returning to the results in the future and allowing others to see the exact same analysis you’ve performed later and explore those results for themselves. 

At the time of writing, when you run this code block, you’ll be presented with 2 buttons. The left button “Save CUSTOM variables for analysis script” will print out your settings that you have set earlier throughout this notebook. This is what you will be pressing each time you are analyzing your own data set. The button on the right sets the default settings that I have set while creating this notebook that uses all the default files and settings for that analysis. The purpose of including the default settings is for troubleshooting purposes. If you get errors downstream, it can be helpful to compare the settings file that you generated with the default settings parameters.  

TL; DR: Press the left button to run your settings, press the right button if wanting to look at default settings .csv file and/or for troubleshooting. 

## 8. Generating Exploratory Figures
Here’s where the magic happens if you were able to successfully complete the previous steps. The next code block will take in the settings and data files that you’ve uploaded and use them to create the new data objects with which we will be plotting some of the results. For the purposes of running this notebook, you should see the following message if this step worked correctly: 

<img width="400" alt="image" src="https://user-images.githubusercontent.com/61216360/114312759-62ac0500-9ab9-11eb-86bd-bdea26425356.png">

Errors in this step can be the result of a lot of different possible causes, including but not limited to incorrect data being uploaded, unexpected data formats, incorrect settings, or even some back-end issue that’s not even your fault. If you do run into errors in this step, one thing you could try is to reduce the number of analyses you ask the notebook to perform in step 5. If that doesn’t help, don’t hesitate to reach out to me at gupta305@umn.edu, and I will try to help troubleshoot the issues. 


Of note, I am currently testing the use of .RData files as another means to save the notebook session for future use. The staging script saves a “GUI_Workspace.RData” file once run, which can be loaded in the next time you use this notebook to save time in running the staging script every time you wanted to see the results. The code block to load in this .RData file is currently commented out, so you’ll have to remove the “#” character if you chose to use it. I’m purposely not going into much details about it yet, but I plan on fleshing out this document more in the future to include better instructions for how to use it.  

## 9. Interactive Plots (This section is not finished)
Here, we will finally begin plotting the results. 

## 10. View Additional Generated Plots


# FAQ
This code block isn't working as expected/is buggy, what should I do? 
- The first and most common fix is to rerun the whole notebook again and refresh the environment. One easy way to do this is to press the circle icon in the top toolbar [INSERT PICTURE HERE], which will reset all of the variables. Keep in mind that this means you’ll need to rerun the **Import UI Elements** Script box again as well. 



