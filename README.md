# Simple timelapse tool
![preview](https://my.mixtape.moe/kintix.gif)

## Requirements
 - imagemagick
 - bash (or anything inbetween)
 - ffmpeg (optional if you won't be using stiching)
## Usage
```
./tscrot.sh [folder] [time]
	[folder] creates folder in the same directory as script
	[time] time in seconds between screen captures

	-m --movie [folder] [framerate]
		outputs stiched movie from previously taken timelapse
```

### Examples
Display script help:

`./tscrot.sh -h`

or

`./tscrot.sh --help`

Save timelapse to **mytimelapse** and set time between captures to **30**:

`./tscrot.sh mytimelapse 30`

Stich **mytimelapse** with framerate of **20** frames per second:

`./tscrot.sh -m mytimelapse 20`

or

`./tscrot.sh --movie mytimelapse 20`
