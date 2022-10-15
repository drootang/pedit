# pedit
Use a text editor to modify your `$PATH` where each directory is on its own line

## Installation

1. Copy or move `pedit.sh` to whatever location you want.
2. Add an alias to your `.profile`, `.bashrc`, *etc*. that *sources* `pedit.sh`:

    `alias pedit='source /path/to/pedit.sh`

## Usage

When you run your `pedit` alias from a shell, your `$EDITOR` will launch with a
temp file containing all directories on your `$PATH`, one per line. Make changes to the
order, remove directories, *etc*. When you are happy with the changes, save the
file and exit the editor. Your `$PATH` will be updated with the new list of
directories.

If you exit your editor without saving, or there are no valid entries, the
`$PATH` is not updated.

You can optionall specify a different path-like environment variable to edit as the
first argument on the command line, e.g.,

    pedit PYTHONPATH
