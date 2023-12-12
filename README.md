
# Citizen Rental

FiveM customizable vehicles rental scripts for your server.
## Installation

1. Download the [latest release](https://github.com/txmdsu/citizen_rental/releases) of the script, and put it inside of your resources folder
2. Customize the script as you want (see [Configuration](#configuration)) section.
3. Update your server.cfg by adding  `start citizen_rental` at the end of the file.
4. Enjoy !
    
## Language

You can change the language of the script by changing the locale into `config/config.lua` and the NUI locale into `nui/src/config/config.json`. However, if the language you are using is not available, you can easily add one to the file `config/lang.lua` and `nui/src/config/lang.json`.

## Language

You can change the language of the script by changing the locale into `config/config.lua` and the NUI locale into `nui/src/config/config.json`. However, if the language you are using is not available, you can easily add one to the file `config/lang.lua` and `nui/src/config/lang.json`.

## Configuration

You can configure different aspects of the script which will allow you to adapt the script to your server image.

All of the configuration stuff is inside the `config/config.lua` file.

Here's a list of what's possible to change :
#### Locale config
- **Locale**: The lang of the script.

#### Marker config
- **MarkerLocation**: The position of the point on the map.
- **MarkerBlipIcon**: The point icon ID displayed on the map (click here for a list of icons)
- **MarkerBlipScale**: The scale of the point on the map.
- **MarkerBlipColor**: The color of the point on the map.
- **MarkerCustomText**: If empty, basic text will be displayed for the point on the map. You can add your custom text if you want to change this.

#### NPC config
- **NPCModel**: The model of the NPC (see the list of reference here).
- **NPCPoint**: The location of the NPC.

#### Preview config
- **VehiclePreviewCamCoords**: The coords of the camera preview mode.
- **VehiclePreviewCamRot**: The rotation of the camera preview mode.

#### Vehicle config
- **VehicleSpawnPoint**: The coords of the vehicles spawn.
- **VehiclesRent**: The vehicles available to rent (warning, do not change "cars" and "bikes" elements, just change the content to customize available vehicles) with displayed name, vehicle model and rent price.
## Support

For support, join our [Discord server](https://discord.gg/jXW8FbUTCs).


## License

[MIT](https://choosealicense.com/licenses/mit/)

