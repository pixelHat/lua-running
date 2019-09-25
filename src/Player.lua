local runningSpritesheet = love.graphics.newImage('graphics/player/run_spritesheet.png')
local jumpSpritesheet = love.graphics.newImage('graphics/player/jumpfall_spritesheet.png')

Player = Class{}


function Player:init(x)
  self.x = x
  self.y = VIRTUAL_HEIGHT - 125 / 2 - GROUND_HEIGHT
  self.height = 125 / 2
  self.width = 80 / 2
  self.velX = 5
  self.dy = 0
  self.gravity = 30
  self.canJump = 0
  self.delayJump = true
  self.animations = StateAnimation{
    ['running'] = function() return Animation(runningSpritesheet, 79, 124, 0.05) end,
    ['jump'] = function() return Animation(jumpSpritesheet, 67, 123, 0.3) end,
  }
  self.animations:change('running')
  self.score = 0
end

function Player:collide(obstacle)
  if self.x > obstacle.x + obstacle.width then
    return false
  elseif self.x + self.width < obstacle.x then
    return false
  elseif self.y > obstacle.y + obstacle.height then
    return false
  elseif self.y + self.height < obstacle.y then
    return false
  end
  return true
end

function Player:update(dt)
  if love.keyboard.isDown('left') then
    self.x = self.x - self.velX
  elseif love.keyboard.isDown('right') then
    self.x = self.x + self.velX
  end

  if love.keyboard.isDown('up') and self.canJump then
    self.dy = -10
    self.canJump = false
    self.animations:change('jump')
    gSounds['jump']:play()
  end

  self.y = self.y + self.dy

  if self.y >= VIRTUAL_HEIGHT - 125 / 2 - 40 then
    self.y = VIRTUAL_HEIGHT - 125 / 2 - 40
    self.dy = 0
    self.canJump = true
    self.animations:change('running')
  else
    self.dy = self.dy + self.gravity * dt
  end

  self.animations:update(dt)
end

function Player:render()
  self.animations:render(self.x, self.y)
  love.graphics.print(self.score, 40, 10)
end

function Player:addPoint()
  self.score = self.score + 1
  gSounds['score']:play()
end
