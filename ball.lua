ball = {}

function ball:load()
    --INFORMAÇÕES ÚTEIS DA BOLA
    self.drawable   = "fill"
    self.x          = love.graphics.getWidth() / 2 - 20
    self.y          = love.graphics.getHeight() / 2 - 20
    self.width      = 20
    self.height     = 20
    self.speedX     = love.math.random(180, 380) --DEFINE A VELOCIDADE QM QUE A BOLA SE MOVIMENTA NO EIXO x
    self.speedY     = love.math.random(180, 340) --DEFINE A VELOCIDADE QM QUE A BOLA SE MOVIMENTA NO EIXO Y
    self.directionX = love.math.random(0, 1) --DEFININE A DIREÇÃO HORIZONTAL DO OBJETO (0 PARA ESQUERDA E 1 PARA DIREITA)
    self.directionY = love.math.random(0, 1) --DEFININE A DIREÇÃO VERTICAL DO OBJETO (0 PARA BAIXO E 1 PARA CIMA)
end

function ball:update(dt)
    ballMoviment(self, dt)
    ballDirection(player, computer, self)
    ballGetPoints(self)
end

function ball:draw()
     --DESENHA A BOLA COM A COR AMARELO
    drawRectangle(self, {1, 1, 0})
end

function ballMoviment(ball, dt) --MOVIMENTA A BOLA PARA UMA DIREÇÃO ESTABELECIDA
    if ball.directionX == 0 then
        ball.x = ball.x - ball.speedX * dt
    else
        ball.x = ball.x + ball.speedX * dt
    end

    if ball.directionY == 0 then
        ball.y = ball.y - ball.speedY * dt
    else
        ball.y = ball.y + ball.speedY * dt
    end
end

function ballDirection(player, computer, ball) --DETECTA COLISÕES COM O CÉNARIO E OBJETOS, COM O RESULTADO DA SUA DIREÇÃO ALTERADA
    if ball.y <= 0 then
        ball.directionY = 1
        ball.speedY     = love.math.random(180, 340)
    elseif ball.y + ball.height >= love.graphics.getHeight() then
        ball.directionY = 0
        ball.speedY     = love.math.random(180, 340)
    end

    if ball.x + ball.width >= player.x and ball.x <= player.x + player.width and ball.y + ball.height >= player.y and ball.y <= player.y + player.height then
        ball.directionX = 0
        ball.speedX     = love.math.random(180, 480)
    elseif ball.x <= computer.x + computer.width and ball.x >= computer.x and ball.y + ball.height >= computer.y and ball.y <= computer.y + computer.height then
        ball.directionX = 1
        ball.speedX     = love.math.random(180, 450)
        computer.speed  = love.math.random(180, 240)
    end
end

function ballGetPoints(ball) --RESPONSÁVEL POR ADICONAR PONTOS NO JOGO
    if ball.x <= 0 then
        player.points = player.points + 1
        ballReset()
    elseif ball.x + ball.width >= love.graphics.getWidth() then
        computer.points = computer.points + 1
        ballReset()
    end
end

function ballReset() --RESTAURA AS INFORMAÇÕES DA BOLA TODA VEZ QUE UM PONTO É MARCADO
    ball.x          = love.graphics.getWidth() / 2 - 30
    ball.y          = love.graphics.getHeight() / 2 - 30
    ball.speedX     = love.math.random(180, 320)
    ball.speedY     = love.math.random(180, 340)
    ball.directionX = love.math.random(0, 1)
    ball.directionY = love.math.random(0, 1)
end
