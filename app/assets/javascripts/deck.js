// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require websocket_rails/main
	

// Full list of configuration options available here:
// https://github.com/hakimel/reveal.js#configuration
Reveal.initialize({
	controls: true,
	progress: true,
	history: true,
	
	theme: Reveal.getQueryHash().theme || 'default', // available themes are in /css/theme
	transition: Reveal.getQueryHash().transition || 'default', // default/cube/page/concave/linear(2d)

	// Optional libraries used to extend on reveal.js
	dependencies: [
		{ src: 'http://infamousamos.github.io/presentations/lib/js/highlight.js', async: true, callback: function() { window.hljs.initHighlightingOnLoad(); } },
    { src: 'http://infamousamos.github.io/presentations/lib/js/classList.js', condition: function() { return !document.body.classList; } },
    { src: 'http://infamousamos.github.io/presentations/lib/js/showdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
    { src: 'http://infamousamos.github.io/presentations/lib/js/data-markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
	]
});