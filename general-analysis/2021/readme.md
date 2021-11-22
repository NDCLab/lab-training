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
 
#### Week 1
**During the meeting:**
1. Overview of working group
2. Download/set-up R and RStudio: [instructions here](https://swcarpentry.github.io/r-novice-gapminder/setup.html)
3. Explore the RStudio interface (and help others)

**Before the next meeting:**
* Complete [modules 1-4](https://swcarpentry.github.io/r-novice-gapminder/)
> (1) Introduction to R and RStudio</br>
> (2) Project Management With RStudio _(but we will likely diverge from the recommendations in this section)_</br>
> (3) Seeking Help</br>
> (4) Data Structures
 
#### Week 3
**During the meeting:**
1. Welcome/general comments + need to write lab R standards
2. Brief review of modules 1-4
3. Download [flanker dataset](4_ft-flanker-o_s1_r1_e1_2021-06-28_17h09.58.017.csv)
4. Discussion of standard datasets for formal trainings (flanker, DCCS; maybe multi-ef-inhibition, multi-ef-switching)
5. Discussion of datasets each of you will focus on (Flanker, DCCS, N-back, Multi-EF-inhibition, Multi-EF-switching, Multi-EF-memory, CMI behavioral datasets, clinic data, autism-go-nogo data, meta-analysis, questionnaire data, behavioral coding datasets, others?)
6. Discuss schedule/timeline for remainder of semester and goals

**Before the next meeting:**
* Complete [modules 5-6](https://swcarpentry.github.io/r-novice-gapminder/)

> (5) Exploring Data Frames</br>
> (6) Subsetting Data
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks
 
#### Week 5 (Oct. 22)
**During the meeting:**
1. Admin: Discuss pace of modules and goals. Discuss format/focus of live sessions.
2. Quick review and Q/A for modules 5-6
3. Apply the lessons of module 5/6 to our own data (same data as last meeting)

**Before the next meeting:**
* Complete [modules 7 and 9](https://swcarpentry.github.io/r-novice-gapminder/)
> (7) Control Flow</br>
> (9) Vectorization</br>
> GB's Must-Know Concepts: If/else, for loops, nested if/else and nested for loops. You should be comfortable combing these concepts to control the flow/analyses of any analysis script you will write (i.e. looping over participants/conditions, performing different analyses or pulling different data based on the evaluation of a single if/else statement or a more complicated nested set of statements. You should also be comforable with the concept of performing the same operation on an entire vector/matrix vs. applying the operation to a specific position/cell. Lastly, you should understand the difference between elementwise multiplication vs. matrix multiplication.
> 
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks
* _Reminder:_ refresh your memory about these modules the day before the next working group session and check the "Must-Know Concepts" to come prepared for the Q&A :raised_hand:

#### Week 7 (Nov. 5)
**During the meeting:**
1. Quick review and Q/A for modules 7 and 9
2. Apply the lessons of module 7 and 9 to our [own data](https://drive.google.com/file/d/1n-3BoSPBkYQmAjs9YrD4LEwz2dILRsDX/view?usp=sharing)
3. If time: explore the group results and/or start creating a similar script for other data

**Before the next meeting:**
* Adapt the Week 7 script for either the [DCCS](dccs-coding.md) and [N-Back](n-back-coding.md) tasks
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks

#### Week 9 (Nov. 19)
**During the meeting:**
1. Review of efforts to code the DCCS.
2. Discussion of t.test in R.

**Before the next meeting:**
* Adapt the Week 7 script for the other task (DCCS/N-Back).
* Update DCCS (or include if first attempt) three measures of task switching: switch to the infrequent (COLOR>SHAPE), switch back to the frequent (SHAPE>COLOR), or both.
* Use t.test and cor.test functions in R on both DCCS and N-Back.
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks
 
#### Week 11 (Dec. 10)
**During the meeting:**
1. Review of efforts to code the N-Back.
2. Discussion of t.test and cor.test in R.

**Before the next meeting:**
* Complete [module 8](https://swcarpentry.github.io/r-novice-gapminder/)
> (8) Creating Publication-Quality Graphics with ggplot2
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks

#### Week 12 tbd
**During the meeting:**
1. Quick review and Q/A for XX
2. Apply the lessons of XX to our own data (same data as last meeting)

**Before the next meeting:**
* Add at least one contribution to the R standards doc, based on what you learned over the last 2 week, and/or are learning over the next 2 weeks
