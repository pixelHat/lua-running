local background = love.graphics.newImage('graphics/terrain/city_background_night.png')
local ground = love.graphics.newImage('graphics/terrain/ground.png')

perdeu = 0

PlayState = Class{__includes = BaseState}

function PlayState:enter(enterParams)
  self.player = Player(100)
  self.backgroundScroll = 0
  self.backgroundScrollVelocity = 3
  self.backgroundWidth = 8192
  self.groundScroll = 0
  self.groundScrollVelocity = 150
  self.groundWidth = 988
  self.obstacles = Obstacles(1.5)
end

function PlayState:update(dt)
  self.backgroundScroll = (self.backgroundScroll + self.backgroundScrollVelocity*dt) % self.backgroundWidth
  self.groundScroll = (self.groundScroll + self.groundScrollVelocity*dt) % self.groundWidth
  self.player:update(dt)
  self.obstacles:update(dt)

  if self.obstacles:collide(self.player) then
    gSounds['hurt']:play()
    gStateMachine:change('gameOver', {['score'] = self.player.score})
  end
end

function PlayState:render()
  love.graphics.draw(background, -self.backgroundScroll, -100, 0, 0.5)
  love.graphics.draw(ground, -self.groundScroll, VIRTUAL_HEIGHT - 40, 0, 2)
  self.player:render()
  self.obstacles:render()
end
