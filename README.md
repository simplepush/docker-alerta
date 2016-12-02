# Docker Alerta

## Monitor disk space, memory and CPU usage
#### Get alerts to your smartphone

Get the Simplepush app at https://simplepush.io.  
There is no registration required.  
You will get your unique key directly after opening the app.

`docker run -e KEY='YourSimplepushKey' -e CPU='90' -d simplepush/alerta`
Get an alert when your CPU hits a workload of 90%.

`docker run -e KEY='YourSimplepushKey' -e MEM='300' -d simplepush/alerta`
Get an alert when your available memory gets down to 300 megabytes.

`docker run -e KEY='YourSimplepushKey' -e DISK='80' -v '/home/user:/mnt:ro' -d simplepush/alerta`
Get an alert when the disk space of the partition where /home/user is located on, hits 80% usage.

All options can be used in one container:
`docker run -e KEY='YourSimplepushKey' -e CPU='90' -e MEM='300' -e DISK='80' -v '/home/user:/mnt:ro' -d simplepush/alerta`

#### Define resource checking frequency

By default checks will be run every 10 minutes.

You can define another frequency by setting the `REPEAT` environment variable.
For example `-e REPEAT='1h'` will check every hour and `-e REPEAT='30m'` will check every 30 minutes.

#### Define an identifier

You can define an identifier for your alert messages.
This is helpful when you monitor more than one server.

Define an identifier with `-e IDENTIFIER='YourServerName'`.

#### Define an event

You can define an event with `-e EVENT='YourEvent'`.
With events you can customize vibrations and ringtones in the Simplepush app.
