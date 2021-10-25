require('ball')
require('player')
require('computer')

function love.load()
    isStartBall = false
    ball:load()
    player:load()
    computer:load()
end

function love.update(dt)
    if isStartBall then
        ball:update(dt)
        computer:update(dt)
    end
    player:update(dt)
end

function love.draw()
    ball:draw()
    player:draw()
    computer:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(string.format("PONTUAÇÃO \nCOMPUTADOR: %s \nHUMANO: %s", computer.points, player.points))
    if isStartBall == false then
        love.graphics.print("PRESSIONE ESPAÇO PARA INICIAR O JOGO", 10, love.graphics.getHeight() - 20)
        love.graphics.print("USE AS SETAS DO TECLADO PARA SE MOVIMENTAR:\n[ArrowUp] [ArrowDown] [ArrowLeft] [ArrowRight]", love.graphics.getWidth() - 320, love.graphics.getHeight() - 32 )
    end
end

function love.keypressed(key)
    if key == 'space' then
        isStartBall = true
    end
end

function drawRectangle(table, color)
    love.graphics.setColor(color[1], color[2], color[3])
    love.graphics.rectangle(table.drawable, table.x, table.y, table.width, table.height)
end

--@gabrielzin4_4
