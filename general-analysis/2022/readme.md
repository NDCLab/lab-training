# General Analysis Working Group
 
## Purpose
 
The overall purpose of this working group is to create an environment in which we learn from, and teach each other, how to use programming tools/concepts to process common forms of NDCLab data.
 
The primary languages used will be R and Python. However, we may also incorporate Matlab to some extent (although the goal is to minimize use of Matlab as much as possible, given that it is not open source).
 
As much as possible, we will emphasize best practices for data science, including:
 
* GitHub (and adhering to our established/evolving GitHub etiquette)
* Code reviews
* Use of producible computing environments (Conda, Docker, Singularity)
* Local and HPC data processing
* Proper documentation
 
However, our primary goal is not to ensure that we do all of the above, from the start. Rather, the most important goal is to simply **get started** analyzing data. As we progress, we will incorporate more best practices.
 
Kinds of data we will work with, and the analyses we will perform:
 
* Learn how to organize/clean, and analyze (statistically) data that we will commonly interact with in the NDCLab
* How to read in, organize/clean questionnaire and behavioral (task) data, as well as how to compute “features” of interest for these kinds of data
* For any features (based on questionnaire, behavioral tasks, extracted audio/video codes, or EEG metrics) we will learn how to compute summary statistics (mean, standard deviation, etc.), as well as perform inferential statistics (t-tests, ANOVA, regression, etc.)
 

## Structure
 
The working group will adopt a “flipped classroom” design, where you all learn material ahead of time (through assigned online modules, readings, and/or watching pre-recorded videos), and then during our meeting each week we will have some time for review/Q/A to clarify/enhance your understanding. The majority of time during each meeting will then be spent on actively **applying** what you learned that week to REAL data. That is, data we intend to use for one or more publications.
 
The structure is subject to change, but initially, we will adopt a more formal schedule, following along with [this Software Carpentry module](https://swcarpentry.github.io/r-novice-gapminder/) that teaches R/RStudio. Each week you are expected to go through the assigned modules BEFORE the working group meeting. You are highly encouraged to post questions/comments on the #training channel throughout the week as you work through the modules on your own, or ideally, in small groups. In fact, you should not come to the weekly meetings with questions that you have not already posted on the #training channel. Of course, there will be additional questions that spontaneously arise during our live meetings, and please ask those, but please do not hold onto questions you have prior to a meeting.
 

## Leadership
 
Who will lead the live meetings each week? Sometimes George, sometimes others. The goal of this working group is to create an environment in which we learn together and teach each other how to analyze data.
 
## Topics to Cover
* **Basic descriptive statistics:** Mean, Standard Deviation, Standard Error, when to log-transform, outlier detection
* **“Standard” processing stream for behavioral data:** Import data, reformat, remove unnecessary rows/columns, (re)label/annotate, select relevant data and compute metrics of interest, outlier detection
* **Basic inferential statistics and associated plots:**
    * T-tests (repeated vs independent), correlation, partial correlation
    * Bar plots, Line plots, scatter plots, Corellelegram, denoting standard error
* **“Standard” processing stream for questionnaire data**

#### Intermediate statistics**
* ANOVA
* Simple regression models
* Factor analysis

#### “Advanced” statistics**
* Hierarchical linear modelling
* Structural equation modelling
* Mediation


## Schedule (work-in-progress)
 
#### Jan 14
**During the meeting:**
Review of efforts to code the N-Back and discussion.

**Before the next meeting:**
* Complete [module 8](https://swcarpentry.github.io/r-novice-gapminder/)
> (8) Creating Publication-Quality Graphics with ggplot2
* Add at least one contribution to the R standards doc, based on what you learned over the last two weeks, and/or are learning over the next two weeks.

#### Jan 28
**During the meeting:**
1. Quick review and Q/A for XX
2. Apply the lessons of XX

**Before the next meeting:**
* Add at least one contribution to the R standards doc, based on what you learned over the last two weeks, and/or are learning over the next two weeks.
