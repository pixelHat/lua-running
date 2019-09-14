local background = love.graphics.newImage('graphics/terrain/city_background_night.png')

PlayState = Class{__includes = BaseState}

function PlayState:enter(enterParams) end

function PlayState:render()
  love.graphics.draw(background, 0, -100, 0, 0.5)
end
