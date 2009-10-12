ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'mocha'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")
require 'monkeyspecdoc'
require "authlogic/test_case"

class ActiveSupport::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  setup { Sham.reset }
end

class ActionController::TestCase
  setup :activate_authlogic
end

class Test::Unit::TestCase
  
  def self.should_be_paranoid
    klass = self.name.gsub(/Test$/, '').constantize
    
    context "A #{klass.name}" do
      should "be paranoid (it will not be deleted from the database)" do
        klass.is_paranoid
      end
    
      should "not have a value for deleted_at" do
        klass.delete_all
        #assert object = klass.find(:first)
        assert object = klass.make
        assert_nil object.deleted_at
      end
    
      context "when destroyed" do
        setup do
          #assert object = klass.find(:first)
          assert object = klass.make
          @deleted_id = object.id
          object.destroy
        end
      
        should "not be found" do
          assert_raise(ActiveRecord::RecordNotFound) { klass.find(@deleted_id) }
        end
    
        should "still exist in the database" do
          deleted_object = klass.find_with_destroyed(@deleted_id)
          assert_not_nil deleted_object.deleted_at
        end
      end
    end
  end
end
