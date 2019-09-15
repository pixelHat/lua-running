local runSprite = love.graphics.newImage('graphics/player/run_spritesheet.png')
local quad = love.graphics.newQuad(0, 0, 80, 125, runSprite:getDimensions())

Player = Class{}

function Player:init(x)
  self.x = x
  self.y = VIRTUAL_HEIGHT - 125 / 2 - 40
  self.velX = 5
  self.dy = 0
  self.gravity = 5
  self.canJump = 0
  self.delayJump = 25
end

function Player:update(dt)
  if love.keyboard.isDown('left') then
    self.x = self.x - self.velX
  elseif love.keyboard.isDown('right') then
    self.x = self.x + self.velX
  end

  if love.keyboard.isDown('up') and self.canJump == 0 then
    self.dy = -30
    self.canJump = self.delayJump
  end

  self.y = self.y + self.dy
  self.canJump = math.max(0, self.canJump - 1)

  if self.y >= VIRTUAL_HEIGHT - 125 / 2 - 40 then
    self.y = VIRTUAL_HEIGHT - 125 / 2 - 40
    self.dy = 0
  else
    self.dy = self.dy + self.gravity
  end

end

function Player:render()
  love.graphics.draw(runSprite, quad, self.x, self.y, 0, 0.5)
end
