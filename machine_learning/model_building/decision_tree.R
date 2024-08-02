# Load neccsary libraries
library(tidymodels)
library(tidyverse)
library(rpart.plot)

# Read in the simple dataset
df <- read_csv("sample_data_regression.csv")


data_split <- initial_split(df, prop = 0.8)
train_data <- training(data_split)
test_data <- testing(data_split)

decision_tree_spec <- decision_tree(
  cost_complexity = tune(),
  tree_depth = tune()
) %>%
  set_engine("rpart") %>%
  set_mode("regression")

data_recipe <- recipe(output ~ ., data = train_data)

workflow <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(decision_tree_spec)

set.seed(123)
folds <- vfold_cv(train_data, v = 5)

# Define a grid of hyperparameters to tune
tree_grid <- grid_regular(
  cost_complexity(),
  tree_depth(),
  levels = 5
)

# Tune the model
tuned_results <- tune_grid(
  workflow,
  resamples = folds,
  grid = tree_grid
)

# Get the best hyperparameters
best_params <- select_best(tuned_results, metric =  "rmse")

final_model <- finalize_workflow(
  workflow,
  best_params
)

# Fit the final model to the training data
final_fit <- fit(final_model, data = train_data)

# Predict on test data
test_predictions <- predict(final_fit, new_data = test_data) %>%
  bind_cols(test_data)

# Evaluate the model
metrics <- metric_set(rmse, rsq)
model_metrics <- metrics(test_predictions, truth = output, estimate = .pred)

# Print the metrics
print(model_metrics)

trained_model <- extract_fit_engine(final_fit)
# Plot the decision tree
rpart.plot(trained_model)
