Yardstick ThemeKit
==================
A tiny app that makes designing Yardstick Measure themes a whole lot more enjoyable.

Setup
-----

After cloning the repo, link themekit.rb into your PATH:

    $ sudo ln -s ~/yardstick/themekit/themekit.rb /usr/bin/themekit
    $ sudo chmod +x /usr/bin/themekit

Then define the environment variable `YS_SYSTEM_CSS`.  This tells ThemeKit where on your computer the Yardstick system.css file is located.  Ex:

    export YS_SYSTEM_CSS="/absolute/path/to/yardstick/screen.css"
    
_Tip: Add this line to your ~/.profile_
    
How to use
----------

To start ThemeKit, just change into your theme directory and run it:

    $ cd ~/yardstick/themes/my_awesome_theme
    $ themekit
    
Then head to http://localhost:4567/

To test different **theme variations**, pass in the variations(s) as a space-separated list in the querystring:

    http://localhost:4567/?green people
    
or if you've got OCD:

    http://localhost:4567/?green%20people
    
These variations will be tacked onto the `<body>` tag:

    <body class="green people">

If no variation is specified, the value `"default"` will be used.
    
Supported Tags
--------------

  * {{ theme_variation }}
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