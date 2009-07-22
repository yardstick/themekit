# Yardstick ThemeKit

A tiny app that makes designing Yardstick Measure themes a whole lot more enjoyable.

## Setup

After cloning the repo, just install the gem:

    $ sudo gem install themekit-[version].gem

Then define the environment variable `YS_SYSTEM_CSS`.  This tells ThemeKit where on your computer the Yardstick system.css file is located:

    export YS_SYSTEM_CSS="/absolute/path/to/yardstick/screen.css"
    
_Tip: Add this line to your ~/.profile_

## Creating a Theme

Create a new Theme by passing the name (alphanumeric) to ThemeKit:

    $ themekit my_awesome_theme
    
This will create a new directory, `my_awesome_theme`, which is a fully-functioning skeleton Theme that can be customized.

The first thing you should do is edit your theme's name in `info.yml`.

The following files are required:
    
  * `info.yml` - Defines your Theme's name & available variations.
  * `theme.html` - Theme's markup & template tags.
  * `styles.css` - Theme's stylesheet.  This should contain the styles for all variations.

## Running the server

To start ThemeKit, just change into your theme directory and run it:

    $ cd ~/yardstick/themes/my_awesome_theme
    $ themekit
    
Then head to http://localhost:4567/

## Theme Variations

To test different **theme variations**, pass in the variations(s) as a space-separated list in the querystring:

    http://localhost:4567/?green people
    
or if you've got OCD:

    http://localhost:4567/?green%20people
    
These variations will be tacked onto the `<body>` tag:

    <body class="green people">

If no variation is specified, the value `"default"` will be used.  You can use the `body.[variation] [selector]` technique to style elements differently depending on the active variation:

    body.people { background: url(people.jpg); }
    body.medical { background: url(medical.jpg); }
    
    body.green h1 { color: green; }
    body.blue h1 { color: blue; }
    
## Supported Tags

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
  
  
## Automatic Screenshots

**Requires [PyYaML](http://pyyaml.org/wiki/PyYAML)**

ThemeKit can automatically take screenshots of your Theme, in all its variations.  For example, if `info.yml` contains:

    variations:
      colors:
        red: Red
        green: Green
        grey: Grey
        blue: Blue
      industries:
        industrial: Industrial
        medical: Medical

ThemeKit will take 8 screenshots (4 colors x 2 industries).

### Setup

You must symlink two executables from ThemeKit into your path:

    $ sudo ln -s ~/yardstick/themekit/bin/webkit2png /usr/bin/webkit2png
    $ sudo ln -s ~/yardstick/themekit/bin/screenshots /usr/bin/screenshots

### Taking Screenshots

From within your Theme directory, just type:

    $ screenshots

This will read `info.yml` and determine all the possible variations your theme has and save a screenshot of each.  Screenshots are saved to a subdirectory of your theme, aptly named `screenshots`.

**Each time you generate screenshots, existing screenshots will be deleted.**