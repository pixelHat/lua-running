local trashImage = love.graphics.newImage('graphics/terrain/trash.png')
local barricadeImage = love.graphics.newImage('graphics/terrain/barricade.png')
local obstacleImages = {trashImage, barricadeImage}

Obstacle = Class{}

function Obstacle:init(x)
  self.obstacleImage = self:chooseObstacleImage()
  self.width, self.height = self.obstacleImage:getDimensions()
  self.x = x
  self.y = VIRTUAL_HEIGHT - self.height * 2 - GROUND_HEIGHT
  self.velX = 150
  self.scored = false
end

function Obstacle:update(dt)
  self.x = self.x - self.velX * dt
end

function Obstacle:render()
  love.graphics.draw(self.obstacleImage, self.x, self.y, 0, 2)
end

function Obstacle:chooseObstacleImage()
  return obstacleImages[math.random(2)]
end
