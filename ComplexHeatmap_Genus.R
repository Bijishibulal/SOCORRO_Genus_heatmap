install.packages("ComplexHeatmap", "circlize")

BiocManager::install("ComplexHeatmap")
BiocManager::install("ggtree")
BiocManager::install("treeio")
BiocManager::install("colorramp2")
install.packages("colorRamps")


library(ComplexHeatmap)
library(circlize)
library(colorspace)
library(GetoptLong)


library(tibble)
as_tibble(Full_genus)
row.names(Full_genus) <- Full_genus$Genus
Full_genus_mat <- data.matrix(Full_genus)
Full_genus_matn=subset(Full_genus_mat,select=-Genus)


my_palette <- colorRampPalette(c("white",
                                 "navyblue",
                                 "pink",
                                 "orange",
                                 "red"))

ht <- Heatmap(Full_genus_matn,
        column_title = "Taxa frequency",
        column_title_gp = gpar(fontsize = 15, fontface = "bold"),
        col = my_palette(1000), 
        cluster_rows = FALSE, 
        cluster_columns = FALSE,
        row_names_max_width = unit(8, "cm"),
        row_names_gp = gpar(fontsize = 10, fontface = "bold"),
        row_names_rot = 0,
        row_names_centered = FALSE,
        column_names_side = c("bottom", "top"),
        show_column_names = TRUE,
        column_names_max_height = unit(8, "cm"),
        column_names_gp = gpar(fontsize = 10, fontface = "bold"),
        column_names_rot = 90,
        column_names_centered = FALSE,
        height = NULL,
        show_heatmap_legend = TRUE,
        border = TRUE,
        heatmap_legend_param = list(title = "Taxa Frequency", direction = "horizontal" , 
                                    title_gp = gpar(fontsize = 10, fontface = "bold",labels_gp = gpar(fontsize = 10))) ,
        left_annotation = ha_barplot,  bottom_annotation = ha1)

draw(ht, heatmap_legend_side = "bottom")

dev.off()

