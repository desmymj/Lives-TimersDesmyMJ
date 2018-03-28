-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- Title: NumericTextFields
-- Name: Desmy MJ
-- Course: ICS2O/3C
-- This program...

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

-------------------------------------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer

-------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------
local function AskQuestion()

 -- program chooses a random number between 1-3
   randomOperation = math.random(1,3)
    
    --generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(10, 20)
    randomNumber2 = math.random(10, 20)
    randomNumber3 = math.random(1, 20)
    randomNumber4 = math.random(1, 20)
    correctAnswer = randomNumber1 + randomNumber2

-- create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
   if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
--create question in text object
  questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
  elseif (correctAnswer < 0) then
  	correctAnswer = randomNumber2 - randomNumber1
  	questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
--create question in text object

    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "


end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectAnswer.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

-- User begins editing "numericField"
if ( event.phase == "began") then

	--clear text field
	event.target.text = ""

elseif event.phase == "submitted" then

	--when the answer is submitted (enyer key is pressed) set user inout to user's answer
	userAnswer = tonumber(event.target.text)

	--if the users answer and the correct answer are the same:
	   if (userAnswer == correctAnswer) then
		   correctObject.isVisible = true
		   timer.performWithDelay(1000, HideCorrect)
        else
        incorrectAnswer.isVisible = true
        timer.performWithDelay(1000,HideIncorrect)
	    end
    end
end

-------------------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------

--displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 35)
questionObject:setTextColor(155/255, 42/255, 198/255)

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

--Create numeric field
numericField = native.newTextField(500 ,350 , 150, 100 )
numericField.inputType = "number"

--create the correct text object and make it invisible
incorrectAnswer = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectAnswer:setTextColor(155/255, 42/255, 198/255)
incorrectAnswer.isVisible = false


--add the event listener for the numeric field
------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------



numericField:addEventListener( "userInput", NumericFieldListener)

--call the function to ask the question
AskQuestion()

--variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2

--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECT< POINTS OBJECT, POINTS


---------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------


local function UpdateTime()
	--decrememt the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft..""

	if (secondsLeft == 0 ) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO LIVES LEFT, PlAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
		--AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
		if (lives ==2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heartisVisible = false
		end

		-- *** CALL THE FUNCTION TO ASK A NEW QUESTION

	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

---------------------------------------------------------------------------------------------
-- OBJECT CREATION
---------------------------------------------------------------------------------------------

--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
