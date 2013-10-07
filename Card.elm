import Window
import Mouse

--- Constants
h = div 392 4
w = div 950 13
numCards = 52
rows = 4
cardsPerRow = div numCards rows
imgUrl = "http://www.jfitz.com/cards/classic-playing-cards.png"


--- Main
main = lift2 (cards 5) Window.dimensions clickCount

card i = croppedImage (upperLeftPos i) w h imgUrl

cards n (x,y) i = holder (x,y) (flow right (intersperse (spacer w h) (map (\j -> (card (i + j))) [0..(n-1)])))

clickCount = count Mouse.clicks

holder (x,y) = container x y middle

upperLeftPos i = let c = mod n cardsPerRow
                     r = div n cardsPerRow
                     n = mod i numCards
                 in (c*w, r*h)



