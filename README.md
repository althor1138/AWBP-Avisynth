# AWBP-Avisynth
Automatic White/Black Point Picker.

function AWBP(clip input\
, int "B1X", int "B1Y", int "B2X", int "B2Y", int "B3X", int "B3Y", int "B4X", int "B4Y"\
, int "W1X", int "W1Y", int "W2X", int "W2Y", int "W3X", int "W3Y", int "W4X", int "W4Y"\
, int "bsr", int "wsr", int "outlow", int "outhigh", float "gamma", bool "whitebalance")

B1X-W4Y= x,y coordinates for area selection.
Use respective search radius parameter to set the size around the coordinates.
4 black points and 4 white points are required.

BSR=Black point search radius. Number of pixels to search around chosen coordinates.
WSR=White point search radius. Number of pixels to search around chosen coordinates.
outlow=output level for lowest pixel. Bit-depth equivalent of 16 for YUV content, for example.
outhigh=output level for high pixel Bit-depth equivalent of 235 for YUV content, for example.
gamma=floating point number gamma adjustment. Set at 1.0 for no change in gamma.
whitebalance=optional white balancing. YUV content only.
show=Show an overlay of the position and size of white/black points.
