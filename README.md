
<img src="https://industrial.uniandes.edu.co/sites/default/files/imagenes/uniandeslogo.png" alt="Universidad de los Andes" style="float: right; width: 300px; height: auto;">

# Taller 1 — Econometría Avanzada 2026-1

Econometría Avanzada (ECON 2126) · Profesor: Manuel Fernández

Juan Diego Heredia Niño (201813809)

---

## Descripción

Este repositorio contiene la solución al Taller 1 de Econometría Avanzada (2026-1). El taller cubre tres ejercicios:

- **Ejercicio 1:** Resultados potenciales, sesgo de selección e inferencia causal en un experimento de campo con asignación por salón.
- **Ejercicio 2:** Errores estándar con clustering multinivel. Datos de Gershenson et al. (2022) sobre el efecto de docentes de la misma raza en resultados académicos.
- **Ejercicio 3:** Balance muestral, atrición e ITT. Datos de Dupas et al. (2025) sobre el efecto de un subsidio a anticonceptivos modernos en Kenia.

---

## Estructura del proyecto

```
av-econ-taller1/
│
├── data/
│   ├── raw/
│   │   ├── race_teaching.dta        # Gershenson et al. (2022) — ejercicio 2
│   │   ├── baseline_sample.dta      # Línea base Dupas et al. (2025) — ejercicio 3
│   │   ├── endline_sample.dta       # Seguimiento Dupas et al. (2025) — ejercicio 3
│   │   └── listing_sample.dta       # Censo de hogares — ejercicio 3
│   ├── processed/                   # (vacío — sin transformaciones intermedias)
│   └── temp/                        # (vacío — archivos temporales no versionados)
│
├── notebooks/
│   ├── paths.yml                    # Rutas absolutas (editar según sistema)
│   ├── ejercicio2.ipynb             # Regresiones + simulación (Gershenson)
│   └── ejercicio3.ipynb             # Balance muestral + ITT (Dupas)
│
├── docs/
│   ├── Taller 1.tex                 # Documento LaTeX principal
│   ├── Taller 1.pdf                 # PDF compilado
│   ├── answers/                     # Respuestas por inciso (34 archivos .tex)
│   │   ├── ej1_1a.tex … ej1_4.tex  # Ejercicio 1 (9 archivos)
│   │   ├── ej2_1.tex  … ej2_8.tex  # Ejercicio 2 (8 archivos)
│   │   └── ej3_1.tex  … ej3_7b.tex # Ejercicio 3 (17 archivos)
│   ├── tables/
│   │   └── cover_rate.tex           # Tabla de cobertura (generada por ejercicio2.ipynb)
│   ├── code/
│   │   └── simul-clusters.R         # Código de simulación (Susan Athey, incluido en el enunciado)
│   └── style/                       # Estilos LaTeX (avm.sty, btree.sty, lstlisting.tex, uniandes.pdf)
│
├── outputs/
│   └── tables/
│       ├── tabla_p5_efectos.tex     # Efectos SAT / universidad (ejercicio 2)
│       ├── tabla_p6_clusters.tex    # Sensibilidad a nivel de clustering (ejercicio 2)
│       ├── tabla_descriptivas.tex   # Estadísticas descriptivas (ejercicio 3)
│       ├── tabla_balance.tex        # Balance muestral (ejercicio 3)
│       └── tabla_itt.tex            # Efectos ITT (ejercicio 3)
│
├── requirements.txt                 # Dependencias Python
├── LICENSE
└── README.md
```

---

## Requisitos

### Python

```bash
pip install -r requirements.txt
```

Paquetes principales: `pandas>=2.0`, `numpy`, `statsmodels>=0.14`, `linearmodels>=4.27`, `scipy`, `pyyaml`.

> **Nota:** `pandas 2.2.x` no admite el parámetro `booktabs=True` en `DataFrame.to_latex()`. Los notebooks lo omiten deliberadamente.

### LaTeX

El documento principal compila con `pdflatex` + `biber`. Se requieren los paquetes estándar de TeX Live / MiKTeX más `tcolorbox`, `booktabs`, `hyperref` y `biblatex`.

---

## Replicación

### 1. Configurar rutas

Edita `notebooks/paths.yml` con la ruta raíz del proyecto en tu sistema:

```yaml
project:
  root: "/ruta/absoluta/a/av-econ-taller1"

data:
  raw: "/ruta/absoluta/a/av-econ-taller1/data/raw"

outputs:
  tables: "/ruta/absoluta/a/av-econ-taller1/outputs/tables"
```

Los notebooks leen este archivo al inicio para construir todas las rutas de forma dinámica. No es necesario modificar ninguna otra ruta en el código.

### 2. Ejecutar notebooks

Ejecuta los notebooks en orden dentro de `notebooks/`:

```bash
jupyter nbconvert --to notebook --execute notebooks/ejercicio2.ipynb
jupyter nbconvert --to notebook --execute notebooks/ejercicio3.ipynb
```

Esto regenera todos los archivos en `outputs/tables/` y `docs/tables/`.

### 3. Compilar el PDF

```bash
cd docs
pdflatex "Taller 1.tex"
biber "Taller 1"
pdflatex "Taller 1.tex"
pdflatex "Taller 1.tex"
```
