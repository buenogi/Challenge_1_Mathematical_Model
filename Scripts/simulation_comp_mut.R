# Packages used

library(deSolve)
library(ggplot2) 
library(tidyr)

# Population dynamics models
source("fct/LV_CoMu.R")


# Simulations

## Mutualism

# In this situation both populations are in low density.

# LV parameters
a <- c(0.02, 0.01)
r <- c(1, 1)
K <- c(3500,3000)
p1 <- list(r, a, K)
N0 <- c(10, 10) # N1[1] E N2[2]
t <- c(1:100)

#Solving the equation

Out_LVmut <- ode(y = N0, times = t, func = LV_CoMu, parms = p1)
head(Out_LVcomp)

df_LVmut <- pivot_longer(as.data.frame(Out_LVmut), cols = 2:3)

# Plotting the results
ggplot(df_LVmut) +
  geom_line(aes(x = time, y = value, color = name)) +
  labs(x = "Time", y = "N", color = "Species") +
  theme_classic()

## Competition

#In this situation both populations are in high density.
# LV parameters
a <- c(0.02, 0.01)
r <- c(1, 1)
K <- c(3500,3000)
p1 <- list(r, a, K)
N0 <- c(10000, 10000) # N1[1] E N2[2]
t <- c(1:100)

#Solving the equation

Out_LVcomp <- ode(y = N0, times = t, func = LV_CoMu, parms = p1)
head(Out_LVcomp)

df_LVcomp <- pivot_longer(as.data.frame(Out_LVcomp), cols = 2:3)

#Plotting the results

ggplot(df_LVcomp) +
  geom_line(aes(x = time, y = value, color = name)) +
  labs(x = "Time", y = "N", color = "Species") +
  theme_classic()


# Outcomes

## Elimination

# LV parameters
a <- c(0.02, 0.01)
r <- c(1, 1)
K <- c(3500,0.001)
p1 <- list(r, a, K)
N0 <- c(3500, 0.001) # N1[1] E N2[2]
t <- c(1:350)


#Solving the equation

Out_LVeli <- ode(y = N0, times = t, func = LV_CoMu, parms = p1)
head(Out_LVeli)


df_LVeli <- pivot_longer(as.data.frame(Out_LVeli), cols = 2:3)


ggplot(df_LVeli) +
  geom_line(aes(x = time, y = value, color = name)) +
  labs(x = "Time", y = "N", color = "Species") +
  theme_classic()


## Bistability
# LV parameters
a <- c(0.02, 0.01)
r <- c(1, 1)
K <- c(0.001,0.001)
p1 <- list(r, a, K)
N0 <- c(0.001, 0.001) # N1[1] E N2[2]
t <- c(1:100)

#Solving the equation

Out_LVbis <- ode(y = N0, times = t, func = LV_CoMu, parms = p1)
head(Out_LVbis)


df_LVbis <- pivot_longer(as.data.frame(Out_LVbis), cols = 2:3)


ggplot(df_LVbis) +
  geom_line(aes(x = time, y = value, color = name)) +
  labs(x = "Time", y = "N", color = "Species") +
  theme_classic()


## Coexistence

# LV parameters
a <- c(0.02, 0.01)
r <- c(1, 1)
K <- c(3500,3000)
p1 <- list(r, a, K)
N0 <- c(3465, 2940) # N1[1] E N2[2]
t <- c(1:100)

#Solving the equation

Out_LVcoex <- ode(y = N0, times = t, func = LV_CoMu, parms = p1)
head(Out_LVcoex)

df_LVcoex <- pivot_longer(as.data.frame(Out_LVcoex), cols = 2:3)


ggplot(df_LVcoex) +
  geom_line(aes(x = time, y = value, color = name)) +
  ylim(0,4000)+
  labs(x = "Time", y = "N", color = "Species") +
  theme_classic()

