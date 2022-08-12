# After installing Linux (debian-based)

Update all the things you can using GUI first, explore and set settings according to taste. 

### Then run following commands in terminal

`sudo apt-get update && sudo apt upgrade -y`

- To install basic important apps

`sudo apt-get install git neofetch vlc gimp vim audacity ranger gnome-tweaks timeshift obs-studio`

- To install restricted codecs for multimedia

`sudo apt-get install ubuntu-restricted-extras`

### I would recommend to install following applications

- [Visual Studio Code](https://code.visualstudio.com/Download)
- [Sublime Text 4](https://www.sublimetext.com/docs/linux_repositories.html#apt)
- [Sublime Merge](https://www.sublimemerge.com/docs/linux_repositories#apt)
- [Discord](https://discord.com/download)
- [Chrome](https://www.google.com/chrome/)
- [DroidCam](https://www.dev47apps.com/droidcam/linux/)

### Setup PulseAudio noise cancellation feature (Optional)

1. Head over to this location 

`sudo nano /etc/pulse/default.pa`

2. Copy and Paste the following at the bottom of the file

`### Enable Echo/Noise-Cancelation`

`load-module module-echo-cancel aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=1" source_name=echoCancel_source source_properties=device.description=BetterMic`

`set-default-source echoCancel_source`

`set-default-sink echoCancel_sink`

3. Restart the pulseaudio by typing 

`pulseaudio -k`

### Install zsh and oh-my-zsh

1. Install zsh (select 0 for install) and change default shell for the user

`sudo apt-get install zsh`

`chsh -s $(which zsh)`

2. Install oh-my-zsh

`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

3. Install powerlevel10k theme for zsh

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

`nano .zshrc`

Locate the ZSH_THEME entry and set its value to powerlevel10k as shown:

`ZSH_THEME="powerlevel10k/powerlevel10k”`

Apply it

`source .zshrc`

Follow the powerlevel10k configuration wizard to set up your prompt as you see fit.

### Setup IDE(s) for programming languages

- For C & C++ setup head over to my repository [here](https://github.com/saatvik333/ide-setups).
