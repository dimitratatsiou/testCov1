
cairo_pdf("output/Q2_epicurve_all.pdf", width=9, height=6, pointsize=11)
par(mar=c(8,5,4,2))   # Check out ?par, options 'mar' and 'las'
barplot(
  sapply(min(cases$date):max(cases$date), function(d) sum(cases$date==d)),
  names.arg = seq.Date(min(cases$date), max(cases$date), by="day"),
  col="limegreen", border=NA, las=2,
  main="Επιδημική καμπύλη - σύνολο κρουσμάτων", ylab="Αριθμός κρουσμάτων"
)
mtext("Ημερομηνία λήψης δείγματος προς εργαστηριακή επιβεβαίωση", side=1, line=6)
dev.off()

cairo_pdf("output/Q2_epicurve_asymptomatic.pdf", width=9, height=6, pointsize=11)
par(mar=c(8,5,4,2))
barplot(
  sapply(min(cases$date):max(cases$date), function(d) sum(cases$date==d & !cases$symptomatic)),
  names.arg = seq.Date(min(cases$date), max(cases$date), by="day"),
  col="skyblue", border=NA, las=2,
  main="Επιδημική καμπύλη - ασυμπτωματικοί", ylab="Αριθμός κρουσμάτων"
)
mtext("Ημερομηνία λήψης δείγματος προς εργαστηριακή επιβεβαίωση", side=1, line=6)
dev.off()
