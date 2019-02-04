-- Set Window Size properties and Bring text on the screen
window_width = 1280
window_height = 720

-- Override the love.load function to set window to specific height and width. Disable fulscreen and resize. Enable vsync
-- love.load is called only at the time of starting of the game
function love.load()
    love.window.setMode(window_width, window_height, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.draw()
    love.graphics.printf('Pong', 0, window_height/2, window_width,'center')
end