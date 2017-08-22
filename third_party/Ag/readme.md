Usage

ag [OPTIONS] PATTERN [PATH]

Recursively search for PATTERN in PATH.
Like grep or ack, but faster.

Example: ag -i foo /bar/

Search options:

--ackmate               Print results in AckMate-parseable format
-a --all-types          Search all files (doesn't include hidden files
                        or patterns from ignore files)
-A --after [LINES]      Print lines before match (Default: 2)
-B --before [LINES]     Print lines after match (Default: 2)
--[no]break             Print newlines between matches in different files
                        (Enabled by default)
--[no]color             Print color codes in results (Enabled by default)
--color-line-number     Color codes for line numbers (Default: 1;33)
--color-match           Color codes for result match numbers (Default: 30;43)
--color-path            Color codes for path names (Default: 1;32)
--column                Print column numbers in results
--line-numbers          Print line numbers even for streams
-C --context [LINES]    Print lines before and after matches (Default: 2)
-D --debug              Ridiculous debugging (probably not useful)
--depth NUM             Search up to NUM directories deep (Default: 25)
-f --follow             Follow symlinks
--[no]group             Same as --[no]break --[no]heading
-g PATTERN              Print filenames matching PATTERN
-G, --file-search-regex PATTERN Limit search to filenames matching PATTERN
--[no]heading
--hidden                Search hidden files (obeys .*ignore files)
-i, --ignore-case       Match case insensitively
--ignore PATTERN        Ignore files/directories matching PATTERN
                        (literal file/directory names also allowed)
--ignore-dir NAME       Alias for --ignore for compatibility with ack.
-l --files-with-matches Only print filenames that contain matches
                        (don't print the matching lines)
-L --files-without-matches
                        Only print filenames that don't contain matches
-m --max-count NUM      Skip the rest of a file after NUM matches (Default: 10,000)
--no-numbers            Don't show line numbers
-p --path-to-agignore STRING
                        Use .agignore file at STRING
--print-long-lines      Print matches on very long lines (Default: >2k characters)
-Q --literal            Don't parse PATTERN as a regular expression
-s --case-sensitive     Match case sensitively (Enabled by default)
-S --smart-case         Match case insensitively unless PATTERN contains
                        uppercase characters
--search-binary         Search binary files for matches
--stats                 Print stats (files scanned, time taken, etc.)
-t --all-text           Search all text files (doesn't include hidden files)
-u --unrestricted       Search all files (ignore .agignore, .gitignore, etc.;
                        searches binary and hidden files as well)
-U --skip-vcs-ignores   Ignore VCS ignore files
                        (.gitigore, .hgignore, .svnignore; still obey .agignore)
-v --invert-match
-w --word-regexp        Only match whole words
-z --search-zip         Search contents of compressed (e.g., gzip) files
