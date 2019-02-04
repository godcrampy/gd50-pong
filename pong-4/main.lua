push = require("push")

window_width = 1280
window_height = 720
virtual_width = 432
virtual_height = 243

paddle_speed = 200 --set speed of paddle movement

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --seed random number
    math.randomseed(os.time())

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

    ball_x = virtual_width/2
    ball_y = virtual_height/2
    
    -- ball speed x component is either 100 or -100
    if math.random(2)==1 then
        ball_dx = 100
    else
        ball_dx = -100
    end
    -- ball speed y component
    ball_dy = math.random(-50, 50)
    -- initial game state
    game_state = 'start'
end

function love.update(dt)
    --player 1 movement
    if love.keyboard.isDown('w') then
        player1_y = math.max(5, player1_y - paddle_speed*dt) 
    elseif love.keyboard.isDown('s') then
        player1_y = math.min( virtual_height-25 ,player1_y + paddle_speed*dt )
    end
    --player 2 movement
    if love.keyboard.isDown('up') then
        player2_y =  math.max(5, player2_y - paddle_speed*dt) 
    elseif love.keyboard.isDown('down') then
        player2_y = math.min( virtual_height-25 ,player2_y + paddle_speed*dt )
    end
    -- ball movement
    if game_state == 'play' then
        ball_x = ball_x + ball_dx*dt
        ball_y = ball_y + ball_dy*dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if game_state == 'start' then
            game_state = 'play'
        else
            game_state = 'start'
            ball_x = virtual_width / 2 - 2
            ball_y = virtual_height / 2 - 2

            -- given ball's x and y velocity a random starting value
            -- the and/or pattern here is Lua's way of accomplishing a ternary operation
            -- in other programming languages like C
            ball_dx = math.random(2) == 1 and 100 or -100
            ball_dy = math.random(-50, 50) * 1.5
        end
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
    love.graphics.rectangle('fill', ball_x, ball_y, 5, 5)
    push:finish()
end