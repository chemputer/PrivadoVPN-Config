# PrivadoVPN-Config
## OpenVPN Config For Privado.io

### AddAuth.ps1
The included "AddAuth.ps1" file can take the .ovpn files provided by Privado.io, and make 3 changes to them. 
1. Turn on comp-lzo, as it is commented out by default.
2. Change "auth-user-pass" to "auth-user-pass auth.txt", so that you can have an auth.txt file with your username and password, so you don't have to manually login every time.
3. Remove "verify-x509-name", as it's unnecessary, and doesn't work sometimes. 

To use it, open a powershell window, run the script with the argument being the folder containing the .ovpn files you want changed. You can also run it without any arguments in a folder with subdirectories with .ovpn files, and it will find them and "fix" them. Currently, it doesn't automatically get loose .ovpn files that are not in a folder if run without any arguments. 

### OpenVPN files for Privado.io
The files in this repo are different from the default in two ways:
1. They're setup to use an auth.txt file, comp-lzo, and don't use verify-x509-name.
2. There are individual files for each server in their respective folder, and there are files in the root directory that will randomly select from one of those servers for each region, using the remote-random feature. 

### Auth.txt
To use this feature, you must create an auth.txt file, and put your username on the first line, and the password on the second.
I recommend placing this in the OpenVPN config directory, and copying any .ovpn files you plan to use there as well. Alternatively, you can make one, and put it in the root, but you will also need to copy it to each subdirectory, so that those .ovpn files can access it, too. 