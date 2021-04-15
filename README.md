# YouTube Video Viralization Tool
A mathematical tool to optimize efforts of making viral youtube videos

![](https://img.shields.io/badge/Academical%20Project-Yes-success)
![](https://img.shields.io/badge/Data%20Source-Google%20Trends-lightgrey)
![](https://img.shields.io/badge/Made%20with-MATLAB-orange)
![](https://img.shields.io/badge/Maintained-No-red)

## Description

This project consists of a case study on YouTube viralization and can be summarized into a list of 3 goals:
- provide a solid theoretical documentation on what happens during the occurrence of viral phenomena and why do they occur
- mathematically determine and focus on the strongest factors of success on the YouTube platform (and avoid creating unnecessary complexities)
- develop an analysis tool that can be used to help optimizing for viralization the production of videos on specific subjects with specific groups of susceptible audiences

The source code was written in Matlab and a final report is provided for deeper analysis.
Keep in mind that this is an academical work and has not been field tested.

## Repository Structure

/dataset - includes example data sets of the evolution of video popularity within the YouTube platform, taken from [Google Trends](https://trends.google.com/trends/)

/docs - contains project documentation (graphics and report)

/src - contains the source code for the analysis tool

## Data Visualization

<p float="left">
  <img src="https://github.com/FilipePires98/VideoViralizationTool/blob/main/docs/img/SIRModel_JordanPetersonDebate.png" width="360px">
  <img src="https://github.com/FilipePires98/VideoViralizationTool/blob/main/docs/img/SIRModel_AvengersEndgame.png" width="360px">
</p>
<p float="left">
  <img src="https://github.com/FilipePires98/VideoViralizationTool/blob/main/docs/img/SIRModel_NotreDameFire.png" width="360px">
  <img src="https://github.com/FilipePires98/VideoViralizationTool/blob/main/docs/img/SIRModel_GoldieBlox.png" width="360px">
</p>
Simulations executed in MATLAB with the datasets from J. B. Peterson’s debate, Avengers Endgame trailer, Notre Dame’s fire and GoldieBlox’s promotional video, respectively.
The symbols *, ○, □ correspond to the values from the datasets of susceptible, infected and recovered populations.

## Author

The author of this repository is Filipe Pires, and the project was developed for the Professional and Social Aspects of Software Engineering Course Course of the licenciate's degree in Informatics Engineering of the University of Aveiro.

For further information read the [report](https://github.com/FilipePires98/VideoViralizationTool/blob/main/docs/Report.pdf) or contact me at filipesnetopires@ua.pt.
