require 'src/Dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
  })

  love.keyboard.keysPressed = {}

  gStateMachine = StateMachine {
    ['play'] = function() return PlayState() end
  }
  gStateMachine:change('play')
end

function love.resize(w, h)
  push:resize(w, h)
end

function love.keypressed(key)
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
  love.keyboard.keysPressed[key] = true
end

function love.wasPressed(key)
  if love.keyboard.keysPressed[key] then
    return true
  end
  return false
end

function love.update(dt)
  love.keyboard.keysPressed = {}
  gStateMachine:update(dt)
end

function love.draw()
  push:apply('start')

  gStateMachine:render()

  push:apply('end')
end
