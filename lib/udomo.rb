
# Udomo is the Ultra DOcument MOdel.
# It is a generic document model which models all sorts of documents
# either individually, or as a network of documents.
# Udomo distinguishes between a Network, a Node, a Document, a Resource, 
# a Layout, and a View.
# A Network is a set of Nodes that have share links with each other.
# A node is an abstract linked element. It can be either a Document,
# a Resource, a View, or a Layout.
# A Document is an abstract semantic document, which consists of 
# semantic abstract semantic elements such has paragraphs, tables, images, or 
# lists, held in a mixed recursive tree and generic graph model.
# A Resource is a document or file, such as images, sounds, videos, etc
# that are referred to for use by other nodes.
# A View then is a concrete presentation of a Document, on paper, screen or 
# on any other medium.
# A Layout contains the necessary information to transform a Document to a View.
# A Document may have many Layouts and many Views.
require_relative 'udomo/node'
require_relative 'udomo/network'
require_relative 'udomo/resource'
require_relative 'udomo/document'
require_relative 'udomo/layout'
require_relative 'udomo/view'

module Udomo
end