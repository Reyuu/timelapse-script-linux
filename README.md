# Simple timelapse tool
![preview](https://my.mixtape.moe/kintix.gif)

**Resuming your timelapses is supported!**

## Requirements
 - imagemagick
 - bash (or anything inbetween)
 - ffmpeg (optional if you won't be using stiching)
## Usage
```
./timelapse.sh [folder] [time]
	[folder] creates folder in the same directory as script
	[time] time in seconds between screen captures

	-m --movie [folder] [framerate]
		outputs stiched movie from previously taken timelapse
```

### Examples
Display script help:

`./timelapse.sh -h`

or

`./timelapse.sh --help`

Save timelapse to **mytimelapse** and set time between captures to **30**:

`./timelapse.sh mytimelapse 30`

Stich **mytimelapse** with framerate of **20** frames per second:

`./timelapse.sh -m mytimelapse 20`

or

`./timelapse.sh --movie mytimelapse 20`
