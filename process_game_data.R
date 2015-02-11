
library(stringr)


con <- file('data.pgn')
open(con)
elo = vector()
result = vector()

current.line <- 1
player.number <- -1
regexp.elo.w = "WhiteElo \""
regexp.elo.b = "BlackElo \""
regexp.result = "Result \""
regexp.event = "Event"

game = 0
while (length(line <- readLines(con, n = 1, warn = FALSE)) > 0) {
  
  if (str_detect(line, regexp.event)) {
    player.number <- player.number +2
    if (game>1) {close(fileConn)}
    game = game + 1
    fileConn<-file(paste0("game_pgn/",as.character(game),".pgn"), open="w")
    open(fileConn)
  }
  writeLines(line, fileConn)
  
  
  if (str_detect(line, regexp.result)) {
    a = strsplit(line, "\"")
    w.l = strsplit(a[[1]][2], "-")
    result[player.number] = w.l[[1]][1]
    result[player.number+1] = w.l[[1]][2]
  }
  
  if (str_detect(line, regexp.elo.w)) {
    elo[player.number] = as.numeric(substr(line, 12, 15))
  }
  if (str_detect(line, regexp.elo.b)) {
    elo[player.number+1] = as.numeric(substr(line, 12, 15))
  }
  
  current.line <- current.line + 1
} 

close(con)

