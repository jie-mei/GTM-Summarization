<%@ page import="org.sum.ARESConstants" %>

<!doctype html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GTM Summarization</title>
        <meta name="description" content="summarization with GTM">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/main.css">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- App content. -->
        <h1 style="text-align:center">GTM Summarization</h1>
        <div id="content">
            <div class="viewer" id="input">
                <label for="in_text">Input</label>
                <textarea id="in_text" placeholder=
                    "Please enter your input file to be summary, or use the file chooser below."
                    ></textarea>
            </div>
            <div class="viewer" id="stop">
                <label for="stop_text">Stop Word</label>
                <textarea id="stop_text" placeholder=
                    "Please enter your stop words, or use the file chooser below."
                    ></textarea>
            </div>
            <div class="viewer" id="output">
                <label for="out_text">Output</label>
                <textarea id="out_text" placeholder=
                    "When you click the summary button below, the output will display here."
                    ></textarea>
            </div>
            <div class="controler">
                <table>
                    <tr>
                        <td align="left">
                            <input id="in_file" type="file" />
                        </td>
                        <td align="center">
                            <input id="stop_file" type="file" />
                        </td>
                        <td align="right">
                            <a id="download" href=<%= ARESConstants.SUM_OUTPUT %>  target="_blank">Download output</a>
                        </td>
                    </tr>
                </table>
                <div align="center">
                    <label for="percent" id="percent">50</label>%
                    <input type="range" id="slider" value="50" min="0" max="100">
                    <button id="run" type="button">Summarize</button>
                </div>
            </div>
        </div>
    </body>
</html>
