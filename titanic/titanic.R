pacman::p_load(
  tidyverse,
  keras,
  recipes
)


train <- read_csv(here::here("data", "train.csv"))
test <- read_csv(here::here("data", "test.csv"))

train %>% 
  count(Embarked)

# Creamos un recipe de nuestros datos

rec_obj <- recipe(Survived ~ ., data = train) %>% 
#  step_string2factor(Sex) %>% 
  step_num2factor(Pclass) %>% 
  step_dummy(Pclass, Sex, Embarked) %>% 
  prep(data = train)

train_m <- bake(rec_obj, newdata = train)

train_m %>% 
  glimpse
