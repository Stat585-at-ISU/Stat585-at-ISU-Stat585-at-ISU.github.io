# This script is to clean up the blog files before posting

# Remove all .git dirs in the blog
dirs <- list.dirs("blog-2023/")
gitdirs <- grep("\\.git(hub)?$", dirs)
unlink(dirs[gitdirs], recursive = T, force = T)

# Remove all license/README files
extramd <- list.files("blog-2023", "(LICENSE|README).md", full.names = T, recursive = T)
unlink(extramd)

# Remove other unnecessary files
otherfilepat <- "(create-file\\.png|\\.DS_Store|gitignore|Rproj|\\.bak)"
otherfiles <- list.files("blog-2023", otherfilepat, full.names = T, recursive = T)
unlink(otherfiles)
