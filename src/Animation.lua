Animation = Class{}

function Animation:init(spriteSheet, spriteWidth, spriteHeight, interval)
  self.spriteSheet = spriteSheet
  self.spriteWidth = spriteWidth
  self.spriteHeight = spriteHeight
  self.interval = interval
  self.timer = 0
  self.currentFrame = 0
  self.frames = self:calculateFrames()
end

function Animation:update(dt)
  self.timer = self.timer + dt
  if self.timer >= self.interval then
    self.currentFrame = (self.currentFrame + 1) % self.frames
    self.timer = 0
  end
end

function Animation:getCurrentFrame()
  return love.graphics.newQuad(self.currentFrame*self.spriteWidth, 0, self.spriteWidth, self.spriteHeight, self.spriteSheet:getDimensions())
  -- return self.spriteSheet[self.currentFrame]
end

function Animation:calculateFrames()
  width, height = self.spriteSheet:getDimensions()
  return math.floor(width / self.spriteWidth)
end
