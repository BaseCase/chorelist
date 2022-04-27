hello


info on installing ruby deps in a local vendor folder [are here](https://docs.aws.amazon.com/lambda/latest/dg/ruby-package.html)



# deployment
1. open up the AWS Lambda console in a web browser
2. in project root folder:
```bash
rm function.zip
zip -r function.rb vendor/
```
3. In the web console, click "Upload from" > "zip file"
