# Loading required packages
library(readxl)

# Loading the data
cases <- as.data.frame(read_excel("input/ΚΡΟΥΣΜΑΤΑ ΚΟΡΩΝΟΪΟΥ 15 05 2020-UDs-ΤΕΛΙΚΟ.xlsx"))
hosp <- as.data.frame(read_excel("input/ΝΟΣΗΛΕΙΕΣ 03-05 6.xlsx"))
icufull <- as.data.frame(read_excel("input/ICU_full_corono_FINAL.xlsx", 2))


# Some helper functions to assist us

# Function to automatically correct Excel dates
correctExcelDates <- function(x) {
  if (inherits(x, "character")) {
    return(suppressWarnings(as.Date(as.integer(x), origin="1899-12-30")))
  } else if (inherits(x, "POSIXct")) {
    return(as.Date(x))
  } else {
    stop("Ημερομηνίες με άγνωστο τύπο") # Throw error if we don't know how to handle
  }
}


# Tidying up columns and giving more handy names

cases$date <- correctExcelDates(cases[["ΗΜ/ΝΙΑ ΔΕΙΓΜΑΤΟΣ"]])
cases$sex <- factor(cases[["ΦΥΛΟ"]], levels=c("Α","Θ"), labels=c("Male", "Female"))
cases$donset <- correctExcelDates(cases[["ΕΝΑΡΞΗ ΣΥΜΠΤΩΜΑΤΩΝ"]])
# ... (continue as needed)


# Setting up a vector for symptomatic y/n
cases$symptomatic <- NA
cases$symptomatic[!is.na(cases$donset)] <- TRUE
cases$symptomatic[with(cases, is.na(donset) & !is.na(`ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- TRUE
cases$symptomatic[with(cases, is.na(donset) & grepl("ΑΣΥΜ", `ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- FALSE
cases$symptomatic[with(cases, is.na(donset) & grepl("ΟΥΔΕΝ", `ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- FALSE
cases$symptomatic[with(cases, is.na(donset) & grepl("0", `ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- FALSE
cases$symptomatic[with(cases, is.na(donset) & grepl("ΑΓΝ", `ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- NA
cases$symptomatic[with(cases, is.na(donset) & grepl("9", `ΣΥΜΠΤ /ΑΣΥΜΠΤ`))] <- NA


