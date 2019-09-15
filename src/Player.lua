local runSprite = love.graphics.newImage('graphics/player/run_spritesheet.png')
local quad = love.graphics.newQuad(0, 0, 80, 125, runSprite:getDimensions())

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
  end

  self.y = self.y + self.dy

  if self.y >= VIRTUAL_HEIGHT - 125 / 2 - 40 then
    self.y = VIRTUAL_HEIGHT - 125 / 2 - 40
    self.dy = 0
    self.canJump = true
  else
    self.dy = self.dy + self.gravity * dt
  end

end

function Player:render()
  love.graphics.draw(runSprite, quad, self.x, self.y, 0, 0.5)
end
