library(tidyverse)

#2017 Read and Uniquify the IDs
picks2017 <- read.csv("2017picks.csv") %>% select(-X)
players2017 <- read.csv("2017players.csv") %>% select (-X)
owners2017 <- read.csv("2017owners.csv") %>% select (-X)
leagues2017 <- read.csv("2017leagues.csv") %>% select(-X)
playerscores2017 <- read.csv("2017playerscores.csv") %>% select(-X)

leagues2017$LeagueID <- paste0(leagues2017$LeagueID, ".Y2017")
players2017$PlayerID <- paste0(players2017$PlayerID, ".Y2017")
picks2017$PlayerID <- paste0(picks2017$PlayerID, ".Y2017")
picks2017$PickID <- paste0(picks2017$PickID, ".Y2017")
picks2017$OwnerID <- paste0(picks2017$OwnerID, ".Y2017")
picks2017$LeagueID <- paste0(picks2017$LeagueID, ".Y2017")
owners2017$OwnerID <- paste0(owners2017$OwnerID, ".Y2017")
owners2017$LeagueID <- paste0(owners2017$LeagueID, ".Y2017")
playerscores2017$PlayerScoreID <- paste0(playerscores2017$PlayerScoreID, ".Y2017")
playerscores2017$PlayerID <- paste0(playerscores2017$PlayerID, ".Y2017")

#2016 Read and Uniquify the IDs
picks2016 <- read.csv("2016picks.csv") %>% select(-X)
players2016 <- read.csv("2016players.csv") %>% select (-X)
owners2016 <- read.csv("2016owners.csv") %>% select (-X)
leagues2016 <- read.csv("2016leagues.csv") %>% select(-X)
playerscores2016 <- read.csv("2016playerscores.csv") %>% select(-X)

leagues2016$LeagueID <- paste0(leagues2016$LeagueID, ".Y2016")
players2016$PlayerID <- paste0(players2016$PlayerID, ".Y2016")
picks2016$PlayerID <- paste0(picks2016$PlayerID, ".Y2016")
picks2016$PickID <- paste0(picks2016$PickID, ".Y2016")
picks2016$OwnerID <- paste0(picks2016$OwnerID, ".Y2016")
picks2016$LeagueID <- paste0(picks2016$LeagueID, ".Y2016")
owners2016$OwnerID <- paste0(owners2016$OwnerID, ".Y2016")
owners2016$LeagueID <- paste0(owners2016$LeagueID, ".Y2016")
playerscores2016$PlayerScoreID <- paste0(playerscores2016$PlayerScoreID, ".Y2016")
playerscores2016$PlayerID <- paste0(playerscores2016$PlayerID, ".Y2016")

#2015 Read and Uniquify the IDs
picks2015 <- read.csv("2015picks.csv") %>% select(-X)
players2015 <- read.csv("2015players.csv") %>% select (-X)
owners2015 <- read.csv("2015owners.csv") %>% select (-X)
leagues2015 <- read.csv("2015leagues.csv") %>% select(-X)
playerscores2015 <- read.csv("2015playerscores.csv") %>% select(-X)

leagues2015$LeagueID <- paste0(leagues2015$LeagueID, ".Y2015")
players2015$PlayerID <- paste0(players2015$PlayerID, ".Y2015")
picks2015$PlayerID <- paste0(picks2015$PlayerID, ".Y2015")
picks2015$PickID <- paste0(picks2015$PickID, ".Y2015")
picks2015$OwnerID <- paste0(picks2015$OwnerID, ".Y2015")
picks2015$LeagueID <- paste0(picks2015$LeagueID, ".Y2015")
owners2015$OwnerID <- paste0(owners2015$OwnerID, ".Y2015")
owners2015$LeagueID <- paste0(owners2015$LeagueID, ".Y2015")
playerscores2015$PlayerScoreID <- paste0(playerscores2015$PlayerScoreID, ".Y2015")
playerscores2015$PlayerID <- paste0(playerscores2015$PlayerID, ".Y2015")

owners2015 %>% rbind(owners2016) %>% rbind(owners2017) %>% 
  filter(Rank == 1) %>%
  group_by(FranchiseNumber) %>%
  summarise(N = n()) %>% ungroup() %>%
  ggplot(aes(x = factor(FranchiseNumber), y = N)) +
  geom_col() +
  xlab("Draft Slot") +
  ylab("Count") +
  ggtitle("2015-2017 MFL10 Wins by Draft Slot")
