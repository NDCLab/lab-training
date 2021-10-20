

#getting started

3 + 5 * (2 ^ 2)     # if you forget some rules, this might help

log(5) #natural log

log10(5) #log base 10



#getting help
#AKA hacking your way through science

lo #then press tab for tab complete

? log #lookup the help for the log function

#example google search to learn what function to use for a given problem

#code that works is better than spending hours optimizing an elegant solution. 
#in general (but not always) start with a simple approach that works, then optimize later
#But, don't wait to add comments!!



#comparing things

1 == 1  # equality (note two equals signs, read as "is equal to")

1 != 2  # inequality (read as "is not equal to")

1 < 2  # less than

1 <= 1  # less than or equal to

# A word of warning about comparing numbers: you should never use == to compare two numbers unless they are integers (a data type which can specifically represent only whole numbers).
# Computers may only represent decimal numbers with a certain degree of precision, so two numbers which look the same when printed out by R, may actually have different underlying representations and therefore be different by a small margin of error (called Machine numeric tolerance).
# Instead you should use the all.equal function.



#variables

x <- 5 #create a variable called "x" and assign the number 5 to it

log(x) #apply the log function to our variable

# Variable names can contain letters, numbers, underscores and periods but no spaces. 
#They must start with a letter or a period followed by a letter (they cannot start with a number nor an underscore). 
#Variables beginning with a period are hidden variables. Different people use different conventions for
#long variable names, these include
# periods.between.words
# underscores_between_words
# camelCaseToSeparateWords
# What you use is up to you, but be consistent.
# It is also possible to use the = operator for assignment; BUT PLEASE DONT DO THIS



#Vectors

y<-1:5 #create the variable y and assign a vector to it that starts at 1 and iterates in increments of 1 to 5.
y*2 # multiply each element in the y vector by 2


#environment

ls #gives code for ls function
ls() #runs function with no inputs which results in all variables in global environemnt

#Like in the shell, ls will hide any variables or functions starting with a “.” by default. 
#To list all objects, type ls(all.names=TRUE) instead

rm(x) #remove the x variable from the global environment
rm(list = ls()) #remove ALL variables from the global environment



#errors

#Pay attention when R does something unexpected! Errors, like above, are thrown when R cannot proceed with a calculation. Warnings on the other hand usually mean that the function has run, but it probably hasn’t worked as expected.
#In both cases, the message that R prints out usually give you clues how to fix a problem.



#packages

# It is possible to add functions to R by writing a package, or by obtaining a package written by someone else. As of this writing, there are over 10,000 packages available on CRAN (the comprehensive R archive network). R and RStudio have functionality for managing packages:
#   
# You can see what packages are installed by typing installed.packages()
# You can install packages by typing install.packages("packagename"), where packagename is the package name, in quotes.
# You can update installed packages by typing update.packages()
# You can remove a package with remove.packages("packagename")
# You can make a package available for use with library(packagename)
# Packages can also be viewed, loaded, and detached in the Packages tab of the lower right panel in RStudio. Clicking on this tab will display all of the installed packages with a checkbox next to them. If the box next to a package name is checked, the package is loaded and if it is empty, the package is not loaded. Click an empty box to load that package and click a checked box to detach that package.
# 
# Packages can be installed and updated from the Package tab with the Install and Update buttons at the top of the tab.



#project management and best practices

#will come back to this in more detail in the future. For now, key points are:

#Treat data as read only
#This is probably the most important goal of setting up a project. Data is typically time consuming and/or expensive to collect. Working with them interactively (e.g., in Excel) where they can be modified means you are never sure of where the data came from, or how it has been modified since collection. It is therefore a good idea to treat your data as “read-only”.

#Data Cleaning
#In many cases your data will be “dirty”: it will need significant preprocessing to get into a format R (or any other programming language) will find useful. This task is sometimes called “data munging”. Storing these scripts in a separate folder, and creating a second “read-only” data folder to hold the “cleaned” data sets can prevent confusion between the two sets.

#Treat generated output as disposable
#Anything generated by your scripts should be treated as disposable: it should all be able to be regenerated from your scripts.

#There are lots of different ways to manage this output. Having an output folder with different sub-directories for each separate analysis makes it easier later. Since many analyses are exploratory and don’t end up being used in the final project, and some of the analyses get shared between projects.

#Have a standard folder structure for all lab projects, with standard naming conventions, and r code standards

#We are splitting all projects into datasets and analyses to avoid duplication in the future

#We will all be learning about dataLad in the coming months!!
  
#We will incorporate git/github into these trainings soon, but not worrying about it yet
  
#We will co-create/co-write the R standards for our labeling::extended()
  
 

#seeking help

?function_name
help(function_name)

#To seek help on special operators, use quotes or backticks:
?"<-"
?`<-`

#One of the most daunting aspects of R is the large number of functions available.
#It would be prohibitive, if not impossible to remember the correct usage for every function you use.
#Luckily, the help files mean you don’t have to!
  
#Remember: Your goal is not to become a computer scientist, but to "hack your way through science"

#Many packages come with “vignettes”: tutorials and extended example documentation.
#Without any arguments, vignette() will list all vignettes for all installed packages; 
#vignette(package="package-name") will list all available vignettes for package-name, 
#and vignette("vignette-name") will open the specified vignette.

#If a package doesn’t have any vignettes, you can usually find help by typing help("package-name").
#RStudio also has a set of excellent cheatsheets for many packages.

# If you’re not sure what package a function is in, or how it’s specifically spelled you can do a fuzzy search:
??function_name
# A fuzzy search is when you search for an approximate string match. For example, you may remember that the function to set your working directory includes “set” in its name. You can do a fuzzy search to help you identify the function:
??set

# When your code doesn’t work: seeking help from your peers
# If you’re having trouble using a function, 9 times out of 10, the answers you are seeking have already been answered on Stack Overflow. You can search using the [r] tag. Please make sure to see their page on how to ask a good question.
# If you can’t find the answer, there are a few useful functions to help you ask a question from your peers:
# ?dput
# Will dump the data you’re working with into a format so that it can be copy and pasted by anyone else into their R session.
# sessionInfo()

#It is equally important to know how to ask good questions, as it is to know how to provide good help

#If asking questions, be sure to explain what you want to happen, what appears to be happening, your current 
#understanding and what you do not understand, and to post relevant code and outputs

#if providing help, keep in mind that not everyone knows how to properly ask questions. Be careful not to
#provide quick solutions without the person learning how to: 1) properly ask their question; 2) properly apply the
#solution to other contexts; and 3) how they could might have figured out the answer on their own next time



#data structures

dir.create('/data')

#writing data
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
write.csv(x = cats, file = "feline-data.csv", row.names = FALSE)

#reading data
cats <- read.csv(file = "feline-data.csv", stringsAsFactors = TRUE)
cats

#read in flanker data from pavlovia fiu-toolbox task
flankerDat <- read.csv(file = '/Users/gbuzzell/Documents/gen-analysis-work-group/example_data/ft-flanker-o_s1_r1_e1_146668_2021-10-08_10/4_ft-flanker-o_s1_r1_e1_2021-06-28_17h09.58.017.csv', stringsAsFactors = TRUE)

#let's make that more modular...
path <- '/Users/gbuzzell/Documents/gen-analysis-work-group/example_data/ft-flanker-o_s1_r1_e1_146668_2021-10-08_10/'
filename <- '4_ft-flanker-o_s1_r1_e1_2021-06-28_17h09.58.017'
ext <- '.csv'
paste(path,filename,ext, sep = "", collapse = NULL)
flankerDat <- read.csv(file = paste(path,filename,ext, sep = "", collapse = NULL), stringsAsFactors = TRUE)

#let's explore some variables
flankerDat$key_resp_2.rt

#log transform all elements in column
log(flankerDat$key_resp_2.rt)



#data types
#There are 5 main types: double, integer, complex, logical and character.

typeof(cats$weight)


#Data structures

#data frame
class(cats)
#for data frames, all elements in a variable (column) must be the same data type
#if they differ, r will convert them all to be a common format

#vectors
my_vector <- vector(length = 3)
my_vector
str(my_vector)
#for vectors, all elements must be the same type

#indices allow you to identify the "location" of elements in a vector (or matrix)

combine_vector <- c(2,6,3)
combine_vector

#type cohersion 
coercion_vector <- c('a', TRUE)
coercion_vector
#The coercion rules go: logical -> integer -> numeric -> complex -> character, 
#where -> can be read as are transformed into. You can try to force coercion 
#against this flow using the as. functions:

character_vector_example <- c('0','2','4')
character_vector_example
character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric

ab_vector <- c('a', 'b')
ab_vector
combine_example <- c(ab_vector, 'SWC')
combine_example


sequence_example <- seq(10)
head(sequence_example, n=2)
tail(sequence_example, n=4)
length(sequence_example)

my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")
my_example


#matrices










