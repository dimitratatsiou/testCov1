
cairo_pdf("output/Q3_epicurve_both.pdf", width=9, height=6, pointsize=11)
par(mar=c(8,5,4,2))   # Check out ?par, options 'mar' and 'las'
barplot(
  rbind(
    sapply(min(cases$date):max(cases$date), function(d) sum(cases$date==d)),
    sapply(min(cases$date):max(cases$date), function(d) sum(cases$date==d & !cases$symptomatic))
  ),
  names.arg = seq.Date(min(cases$date), max(cases$date), by="day"),
  beside = TRUE,
  col=c("limegreen", "skyblue"), border=NA, las=2,
  main="Επιδημική καμπύλη", ylab="Αριθμός κρουσμάτων"
)
mtext("Ημερομηνία λήψης δείγματος προς εργαστηριακή επιβεβαίωση", side=1, line=6)
legend("topleft", c("Σύνολο","Ασυμπτωματικοί"), pch=15, col=c("limegreen","skyblue"), pt.cex=2, bty="n")
dev.off()
 
