# Modern Linux tools

**ripgrep**: ripgrep is a search tool like grep and The Silver Searcher. It searches for regular expressions in files and directories and recursively descends through them. It's optimized for speed and supports searching with PCRE2 regular expressions.

Install: `cargo install ripgrep`

Here's an example of how to use ripgrep to search for the word "example" in all the files in the current directory:

```
rg example .
```

fd: fd is a simple, fast, and user-friendly alternative to find. It's written in Rust and uses colored output by default. It can search for files and directories with a simple syntax and can also search with regular expressions.

Install: `cargo install fd-find`

Here's an example of how to use fd to search for files with the extension ".txt" in the current directory:

```
fd -e txt
```

sd: sd is a faster and more intuitive replacement for sed. It supports regular expressions and can perform search and replace operations on files and directories.

Install: `cargo install sd`

Here's an example of how to use sd to replace all occurrences of the word "foo" with "bar" in all the files in the current directory:

```
sd 'foo' 'bar' .
```

exa: exa is a modern replacement for the ls command. It's written in Rust and supports colored output, file type icons, and Git integration.

Install: `cargo install exa`

Here's an example of how to use exa to list all the files and directories in the current directory:

```
exa
```

dust: dust is a more intuitive version of du. It provides a graphical representation of disk usage and makes it easy to identify the largest files and directories on your system.

Install: `cargo install du-dust`

Here's an example of how to use dust to analyze the disk usage of the current directory:

```
dust .
```

dog: dog is a command-line DNS client that can resolve domain names and display the results in a human-readable format.

Here's an example of how to use dog to resolve the IP address of google.com:

Install: `cargo install du-dust`

```
dog google.com
```

xh: xh is a modern replacement for curl and wget. It's written in Rust and provides a user-friendly interface for sending HTTP requests and displaying the responses.

Here's an example of how to use xh to send an HTTP GET request to example.com:

Install: `cargo install zh`

```
xh https://example.com
```

ncdu: ncdu is a disk usage analyzer that provides a graphical representation of disk usage and makes it easy to identify the largest files and directories on your system.

Install: `apt install ncdu`

Here's an example of how to use ncdu to analyze the disk usage of the current directory:

```
ncdu .
```

duf: duf is a more intuitive version of df. It provides a graphical representation of disk usage and makes it easy to identify the largest files and directories on your system.

Install: `apt install duf`

Here's an example of how to use duf to analyze the disk usage of the current directory:

```
duf .
```

bat: bat is a cat clone with syntax highlighting and Git integration. It supports a wide variety of file types and can display the contents of multiple files at once.

Install: `cargo install bat`

Here's an example of how to use bat to display the contents of a file with syntax highlighting:

```
bat example.py
```
