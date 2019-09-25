require 'src/Dependencies'

function love.load()
  math.randomseed(os.time())
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
  })

  smallFont = love.graphics.newFont('fonts/font.ttf', 8)
  mediumFont = love.graphics.newFont('fonts/font.ttf', 28)
  hugeFont = love.graphics.newFont('fonts/font.ttf', 56)

  love.keyboard.keysPressed = {}

  gStateMachine = StateMachine {
    ['title'] = function() return StartState() end,
    ['play'] = function() return PlayState() end
  }
  gStateMachine:change('title')
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

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
    return true
  end
  return false
end

function love.update(dt)
  gStateMachine:update(dt)
  love.keyboard.keysPressed = {}
end

function love.draw()
  push:apply('start')

  gStateMachine:render()

  push:apply('end')
end
