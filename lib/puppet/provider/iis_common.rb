# frozen_string_literal: true

# verify if the given path is a local one
def local_path?(path)
  (path =~ /^.:(\/|\\)/)
end

# verify if the given path is an UNC one
def unc_path?(path)
  (path =~ %r{^\\\\[^\\]+\\[^\\]+})
end

# verify if the given path is a physicalpath
def verify_physicalpath
  if @resource[:physicalpath].nil? || @resource[:physicalpath].empty?
    raise('physicalpath is a required parameter')
  end

  return unless local_path?(@resource[:physicalpath])
  return if File.exist?(@resource[:physicalpath])

  raise("physicalpath doesn't exist: #{@resource[:physicalpath]}")
end
