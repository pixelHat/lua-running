local obstacleImage = love.graphics.newImage('graphics/terrain/trash.png')

Obstacle = Class{}

function Obstacle:init(x)
  self.height, self.width = obstacleImage:getDimensions()
  self.x = x
  self.y = VIRTUAL_HEIGHT - self.height * 2 - GROUND_HEIGHT
  self.velX = 150
end

function Obstacle:update(dt)
  self.x = self.x - self.velX * dt
end

function Obstacle:render()
  love.graphics.draw(obstacleImage, self.x, self.y, 0, 2)
end
