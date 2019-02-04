push = require("push")

window_width = 1280
window_height = 720
virtual_width = 432
virtual_height = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest') -- Use 'nearest' filterMode when scaling images up and down.
    push:setupScreen(virtual_width,virtual_height,window_width,window_height, { -- push init
        fullscreen=false,
        resizable=false,
        vsync=true
    })
end

function love.keypressed(key)
    if key == 'escape' then --if esc key pressed, quit the game
        love.event.quit()
    end
end

function love.draw ()
    push:start()
        love.graphics.printf('Pong', 0, virtual_height/2, virtual_width, 'center')
    push:finish()
end