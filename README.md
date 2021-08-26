# C.Psyd Handbook

## Welcome to C.Psyd
Welcome to the team! Our goal is to better understand incremental language processing strategies by studying humans, building computational models of language processing, and conducting interpretability studies of neural network models. There are a few things you should know right up front:

#### Tips for Graduate Students
1) We are scientists. What that really means is that we specialize in confronting our ignorance one incremental question at a time. As a result, we effectively are in the business of continually exposing what we don't know. This can be very uncomfortable, especially at first. I highly recommend reading [this wonderful piece](https://journals.biologists.com/jcs/article/121/11/1771/30038/The-importance-of-stupidity-in-scientific-research) for some perspective.
2) Course projects are helpful for learning course material, but you will retain the material better if you can design projects so that they are relevant to your research interests. Plus, then you can do some actual research with them, which could lead to later publications! 
3) An important component of your job as a scientist is to communicate your findings. Effective communication takes practice. Luckily, you will have plenty of chances to practice. Whenever you have a chance to present your work (in class, in a research group, at a conference, or as an invited talk), take it! The more you do it, the better you'll get.
4) People differ in their tolerance of and susceptibility to social media. If you can stand it, keep an eye on academic Twitter to get a better sense of what's being discussed. You can also establish a presence on twitter to communicate your findings and make connections. Twitter is invaluable for virtual conferences; Twitter effectively *is* the networking part of virtual conferences.

#### Tips for C.Psyders
1) We have a very active slack workspace where most of the communication in the lab takes place. You should join the workspace and check it regularly. Email me for details.  
(Slack access is currently restricted to students and faculty who are regular members of C.Psyd)
2) We have an email list to announce invited talks and other news. All are welcome to join the email list. Just email me to get added.
3) If you have questions, feel free to ask someone else in the lab or bring it up in the `#font-of-wisdom` slack channel. 
4) You should monitor the arXiv feed every day (released daily at 9pm EST; C.Psyders can check the `#arxivcscl` channel in slack). Read every title. For relevant titles, read the abstract. For relevant abstracts, read the paper. Getting into this habit will really help you stay on top of the literature. Do the same thing once conference programs are announced.

## PhD Timeline
Here is the target C.Psyd timeline along with milestone goals and suggestions
#### Year One
* Coursework to get a strong foundation of theoretical linguistics upon which to build  
* Participate in multiple labs and research groups and start doing research (which will likely result in your Q-paper)
* Apply for the NSF Graduate Research Fellow Program (GRFP)
#### Year Two
* Additional coursework to round out your foundational knowledge
* Defend your Q-paper in the Q-exam
* Continue doing research in multiple areas (which will likely become your A-paper)
#### Year Three
* Submit at least one paper for publication (probably your Q-paper).  
**From now on, aim to get at least one paper submitted per year.** Among other things, this will help ensure that you are well-integrated into the relevant research community when you go on the job market.
* Defend your A-paper in the A-exam
* Start formulating your dissertation proposal
* Dip a toe into the job market  
  * Industry track: Apply for industry internships  
  * Academic track: Apply for internships at other research labs
#### Year Four
* In Fall, defend your dissertation proposal in the P-exam
* Apply for dissertation research funding (like the NSF Doctoral Dissertation Research Improvement grant; Ling DDRI)
* On the market (softly)
  * Industry track: Apply for industry internships
  * Academic track: Focus on your research profile, apply to a few dream positions  
(if you get an offer, you can defer until you finish, but this will help you become familiar with interviews and the market)
* Start your dissertation work
#### Year Five
* On the market:
  * Academic track: In Fall, apply for tenure-track positions and postdocs  
(you may also receive postdoc offers at conferences, so you should be very active on the conference circuit)
  * Industry track: In Spring, apply for company positions
* Defend your dissertation in the B-exam

## G2 Cluster
We have access to the G2 Cluster at Cornell. It's great! But if you've never used a computing cluster before, it might be daunting to get started. We've all had to start somewhere. Here are some tips to get you started, and don't be afraid to ask for help as you need it.

### Setup Conda environment
In order to install an use python libraries, you should use conda
First create a new python environment:

    conda create --name CONDA_ENV_NAME python=3.9

When you want to use an environment, activate it:

    conda activate CONDA_ENV_NAME

Once activated, you can install python packages into the environment:

    conda install PACKAGENAME

Those packages are available anytime you run python while the environment is active. To activate a conda environment from an arbitrary node on the cluster, you need a little extra syntactic sugar (see `dynamic_arrays.sh`). 
