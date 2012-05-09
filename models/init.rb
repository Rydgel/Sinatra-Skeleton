# encoding: utf-8
require 'sequel'

DB = Sequel.connect ENV['DATABASE_URL'], :encoding => 'utf-8'

# Load your models here
require_relative 'user'