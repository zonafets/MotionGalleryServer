# sauth

__S__ erver __auth__  
A very simple server for serving directories via http or https and BASIC authorization.


    $ sauth --help
    Usage: sauth [OPTIONS] USERNAME PASSWORD [IP] [PORT]

      Start http server with basic authentication current directory.

    Options:
      --https     use https
      --dir TEXT  use different directory
      --help      Show this message and exit.

### Installation

    pip install sauth 


### Usage

To serve your current directory simply run:

    $ sauth someuser somepass
    Serving "/home/user/somedir" directory on http://0.0.0.0:8333
    
You can specify port and ip to serve on with 3rd and 4th arguments:

    $ sauth someuser somepass 127.0.0.1 1234
    Serving "/home/user/somedir" directory on http://127.0.0.1:1234
