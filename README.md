Yardstick ThemeKit
==================
A cute lil app that makes desining Yardstick Measure themes a whole lot more enjoyable.

Setup
-----

After cloning the repo, link themekit.rb into your PATH:

    $ sudo ln -s ~/yardstick/themekit/themekit.rb /usr/bin/themekit
    $ sudo chmod +x /usr/bin/themekit

Then define the environment variable `YS_SYSTEM_CSS`.  This tells ThemeKit where on your computer the Yardstick system.css file is located.  Ex:

    export YS_SYSTEM_CSS="/absolute/path/to/yardstick/screen.css"
    
_Tip: Add this line to your ~/.profile_
    
Usage
-----

To start ThemeKit, just change into your theme directory and run it:

    $ cd ~/yardstick/themes/my_awesome_theme
    $ themekit
    
Then head to http://localhost:4567/
    
Supported Tags
--------------

  * {{ title }}
  * {{ page.title }}
  * {% image image\_data\_id [default image path] %}
  * {% text text\_data\_id [default text] %}
  * {% page_meta %}
  * {% menu main %}
  * {% menu account %}
  * {{ page.content }}
  * {{ system_stylesheet_path }}
  * {{ stylesheet_path }}