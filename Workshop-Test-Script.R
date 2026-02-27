library(lme4)
library(tidyverse)

df <- iris

plot(df$Sepal.Width, df$Sepal.Length)

df %>% ggplot(mapping = aes(x=Sepal.Width, y=Sepal.Length, colour = Species)) +
  geom_point()
df %>% ggplot(mapping = aes(x=Sepal.Width, y=Sepal.Length, colour = Species)) +
  geom_point() +
  geom_smooth()

s.width.length <- lm(Sepal.Width ~ Sepal.Length, data = df)
summary(s.width.length)

s.wl.rand <- lmer(Sepal.Width ~ Sepal.Length + (1|Species), data = df)
summary(s.wl.rand)

ranef(s.wl.rand)
