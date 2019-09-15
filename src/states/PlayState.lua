local background = love.graphics.newImage('graphics/terrain/city_background_night.png')
local ground = love.graphics.newImage('graphics/terrain/ground.png')

PlayState = Class{__includes = BaseState}

function PlayState:enter(enterParams)
  self.Player = Player(100)
  self.backgroundScroll = 0
  self.backgroundScrollVelocity = 3
  self.backgroundWidth = 8192
  self.groundScroll = 0
  self.groundScrollVelocity = 150
  self.groundWidth = 988
end

function PlayState:update(dt)
  self.backgroundScroll = (self.backgroundScroll + self.backgroundScrollVelocity*dt) % self.backgroundWidth
  self.groundScroll = (self.groundScroll + self.groundScrollVelocity*dt) % self.groundWidth
  self.Player:update(dt)
end

function PlayState:render()
  love.graphics.draw(background, -self.backgroundScroll, -100, 0, 0.5)
  love.graphics.draw(ground, -self.groundScroll, VIRTUAL_HEIGHT - 40, 0, 2)
  self.Player:render()
end
