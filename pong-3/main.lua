push = require("push")

window_width = 1280
window_height = 720
virtual_width = 432
virtual_height = 243

paddle_speed = 200 --set speed of paddle movement

function love.load( ... )
    love.graphics.setDefaultFilter('nearest', 'nearest')

    small_font = love.graphics.newFont('font.ttf', 8)
    score_font = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(small_font)

    push:setupScreen(virtual_width,virtual_height,window_width,window_height,{
        resizable = false,
        fullscreen = false,
        vsync = true
    })

    player1_score = 0
    player2_score = 0

    player1_y = 30
    player2_y = virtual_height-50
end

function love.update(dt)
    --player 1 movement
    if love.keyboard.isDown('w') then
        player1_y = player1_y - paddle_speed*dt
    elseif love.keyboard.isDown('s') then
        player1_y = player1_y + paddle_speed*dt
    end
    --player 2 movement
    if love.keyboard.isDown('up') then
        player2_y = player2_y - paddle_speed*dt
    elseif love.keyboard.isDown('down') then
        player2_y = player2_y + paddle_speed*dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()
    love.graphics.clear(40/225, 45/225, 52/225, 1)
    -- render text
    love.graphics.setFont(small_font)
    love.graphics.printf('Pong!', 0, 20, virtual_width, 'center')
    love.graphics.setFont(score_font)
    love.graphics.print(tostring(player1_score), virtual_width/2-50, virtual_height/3)
    love.graphics.print(tostring(player1_score), virtual_width/2+30, virtual_height/3)

    -- render paddles and ball
    love.graphics.rectangle('fill', 30, player1_y, 5, 20)
    love.graphics.rectangle('fill', virtual_width -30, player2_y, 5, 20)
    love.graphics.rectangle('fill', virtual_width/2, virtual_height/2, 5, 5)
    
    push:finish()
end