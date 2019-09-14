require 'src/Dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
  })

  gStateMachine = StateMachine {
    ['play'] = function() return PlayState() end
  }
  gStateMachine:change('play')
end

function love.resize(w, h)
  push:resize(w, h)
end

function love.update(dt)
  gStateMachine:update(dt)
end

function love.draw()
  push:apply('start')

  gStateMachine:render()

  push:apply('end')
end
