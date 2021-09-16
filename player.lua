player = {}

function player:load()
    --INFORMAÇÕES ÚTEIS DO JOGADOR
    self.drawable   = "fill"
    self.x          = love.graphics.getWidth() - 42
    self.y          = love.graphics.getHeight() / 2 - 42
    self.width      = 16
    self.height     = 56
    self.speed      = 120
    self.direction  = ""
    self.points     = 0
end

function player:update(dt)
    --COLETANDO DADOS DE QUAL TECLA ESTÁ PRESSIONADA E DEFININDO A DIREÇÃO DO JOGADOR
    if love.keyboard.isDown("up") or love.keyboard.isDown("right") then
        self.direction = "up"
    elseif love.keyboard.isDown("down") or love.keyboard.isDown("left") then
        self.direction = "down"
    else
        self.direction = ""
    end

    --MOVENDO O JOGADOR EM UMA DIREÇÃO ESPECÍFICA E O PARADNO CASO CHEGUE NA BORDA DO CENÁRIO
    if self.direction == "down" and self.y <= love.graphics.getHeight() - self.height then
        self.y = self.y + self.speed * dt
    elseif self.direction == "up" and self.y >= 0 then
        self.y = self.y - self.speed * dt
    end
end

function player:draw()
    --DESENHA O JOGADOR COM A COR AZUL
    drawRectangle(self, {0, 0, 255})
end
