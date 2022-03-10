# After installing Linux [debian-based]

Update all the things you can using GUI first and explore and set settings according to taste. 

### Then run following commands in terminal

`sudo apt update`

`sudo apt upgrade -y`

- To install basic important apps

`sudo apt install git neofetch vlc gimp vim audacity ranger gnome-tweaks timeshift obs-studio`

- To install restricted codecs for multimedia

`sudo apt install ubuntu-restricted-extras`

### I would recommend to install following applications

- [Visual Studio Code](https://code.visualstudio.com/Download)
- [Sublime Text 4](https://www.sublimetext.com/docs/linux_repositories.html#apt)
- [Sublime Merge](https://www.sublimemerge.com/docs/linux_repositories#apt)
- [Discord](https://discord.com/download)
- [Chrome](https://www.google.com/chrome/)
- [DroidCam](https://www.dev47apps.com/droidcam/linux/)

### Setup PulseAudio noise cancellation feature

1. Head over to this location 

`sudo nano /etc/pulse/default.pa`

2. Copy and Paste the following at the bottom of the file

`### Enable Echo/Noise-Cancelation`

`load-module module-echo-cancel aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=1" source_name=echoCancel_source source_properties=device.description=BetterMic`

`set-default-source echoCancel_source`

`set-default-sink echoCancel_sink`

3. Restart the pulseaudio by typing 

`pulseaudio -k`

### Setup IDE(s) for programming languages

- For C & C++ setup head over to my repository [here](https://github.com/saatvik333/ide-setups).
