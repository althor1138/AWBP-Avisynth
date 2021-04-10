function AWBP(clip input\
, int "B1X", int "B1Y", int "B2X", int "B2Y", int "B3X", int "B3Y", int "B4X", int "B4Y"\
, int "W1X", int "W1Y", int "W2X", int "W2Y", int "W3X", int "W3Y", int "W4X", int "W4Y"\
, int "bsr", int "wsr", int "outlow", int "outhigh", float "gamma", bool "whitebalance")
{

Scriptclip(input,"""\
width=width(input)
height=height(input)
black1=crop(last,b1x-bsr < 0 ? 0 : b1x-bsr,b1y-bsr < 0 ? 0 : b1y-bsr,b1x+bsr > width ? 0 : -(width - (b1x+bsr)),b1y+bsr > height ? 0 : -(height - (b1y+bsr)))
black2=crop(last,b2x-bsr < 0 ? 0 : b2x-bsr,b2y-bsr < 0 ? 0 : b2y-bsr,b2x+bsr > width ? 0 : -(width - (b2x+bsr)),b2y+bsr > height ? 0 : -(height - (b2y+bsr)))
black3=crop(last,b3x-bsr < 0 ? 0 : b3x-bsr,b3y-bsr < 0 ? 0 : b3y-bsr,b3x+bsr > width ? 0 : -(width - (b3x+bsr)),b3y+bsr > height ? 0 : -(height - (b3y+bsr)))
black4=crop(last,b4x-bsr < 0 ? 0 : b4x-bsr,b4y-bsr < 0 ? 0 : b4y-bsr,b4x+bsr > width ? 0 : -(width - (b4x+bsr)),b4y+bsr > height ? 0 : -(height - (b4y+bsr)))
white1=crop(last,w1x-wsr < 0 ? 0 : w1x-wsr,w1y-wsr < 0 ? 0 : w1y-wsr,w1x+wsr > width ? 0 : -(width - (w1x+wsr)),w1y+wsr > height ? 0 : -(height - (w1y+wsr)))
white2=crop(last,w2x-wsr < 0 ? 0 : w2x-wsr,w2y-wsr < 0 ? 0 : w2y-wsr,w2x+wsr > width ? 0 : -(width - (w2x+wsr)),w2y+wsr > height ? 0 : -(height - (w2y+wsr)))
white3=crop(last,w3x-wsr < 0 ? 0 : w3x-wsr,w3y-wsr < 0 ? 0 : w3y-wsr,w3x+wsr > width ? 0 : -(width - (w3x+wsr)),w3y+wsr > height ? 0 : -(height - (w3y+wsr)))
white4=crop(last,w4x-wsr < 0 ? 0 : w4x-wsr,w4y-wsr < 0 ? 0 : w4y-wsr,w4x+wsr > width ? 0 : -(width - (w4x+wsr)),w4y+wsr > height ? 0 : -(height - (w4y+wsr)))

low1=yplanemin(black1)
low2=yplanemin(black2)
low3=yplanemin(black3)
low4=yplanemin(black4)
high1=yplanemax(white1)
high2=yplanemax(white2)
high3=yplanemax(white3)
high4=yplanemax(white4)
low=Max(low1,low2,low3,low4)
high=Min(high1,high2,high3,high4)

levels(last,low,gamma,high,outlow,outhigh,false,true)
whitebalance ? coloryuv(autowhite=true) : last
""",args="input,b1x,b1y,b2x,b2y,b3x,b3y,b4x,b4y,w1x,w1y,w2x,w2y,w3x,w3y,w4x,w4y,bsr,wsr,outlow,outhigh,gamma,whitebalance")
}
