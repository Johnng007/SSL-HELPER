<h1 align="center">📝 SSL HELPER 📝</h1>
<h3 align="center">SSL CONVERTER AND GENERATOR BATCH SCRIPT</h3>
                                               
```bash

#   _______  _______  _                                  
#  (  ____ \(  ____ \( \                                 
#  | (    \/| (    \/| (                                 
#  | (_____ | (_____ | |                                 
#  (_____  )(_____  )| |                                 
#        ) |      ) || |                                 
#  /\____) |/\____) || (____/\                           
#  \_______)\_______)(_______/                           
#                                                        
#            _______  _        _______  _______  _______ 
#  |\     /|(  ____ \( \      (  ____ )(  ____ \(  ____ )
#  | )   ( || (    \/| (      | (    )|| (    \/| (    )|
#  | (___) || (__    | |      | (____)|| (__    | (____)|
#  |  ___  ||  __)   | |      |  _____)|  __)   |     __)
#  | (   ) || (      | |      | (      | (      | (\ (   
#  | )   ( || (____/\| (____/\| )      | (____/\| ) \ \__
#  |/     \|(_______/(_______/|/       (_______/|/   \__/
#                                                 



```


# ABOUT

I created this batch script out of the need to automate my team's SSL certificate generation process.
we choose batch because we needed a lightweight solution. 
so no need to remember all the openssl codes anymore.

## Dependencies

This script leverages on openssl executable, openssl.exe is included in this package. for any reason the script fails to find openssl in this script's execution folder it will download it before starting provided you have an internet connection and you can reach github.com

This script also leverages on openssl.conf file, the file is particularly important if you intent to use the self certification option, the script will as well fetch this config file from its github's repo if it doesnt find it within its working directory.

NOTE: For now it doesnt matter if you have openssl in your environment variable, if its not in the script's working directory, the script would not run.

```bash
openssl.exe | openssl.conf
```

## Usage

```python
# copy the files to your computer
git clone https://github.com/Johnng007/SSL-HELPER.git

# run SSLHELPER.bat
SSLHELPER.bat
```
##Features
```bash

CONVERTING FROM PEM
     1. PEM to DER.
     2. PEM to P7B.
     3. PEM TO PFX
CONVERTING FROM DER
     4. DER(.CRT .CER .DER) TO PEM.
     5. DER TO CER.
CONVERTING FROM P7B
     6. P7B TO PEM.
     7. P7B TO PFX.
     8. P7B TO CER.
CONVERTING FROM PFX
     9. PFX TO PEM.
CONVERTING FROM CER
    10. CER TO P7B
    11. CER TO PFX
    12. CER TO DER
GENERATE A SELF SIGNED CERTIFICATE
    13. GENERATE SELF SIGNED
GENERATE A SELF SIGNED CERTIFICATE AUTO
    14. GENERATE SELF SIGNED AUTO
```
## Contributing
Pull requests are welcome. For major changes, plea open an issue first to discuss what you would like to change.

NOTE: you dont need administrator priviledges to run the batch file, even in a domain joined PC.

## License
[MIT](https://mit.com/licenses/mit/)


<h3 align="left">Support:</h3>
<p><a href="https://www.buymeacoffee.com/ebuka"> <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="ebuka" /></a></p><br><br>

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://linkedin.com/in/ebuka john onyejegbu" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="ebuka john onyejegbu" height="30" width="40" /></a>
</p>

