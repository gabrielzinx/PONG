computer = {}

function computer:load()
    --INFORMAÇÕES ÚTEIS DO COMPUTADOR
    self.drawable   = "fill"
    self.x          = 26
    self.y          = love.graphics.getHeight() / 2 - 42
    self.width      = 16
    self.height     = 56
    self.direction  = nil
    self.speed      = love.math.random(220, 300)
    self.points     = 0
end

function computer:update(dt)
    computerMoviment(self, dt)
end

function computer:draw()
    --DESENHA O COMPUTADOR COM A COR VERMELHA
    drawRectangle(self, {1, 0, 0})
end

function computerMoviment(computer, dt) --MOVIMENTA O COMPUTADOR EM DIREÇÃO A BOLA NO EIXO Y
    if ball.y > computer.y + computer.height / 2 then
        computer.direction = 1
    elseif ball.y <= computer.y + computer.height / 2 then
        computer.direction = 0
    end
    if computer.direction == 0 and computer.y >= 0 then
        computer.y = computer.y - computer.speed * dt
    elseif computer.direction == 1 and computer.y + computer.height <= love.graphics.getHeight() then
        computer.y = computer.y + computer.speed * dt
    end
end
