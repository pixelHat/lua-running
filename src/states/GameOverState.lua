local background = love.graphics.newImage('graphics/titleScreen/background.png')

GameOverState = Class{__includes=BaseState}

function GameOverState:enter(enterParams)
  self.score = enterParams.score
end

function GameOverState:update(dt)
  if love.keyboard.isDown('escape') then
    love.event.quit()
  elseif love.keyboard.isDown('return') then
    gStateMachine:change('play')
  end
end

function GameOverState:render()
  love.graphics.draw(background)

  love.graphics.setFont(hugeFont)
  love.graphics.print("SCORE", VIRTUAL_WIDTH / 2 - hugeFont:getWidth('SCORE') / 2, 150)
  love.graphics.print(self.score, VIRTUAL_WIDTH / 2 - hugeFont:getWidth(self.score) / 2, 210)
  love.graphics.setFont(mediumFont)
  love.graphics.print('Press entre to continue', VIRTUAL_WIDTH / 2 - mediumFont:getWidth('Press entre to continue') / 2, 350)
  love.graphics.print('Press escape to quit', VIRTUAL_WIDTH / 2 - mediumFont:getWidth('Press escape to quit') / 2, 380)
end
