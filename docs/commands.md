# Commands

## roll(speed, direction) 

Starts the sphero rolling at the provided speed (value between `0` and `255`) and direction (value between `0` and `360`).

##### Params

- **speed** - params
- **direction** - params

##### Returns

`true or nil`

## stop 

Stops the sphero.

##### Returns

`true or nil`

## detect_collissions 

Sets the sphero to detect collisions and report them.

##### Returns

`true or nil`

## messages → [sphero_event]

Returns an array of sphero events, the messages reported by the sphero.

##### Returns

`sphero_event`

## color(:color_symbol | [red, green, blue]) → [red_int, green_int, blue_int]

You can pass a color as a symbol or an array containing RGB colors from 0 to 255 `([255, 0, 0] == red)`, if passed a symbol returns the array of RGB corresponding to the color, if passed an array of colors it returns the same array (used when setting colors to the sphero).

##### Params

- **color_symbol** - params
- **red** - params
- **green** - params
- **blue** - params

##### Returns

`[red_int, green_int, blue_int]`

## set_color([red, green, blue]) → true | nil

REVISION PENDING: You can either use it in tandem with color to set the color of the sphero or just pass an array containing RGB colors on the range `0` to `255` `([255, 0, 0] == red)`.

##### Params

- **red** - params
- **green** - params
- **blue** - params

##### Returns

`true or nil`