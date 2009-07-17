#!/usr/bin/env ruby -wKU

SYSTEM_STYLESHEET = ENV["YS_SYSTEM_CSS"]
if SYSTEM_STYLESHEET.nil?
  puts "\n** WHUPS! You need to set the 'YS_SYSTEM_CSS' environment variable."
  puts "This tells ThemeKit where the Yardstick 'system.css' file is located."
  puts "Example: export YS_SYSTEM_CSS=\"~/path/to/system.css\"\n\n"
  Process.exit(0)
end

require 'rubygems'
require 'sinatra'

META_TAGS = <<-EOS
<meta name="keywords" content="themes, yardstick, server, design" />
<meta name="description" content="This is the Yardstick Measure Theme Server." />
EOS

MAIN_NAV = <<-EOS
<ul id="ys-menu_main" class="ys-menu">
  <li class="active ys-menuItem"><a href="/tincidunt-orci-quis-lectus-nullam">Home</a></li>
  <li class="ys-menuItem"><a href="#">Products</a></li>
  <li class="ys-menuItem"><a href="#">Services</a></li>
  <li class="ys-menuItem"><a href="#">Our Company</a></li>
  <li class="ys-menuItem"><a href="#">Contact Us</a></li>
</ul>
EOS

USER_NAV = <<-EOS
<ul id="ys-menu_account" class="ys-menu">
  <li class="ys-menuItem"><a href="/login">Login</a></li>
  <li class="ys-menuItem"><a href="/login">Sign up</a></li>
</ul>
EOS

DUMMY_HTML = <<-EOS
<!-- START DUMMY CONTENT -->
<p>Lorem ipsum dolor sit amet, <a href="#">claritas ut aliquam</a> consectetuer magna. Quis per me placerat humanitatis est sed. Usus claritatem habent aliquip te veniam tincidunt adipiscing eu. Blandit minim cum facer nisl in feugiat nihil eleifend. Eua nunc consuetudium non molestie iusto claram eleifend claritas eorum, id.</p>
<h2>Heading Level 2</h2>
<p>It's time for some <strong>strong</strong> text and some <em>emphasized</em> text.</p>
<p>Enim autem littera erat elit ii nihil sequitur molestie dignissim magna. Ad, et, facilisi ex aliquip fiant decima hendrerit habent. Praesent sollemnes tincidunt at. Parum quod, formas imperdiet suscipit te velit. Nunc delenit me est demonstraverunt formas minim non. Eros legunt iriure at lorem notare.</p>
<p>Here's a table:</p>
<table>
<caption>The awesome people of Yardstick</caption>
<thead>
<tr>
<th>Name</th>
<th>Languages</th>
<th>Awesome Factor</th>
</tr>
</thead>
<tbody>
<tr>
<th>Kyle</th>
<td>Python</td>
<td>11</td>
</tr>
<tr>
<th>Paul</th>
<td>Ruby</td>
<td>10.5</td>
</tr>
<tr>
<th>Nolan</th>
<td>Photoshop</td>
<td>11</td>
</tr>
<tr>
<th>Ben</th>
<td>ColdFusion</td>
<td>11</td>
</tr>
<tr>
<th>Don</th>
<td>ColdFusion</td>
<td>11</td>
</tr>
</tbody>
</table>
<p>Here's a quote:</p>
<blockquote>
<p>Enim autem littera erat elit ii nihil sequitur molestie dignissim magna. Ad, et, facilisi ex aliquip fiant decima hendrerit habent. Praesent sollemnes tincidunt at. Parum quod, formas imperdiet suscipit te velit. Nunc delenit me est demonstraverunt formas minim non. Eros legunt iriure at lorem notare.</p>
</blockquote>
<h3>Heading Level 3</h3>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>
<h4>Heading Level 4</h4>
<p>Et, investigationes nostrud, parum eros assum, claritas lius. Facit facer euismod eu id, nulla. Adipiscing, littera ii consectetuer typi in praesent, aliquam. Mirum erat minim eum duis. Nisl ex delenit te, me velit est typi. Non at hendrerit ad soluta nibh qui cum, eua.</p>
<h5>Heading Level 5</h5>
<p>Et, investigationes nostrud, parum eros assum, claritas lius. Facit facer euismod eu id, nulla. Adipiscing, littera ii consectetuer typi in praesent, aliquam. Mirum erat minim eum duis. Nisl ex delenit te, me velit est typi. Non at hendrerit ad soluta nibh qui cum, eua.</p>
<h6>Heading Level 6</h6>
<p>Et, investigationes nostrud, parum eros assum, claritas lius. Facit facer euismod eu id, nulla. Adipiscing, littera ii consectetuer typi in praesent, aliquam. Mirum erat minim eum duis. Nisl ex delenit te, me velit est typi. Non at hendrerit ad soluta nibh qui cum, eua.</p>
<ul>
<li>Milk</li>
<li>Bread</li>
<li>Eggs</li>
<li>Veggies
<ul>
<li>Peppers</li>
<li>Cucumbers</li>
<li>Radishes</li>
</ul>
</li>
<li>Cookies</li>
</ul>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>
<ol>
<li>Milk</li>
<li>Bread</li>
<li>Eggs</li>
<li>Veggies
<ul>
<li>Peppers</li>
<li>Cucumbers</li>
<li>Radishes</li>
</ul>
</li>
<li>Cookies</li>
</ol>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>
<h2>A block image followed by an inline image</h2>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>  
<p><img alt="none" src="http://farm4.static.flickr.com/3253/2496907243_5efbbab5cd.jpg" /></p>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>  
<p><img alt="none" src="http://farm4.static.flickr.com/3253/2496907243_5efbbab5cd_t.jpg" /> This image should be floating, but that's something the user can specify in the WYSIWYG editor, or the theme can define the float.  Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>
<p>Lectores, doming quarta, ad possim cum eua esse. Et quod eu quis id aliquip ii liber. In ex te, sequitur sed me feugiat ipsum molestie elit legentis. Lectorum praesent est eros non lorem. At possim soluta illum per ad. Amet tincidunt cum eua nibh mutationem.</p>  
<!-- END DUMMY CONTENT -->
EOS

get '/*' do
  
  THEME_DIRECTORY = Dir.pwd  
  
  # Get the path they're requesting.
  # If the path is empty, ie: "/", default to theme.html
  path = params[:splat][0]
  path = "theme.html" if path.length == 0
  
  
  if path == "system.css"
    file_path = SYSTEM_STYLESHEET
  else
    file_path = File.join(THEME_DIRECTORY, path)
  end
  
  # Everything *except* theme.html can be statically served.
  return send_file(file_path) unless path == "theme.html"
  
  html = File.open(file_path).read()
  html.gsub!(/\{\{\s*title\s*\}\}/, "Welcome | CompuGlobal Exams")                # {{ title }}
  html.gsub!(/\{\{\s*page.title\s*\}\}/, "Welcome to my website")                 # {{ page.title }}
  html.gsub!(/\{%\s*image image_data_id, (\w.*)\s*%\}/, "<img src=\"\\1\" />")    # {% image ... %}
  html.gsub!(/\{%\s*text text_data_id, (\w.*)\s*%\}/, "\\1")                      # {% text ... %}
  html.gsub!(/\{%\s*page_meta\s*%\}/, META_TAGS)                                  # {% page_meta %}
  html.gsub!(/\{%\s*menu main\s*%\}/, MAIN_NAV)                                   # {% menu main %}
  html.gsub!(/\{%\s*menu account\s*%\}/, USER_NAV)                                # {% menu account %}
  html.gsub!(/\{\{\s*page.content\s*\}\}/, DUMMY_HTML)                            # {{ page.content }}
  html.gsub!(/\{\{\s*system_stylesheet_path\s*\}\}/, "system.css")                # {{ system_stylesheet_path }}
  html.gsub!(/\{\{\s*stylesheet_path\s*\}\}/, "styles.css")                       # {{ stylesheet_path }}
  
  return html
  
end