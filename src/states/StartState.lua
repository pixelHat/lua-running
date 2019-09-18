local background = love.graphics.newImage('graphics/titleScreen/background.png')

StartState = Class{__includes = BaseState}

function StartState:init()
  self.highlight = 0
  self.options = 2
end

function StartState:update(dt)
  if love.keyboard.isDown('return') then
    if self.highlight == 0 then
      gStateMachine:change('play')
    end
  elseif love.keyboard.wasPressed('down') then
    self.highlight = (self.highlight + 1) % self.options
  elseif love.keyboard.wasPressed('up') then
    self.highlight = (self.highlight - 1) % self.options
  end
end

function StartState:render()
  love.graphics.draw(background)
  love.graphics.setFont(hugeFont)
  love.graphics.printf('Just Run', 0, 64, VIRTUAL_WIDTH, 'center')
  love.graphics.setFont(mediumFont)

  if (self.highlight == 0) then
    love.graphics.setColor(0, 255, 255, 255)
  end
  love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(255, 255, 255, 255)

  if (self.highlight == 1) then
    love.graphics.setColor(0, 255, 255, 255)
  end
  love.graphics.printf('Scores', 0, VIRTUAL_HEIGHT / 2 + 50, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(255, 255, 255, 255)
end

function StartState:enter(enterParams)
end

function StartState:exit(enterParams)
end
