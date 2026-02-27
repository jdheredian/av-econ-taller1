# Housekeeping
#--------------------------------------------

# Semilla para replicación.
set.seed(31416)

# Cargar las librerías necesarias.
library(sandwich)   
library(lmtest)    


# Parámetros de la simulación
#--------------------------------------------

# Número de individuos en la población.
n_population <- 1e7  

# Número de colegios.
schools <- 100     

# Número de estudiantes por colegio
stud_by_school <- n_population / schools

# Probabilidad de aparecer en la muestra.
p_sample <- 0.01  

# Número de simulaciones.
n_sim <- 500


# Construir base de datos poblacional
#--------------------------------------------

# Base para la construcción.
population <- data.frame(id = 1:n_population)

# Determinar el tratamiento.
population$D <- rbinom(n_population, size = 1, prob = 0.5)

# Determinar un colegio para cada individuo.
population$schools <- rep(1:schools, each = stud_by_school)

# Determinar el efecto por colegio.
population$school_effect <- c(rep(1, n_population / 2), rep(-1, n_population / 2))

# Construir la variable de resultado.
population$Y <- population$school_effect * population$D + runif(n_population)

