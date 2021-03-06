if OS.mac?
  require "FileUtils"
else
  require "fileutils"
end

class SourceKafka < Formula
  v = "v0.21.0"
  plugin_name = "kn-source-kafka"

  homepage "https://github.com/knative-sandbox/#{plugin_name}"
  base_url = "https://github.com/knative-sandbox/#{plugin_name}/releases/download/#{v}"

  version v

  if OS.mac?
    url "#{base_url}/#{plugin_name}-darwin-amd64"
    sha256 "62009d94134abb23f208b725ba47eb5da5ca8bf55a554300576cbc595f111069"
  else
    url "#{base_url}/#{plugin_name}-linux-amd64"
    sha256 "ac1f39208094b74f728dd71e4073b0dcee7f96fc18da3e2ab88ca4e482508695"
  end

  def install
    if OS.mac?
      FileUtils.mv("#{plugin_name}-darwin-amd64", plugin_name)
    else
      FileUtils.mv("#{plugin_name}-linux-amd64", plugin_name)
    end
    bin.install plugin_name
  end

  test do
    system "#{bin}/#{plugin_name}", "version"
  end
end