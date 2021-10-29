# EEG Analysis Working Group
 
## Purpose
 
The overall purpose of this working group is to create an environment in which we learn from, and teach each other, the theory behind, and practical guidance on, the analysis of EEG data.
 
A central principle of the NDCLab is to use open source tools whenever possible, and our goal is to move to using Python (and MNE-Python) as our standard programming language for the analysis of EEG data. However, the reality is that MATLAB (and EEGLAB/FieldTrip) is currently more commonly used by the field, and our standard pipelines for processing EEG data in Python are still being developed. Thus, the plan is for the working group to begin with a heavier focus on the use of MATLAB (and EEGLAB/FieldTrip), and increasingly move to Python over time. Where appropriate, we will also use the R programming language as well.
 
As much as possible, we will emphasize best practices for data science, including:
 
* GitHub (and adhering to our established/evolving GitHub etiquette)
* Code reviews
* Use of producible computing environments (Conda, Docker, Singularity)
* Local and HPC data processing
* Proper documentation
 
Given that the goal of this working group is to not only learn how to analyze EEG data, but to do so using real EEG data that the lab is working with, we will primarily focus on the EGI and BrainVision raw data formats. We will cover how to import this data into MATLAB (EEGLAB/FieldTrip) and Python (MNE), and reformat/manipulate them in accordance with the standard data formats of EEGLAB and MNE.

Kinds of analyses we will perform:
 
* Preprocess, annotate, and label EEG data using the MADE and PEPPER pipelines
* Compute/plot/interpret standard EEG features, including ERP-based measures and time-frequency measures (power, phase)
* Source localization of EEG data using MRI-constrained head models
* Perform statistical analyses of standard EEG features (via ANOVA and regression models)

 
## Structure
 
The working group will adopt a “flipped classroom” design, where you all learn material ahead of time (through assigned online modules, readings, and/or watching pre-recorded videos), and then during our meeting each week we will have some time for review/Q/A to clarify/enhance your understanding. The majority of time during each meeting will then be spent on actively **applying** what you learned that week to REAL data. That is, data we intend to use for one or more publications.
 
The structure is subject to change, but initially, we will adopt a more formal schedule. Each week you are expected to go through the assigned modules BEFORE the working group meeting. You are highly encouraged to post questions/comments on the Slack channel throughout the week as you work through the modules on your own, or ideally, in small groups. In fact, you should not come to the weekly meetings with questions that you have not already posted on the Slack channel. Of course, there will be additional questions that spontaneously arise during our live meetings, and please ask those, but please do not hold onto questions you have prior to a meeting.
 

## Leadership
 
Who will lead the live meetings each week? Sometimes George, sometimes others. The goal of this working group is to create an environment in which we learn together and teach each other how to analyze data.
 

## Extra Material
* [EEGLab Tutorials](https://eeglab.org/tutorials/)
* [MNE Tutorials](https://mne.tools/stable/auto_tutorials/index.html)
* [Steve Luck's ERP book](https://www.amazon.com/Introduction-Event-Related-Potential-Technique-Bradford/dp/0262525852/ref=sr_1_1?dchild=1&keywords=steve+luck+erp+book&qid=1633092461&sr=8-1)
* [Michael X. Cohen's TF-EEG book](https://www.amazon.com/Analyzing-Neural-Time-Data-Practice/dp/0262019876/ref=sr_1_4?dchild=1&keywords=michael+x+cohen&qid=1633092516&sr=8-4)
* [Michael X. Cohen's MATLAB book](https://www.amazon.com/MATLAB-Brain-Cognitive-Scientists-Press/dp/0262035820/ref=pd_bxgy_img_1/145-1967554-3071725?pd_rd_w=Hfr0B&pf_rd_p=c64372fa-c41c-422e-990d-9e034f73989b&pf_rd_r=VXS7NV4K75XE7G6024AK&pd_rd_r=72e131d1-117c-4a9b-8492-068c097e3322&pd_rd_wg=chIb8&pd_rd_i=0262035820&psc=1)


## Schedule (work-in-progress)

####  Overview
We will begin by using MATLAB almost entirely. We will learn how to preprocess EEG data using the MADE pipeline, which is based around the EEGLAB toolbox. We will then move onto how to compute/plot/export ERP data and perform basic statistical analyses. We will then move on to time-frequency analyses within the MATLAB-based PTB toolbox, and likely via native MATLAB-based code as well. At this point, the direction in which the working group moves will depend on the needs/interests of the lab; however, the current plan is to move on to source localization via the MATLAB-based FieldTrip toolbox, followed by an increased focus on Python-based analyses using MNE, to include an introduction to the PEPPER pipeline, as well as ERP, time-frequency, and source-based analyses within Python.
 
#### Week 1
**During the meeting:**
1. Overview of working group
2. Download/set-up MATLAB and EEGLAB
    - MATLAB download is user-dependent (will discuss)
    - [eeglab2021.1](https://sccn.ucsd.edu/eeglab/downloadtoolbox.php)
3. Explore MATLAB and EEGLAB GUI
4. Preview of what to do before the next meeting
5. Discussion of example dataset(s)
    - Data we will all start with
    - What data will you “branch off” to?
    - At what point will you have the skills needed to “branch off” for a paper?

**Before the next meeting:**
* Complete [modules 1-6](https://swcarpentry.github.io/matlab-novice-inflammation/)
* Read the following three concept pages from the EEGLAB tutorial:
    - [EEGLAB data structures](https://eeglab.org/tutorials/ConceptsGuide/Data_Structures.html)
    - [Coordinate systems](https://eeglab.org/tutorials/ConceptsGuide/coordinateSystem.html)
    - [EEGLAB functions](https://eeglab.org/tutorials/ConceptsGuide/EEGLAB_functions.html)
* Read the MADE Pipeline paper (Debnath_Buzzell_et_al_2020.pdf)
 
#### Week 3
**During the meeting:**
1. Q/A for the software carpentry MATLAB intro
2. Q/A for EEGLAB data structure, coordinate system, and functions
3. Begin discussion of MADE paper

**Before the next meeting:**
* Clone the [MADE Pipeline repo](https://github.com/ChildDevLab/MADE-EEG-preprocessing-pipeline)
* Download the example dataset:  Link TBD
* Watch MADE-tutorial-1 and perform exercises: Link TBD
* Note that data and video(s) were not posted in time
 
#### Week 5 (Oct. 22)
**During the meeting:**
* Note that data and video(s) were not posted in time. Thus, the live session this week will be slightly different, involving a live walk-through of some of the code, along with normal discussion. 
1. Continue discussion of MADE paper
2. MADE-tutorial-1 (live walk through); download this zip file: https://drive.google.com/file/d/1MJYtmuiyxevA20BrQgTABnFAWS0KYJyX/view?usp=sharing
3. ICA discussion
4. General Q/A for MADE-tutorial-1

**Before the next meeting:**
* Watch MADE-tutorial-1 as a review of what was covered during the prior live session: LINK
* Watch MADE-tutorial-2 and perform exercises: LINK

#### Week 7 (Nov. 5)
**During the meeting:**
1. Q/A for MADE-tutorial-2
2. Additional MADE examples/exercises

**Before the next meeting:**
* Watch ERP-tutorial-1 and perform exercises: LINK
* Watch ERP-tutorial-2 and perform exercises: Link TBD

#### Week 9 (Nov. 19)
**During the meeting:**
1. Q/A for ERP-tutorial-1 & 2
2. Additional ERP examples/exercises



