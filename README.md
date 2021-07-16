# SSL---Converter
SSL Helper and Converter
 _______  _______  _                                  
(  ____ \(  ____ \( \                                 
| (    \/| (    \/| (                                 
| (_____ | (_____ | |                                 
(_____  )(_____  )| |                                 
      ) |      ) || |                                 
/\____) |/\____) || (____/\                           
\_______)\_______)(_______/                           
                                                      
          _______  _        _______  _______  _______ 
|\     /|(  ____ \( \      (  ____ )(  ____ \(  ____ )
| )   ( || (    \/| (      | (    )|| (    \/| (    )|
| (___) || (__    | |      | (____)|| (__    | (____)|
|  ___  ||  __)   | |      |  _____)|  __)   |     __)
| (   ) || (      | |      | (      | (      | (\ (   
| )   ( || (____/\| (____/\| )      | (____/\| ) \ \__
|/     \|(_______/(_______/|/       (_______/|/   \__/
                                                      
                                                     

About:
I created this batch script out of the need to automate my team's SSL certificate generation process.
we choose batch because we needed a lightweight solution. 
so no need to remember all the openssl codes anymore.

Dependencies: 
This script leverages on openssl executable, if you have openssl in your environment variable you are good to go.
But for those that dont, openssl is included in this package. for any reason the script fails to find openssl in your computer's environment variable or in this script's execution folder it will download it before starting provided you have an internet connection and you can reach github.com

This script also leverages on openssl.conf file, the file is particularly important if you intent to use the self certification option, the script will as well fetch this config file from its github's repo if it doesnt find it within its working directory.

HOW TO USE: 
copy the 3 files SSLHELPER.bat | openssl.exe | openssl.conf from this folder into any folder in your desktop or server then run SSLHELPER.bat
NOTE: you dont need administrator priviledges to run the batch file, even in a domain joined PC.

ISSUES/FEEDBACK/FORK/PULL:
Feel free to relay back on any feedback, issues, fork or pull request. 
