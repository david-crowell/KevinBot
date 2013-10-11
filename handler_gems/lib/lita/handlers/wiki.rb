require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'json'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module Lita
  module Handlers
    class IntrepidWiki < Handler
      route (/^\/(wiki|hr).?/), :list_documents, help: {
        "/wiki" => "Lists wiki documents"
      }

      def list_documents(response)
        username = ENV['BASECAMP_USERNAME']
        password = ENV['BASECAMP_PASSWORD']


        data = JSON.parse(open('https://basecamp.com/2384773/api/v1/projects/3783080/documents.json',
                    'User-Agent' => 'KevinBot (matt@intrepid.io)',
                    :http_basic_authentication => [username, password]).read)
        pages = Array.new
        pages.push(data.map { |e| 
          e['title'] + ' ' + e['url']
        })

        response.reply(pages.join("\n"))
      end
      Lita.register_handler(IntrepidWiki)
    end
  end
end