# Install Zsh oh-my-Zsh and theme from vim

If you want to install another vim theme you just have to edit the file that is inside this repository called **.vimrc** before executing the installation file (**install.sh**)

### installation instructions:
Before downloading the repository verify that it is in the **home/root** directory, to know if it is in this directory use this command:

	cd



# Installing Powerline fonts on Windows 10

## Steps

1. Download and extract zip from https://github.com/powerline/fonts
2. Press `Windows + x`
3. Press `a` (Selects PowerShell (Admin)
4. Navigate to directory where fonts were extracted to (`cd ${HOME}\Downloads\fonts-master\fonts-master`)
5. Set Execution policy `Set-ExecutionPolicy Bypass`
6. Press `y` then `Enter` to accept
7. Run the install file `.\install.ps1`
8. Reset Execution policy `Set-ExecutionPolicy Default`
9. Press `y` then `Enter` to accept
10. Remove the fonts folder (`cd ../.. && Remove-Item -Recurse -Force fonts-master`)

# Installing Powerline fonts on Linux

If you are running a Debian or Ubuntu based Linux distribution, there should
be a package available to install the Powerline Fonts with the following command:

	sudo apt-get install fonts-powerline

For fedora (tested on 28) or redhat based Linux distribution, there should also be a package available to install with the following command:

	sudo dnf install powerline-fonts

On other environments, you can copy and paste these commands to your terminal. Comments are fine too.

    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts

### Resources
- https://medium.com/@slmeng/how-to-install-powerline-fonts-in-windows-b2eedecace58
- https://github.com/powerline/fonts

-----------

#### clone the repository:
	git clone https://github.com/TheMasterTz/Oh_My_ZSH_Vim.git
	cd Oh_My_ZSH_Vim

before doing the installation check if you are in super user (root):
- #### super user (root):

		./install.sh

- #### not super user (root):

		sudo ./install.sh

In case you installed the vim theme you should open vim manually:

	vim