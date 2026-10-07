-- What :make runs for C++ files: compile the current file with warnings on
vim.opt_local.makeprg = "g++ -Wall -g -std=c++11 -o %:r:S %:S"
