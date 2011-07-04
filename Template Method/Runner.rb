require_relative 'BaseReport'
require_relative 'HtmlReport'
require_relative 'PlainTextReport'
#require_relative '.'
#require_relative '.\HtmlReport'

#report = HtmlReport.new
report = PlainTextReport.new
report.output_report
