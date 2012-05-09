# encoding: utf-8
require 'sequel'

DB = Sequel.connect ENV['DATABASE_URL']
DB << "SET CLIENT_ENCODING TO 'UTF8';"

# Load your models here
require_relative 'user'