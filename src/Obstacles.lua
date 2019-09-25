Obstacles = Class{}

function Obstacles:init(timerToSpawn)
  self.timer = 0
  self.spawnTimer = timerToSpawn
  self.obstacles = {}
  self.timer = 0
  self.spawnTimer = 1.5
end

function Obstacles:update(dt)
  for k, obstacle in pairs(self.obstacles) do
    obstacle:update(dt)
  end

  self.timer = self.timer + dt
  if self.timer >= self.spawnTimer then
    self.timer = math.random(0, 0.4)
    table.insert(self.obstacles, Obstacle(VIRTUAL_WIDTH))
  end
end

function Obstacles:render()
  for k, obstacle in pairs(self.obstacles) do
    obstacle:render()
  end
end

function Obstacles:collide(player)
  for k, obstacle in pairs(self.obstacles) do
    if simpleCollide(player, obstacle) then
      return true
    elseif not obstacle.scored then
      if obstacle.x + obstacle.width < player.x then
        player:addPoint()
        obstacle.scored = true
      end
    end
  end
  return false
end

function simpleCollide(obj1, obj2)
  if obj1.x > obj2.x + obj2.width then
    return false
  elseif obj1.x + obj1.width < obj2.x then
    return false
  elseif obj1.y > obj2.y + obj2.height then
    return false
  elseif obj1.y + obj1.height < obj2.y then
    return false
  end
  return true
end
