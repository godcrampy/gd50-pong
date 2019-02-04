push = require("push")

window_height = 720
window_width = 1280
virtual_height = 243
virtual_width = 432

function love.load( ... )
    love.graphics.setDefaultFilter('nearest', 'nearest')

    small_font = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(small_font)
    push:setupScreen(virtual_width, virtual_height, window_width, window_height, {
        resizable=false,
        fullscreen=false,
        vsync=true
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()
    love.graphics.clear(15/255, 45/255, 52/255, 1) --sets the background color of the screen
    love.graphics.printf('Pong!', 0, 20, virtual_width, 'center') --print the title
    --Make Paddles and the ball
    love.graphics.rectangle('fill', 10 ,30, 5, 20)
    love.graphics.rectangle('fill', virtual_width-10 ,virtual_height-50, 5, 20)
    love.graphics.rectangle('fill', virtual_width/2 ,virtual_height/2, 4, 4)
    push:finish()
end