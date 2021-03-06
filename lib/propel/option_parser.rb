require 'optparse'

module Propel
  class OptionParser

    def self.parse!(args = [ ])
      new.parse!(args)
    end

    def parse!(args)
      options = {}
      parser(options).parse!(args)
      options
    end

    def parser(options)
      ::OptionParser.new do |parser|
        parser.banner = "Usage: propel [options]\n\n"

        parser.on('-c', '--[no-]color', '--[no-]colour', 'Toggle colored output. Color is off by default.') do |o|
          options[:color] = o
        end

        parser.on('-f', '--fix-ci', 'When CI is broken use --fix-ci to fix the build.') do |o|
          options[:fix_ci] = o
        end

        parser.on('-r', '--[no-]rebase', 'Use --no-rebase when you don\'t want to rebase.  Rebase is used by default.') do |o|
          options[:rebase] = o
        end

        parser.on('-s', '--status-url STATUS_URL', 'Location of build status feed.') do |build_status_url|
          options[:status_url] = build_status_url
        end

        parser.on('-v', '--[no-]verbose', 'Turn on verbose output from git.') do |o|
          options[:verbose] = o
        end

        parser.on('-w', '--[no-]wait', 'Waits for fixes to remote build.') do |o|
          options[:wait] = o
        end
      end
    end
  end
end