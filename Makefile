dist/function.zip: lib/*.rb function.rb
	rm -rf dist
	mkdir dist
	zip -r dist/function.zip function.rb lib/ vendor/
