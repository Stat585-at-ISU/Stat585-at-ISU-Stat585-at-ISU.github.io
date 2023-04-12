# This script is to clean up the blog files before posting
library(dplyr)

# Remove all .git dirs in the blog
dirs <- list.dirs("blog-2023/")
gitdirs <- grep("\\.git(hub)?$", dirs)
unlink(dirs[gitdirs], recursive = T, force = T)

# remove all cache files
cache <- grep("cache", dirs, value=TRUE)
unlink(cache, recursive = T, force = T)

# Remove all license/README files
licenses <- list.files("blog-2023", "LICENSE(|.md)", full.names = T, recursive = T)
unlink(licenses)

# any files called README.* are excluded from rendering in quarto automatically.
# we actually want blog posts in README.Rmd files to show up, but only if there are no other
# Rmd files in the folder:
rmds <- list.files("blog-2023", pattern="Rmd", full.names = T, recursive = T)
dframe <- data.frame(files=rmds)
dframe <- dframe %>% mutate(
  basename = basename(files),
  dirname = dirname(files)
)
dframe <- dframe %>% group_by(dirname) %>% mutate(n = n())
rename_readme <- dframe %>% ungroup() %>% filter(n == 1, basename=="README.Rmd") %>% select(files) %>% unlist()
file.rename(rename_readme, gsub("README.Rmd", "index.Rmd", rename_readme))

unlink_readme <- dframe %>% ungroup() %>% filter(n > 1, basename=="README.Rmd") %>% select(files) %>% unlist()
unlink(unlink_readme)

# fix naming issues
rmds <- list.files("blog-2023", pattern="[qRrQ]md", full.names = T, recursive = T)
base_safe <- make.names(basename(rmds))
idx <- which(base_safe != basename(rmds))
file.rename(rmds[idx], file.path(dirname(rmds), base_safe)[idx])

# Remove other unnecessary files
otherfilepat <- "(create-file|DS_Store|gitignore|Rproj|bak)"
otherfiles <- list.files("blog-2023", otherfilepat, full.names = T, recursive = T)
unlink(otherfiles)

#####

lnfn <- dir("blog-2023", pattern="LastnameFirstname.*", full.names = TRUE, recursive = TRUE)
lnfn <- grep("Blog-", lnfn, value=TRUE)
unlink(lnfn)

# only run some files:
# quarto::quarto_render("blog-2023/Blog-4-submissions")
# quarto::quarto_render("blog-2023/Blog-10-submissions")

