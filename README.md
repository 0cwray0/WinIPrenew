# WinIPrenew


## Purpose:
The purpose of this batch script is to re-establish all network adapter TCP/IP connections of a Windows PC based upon the number of seconds that the user inputs.</br>

This is a hold over meant for very niche purposes such as constant NIC connectivity issues or corporate network issues, and carries NO stated warranty.</br>  

## Usage:
Upon execution ["-1" will refresh on a keypress] ["1-99999" function as stated] ['e' for exit] ['h' for help]</br>
</br>
To Run:
```
cd navigate\to\directory\where\batch\file\resides
WinIPrenew.bat
```
</br>

## Issues:
Certain operators still evade the input sanitization I've instituted. Ex. ([<],[>],[,],[|],["],[;])
