StateAnimation = Class{}

function StateAnimation:init(states)
  self.empty = {
    update = function() end,
    getCurrentFrame = function() end,
    getSpritesheet = function() end,
  }
  self.states = states or {}
  self.current = self.empty
  self.currentState = ''
end

function StateAnimation:change(state)
  if self.currentState ~= state then
    self.current = self.states[state]()
    self.currentState = state
  end
end

function StateAnimation:update(dt)
  self.current:update(dt)
end

function StateAnimation:render(x, y)
  love.graphics.draw(self.current:getSpritesheet(), self.current:getCurrentFrame(), x, y, 0, 0.5)
end
